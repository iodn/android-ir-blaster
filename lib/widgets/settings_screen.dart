import 'dart:async';
import 'package:flutter/material.dart';
import 'package:irblaster_controller/l10n/app_localizations.dart';
import 'package:irblaster_controller/l10n/l10n.dart';
import 'package:irblaster_controller/state/app_locale.dart';
import 'package:irblaster_controller/state/orientation_pref.dart';
import 'package:flutter/services.dart';
import 'package:irblaster_controller/state/haptics.dart';
import 'package:irblaster_controller/state/app_theme.dart';
import 'package:irblaster_controller/state/dynamic_color.dart';
import 'package:irblaster_controller/state/macros_state.dart';
import 'package:irblaster_controller/state/remotes_state.dart';
import 'package:irblaster_controller/utils/ir_transmitter_platform.dart';
import 'package:irblaster_controller/utils/macros_io.dart';
import 'package:irblaster_controller/utils/remote.dart';
import 'package:irblaster_controller/utils/remotes_io.dart';
import 'package:irblaster_controller/widgets/about_screen.dart';
import 'package:irblaster_controller/widgets/settings/widgets/donation_sheet.dart';
import 'package:irblaster_controller/widgets/settings/widgets/section_card.dart';
import 'package:irblaster_controller/widgets/settings/widgets/support_pill.dart';
import 'package:irblaster_controller/widgets/universal_power_screen.dart';
import 'package:irblaster_controller/widgets/device_controls_screen.dart';
import 'package:irblaster_controller/widgets/quick_settings_screen.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const String _repoUrl = 'https://github.com/iodn/android-ir-blaster';
  static const String _issuesUrl = 'https://github.com/iodn/android-ir-blaster/issues';
  static const String _licenseUrl = 'https://github.com/iodn/android-ir-blaster/blob/master/LICENSE';
  static const String _companyUrl = 'https://neroswarm.com';
  static const String _creatorName = 'KaijinLab Inc.';
  static const String _liberapayUrl = 'https://liberapay.com/KaijinLab/donate';
  static const String _btcAddress = 'bc1qtf79uecssueu4u4u86zct46vcs0vcd2cnmvw6f';
  static const String _ethAddress = '0xCaCc52Cd2D534D869a5C61dD3cAac57455f3c2fD';
  static const Map<String, String> _languageNativeNames = <String, String>{
    'en': 'English',
    'fr': 'Français',
    'es': 'Español',
    'de': 'Deutsch',
    'it': 'Italiano',
    'pt': 'Português',
    'pt_BR': 'Português (Brasil)',
    'ja': '日本語',
    'ko': '한국어',
    'zh': '中文',
    'ru': 'Русский',
    'ar': 'العربية',
    'ar_EG': 'العربية (مصر)',
    'hi': 'हिन्दी',
    'id': 'Bahasa Indonesia',
    'ms': 'Bahasa Melayu',
    'th': 'ไทย',
    'tr': 'Türkçe',
    'vi': 'Tiếng Việt',
  };

  Future<void> _launchUrl(BuildContext context, String url) async {
    try {
      final uri = Uri.parse(url);
      final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!launched) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.l10n.noBrowserAvailable),
            backgroundColor: Theme.of(context).colorScheme.error,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(context.l10n.failedToOpen(e.toString())),
          backgroundColor: Theme.of(context).colorScheme.error,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Future<void> _copyToClipboard(
    BuildContext context, {
    required String text,
    required String message,
  }) async {
    await Clipboard.setData(ClipboardData(text: text));
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
    await Haptics.selectionClick();
  }

  Future<bool> _confirmAction(
    BuildContext context, {
    required String title,
    required String message,
    required String confirmLabel,
    IconData icon = Icons.warning_amber_rounded,
    bool destructive = false,
  }) async {
    final theme = Theme.of(context);
    return await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        icon: Icon(
          icon,
          color: destructive ? theme.colorScheme.error : theme.colorScheme.primary,
          size: 32,
        ),
        title: Text(title),
        content: Text(message, style: theme.textTheme.bodyMedium),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(context.l10n.cancel),
          ),
          FilledButton.tonal(
            onPressed: () => Navigator.of(ctx).pop(true),
            style: destructive
                ? FilledButton.styleFrom(
                    backgroundColor: theme.colorScheme.errorContainer,
                    foregroundColor: theme.colorScheme.onErrorContainer,
                  )
                : null,
            child: Text(confirmLabel),
          ),
        ],
      ),
    ).then((v) => v ?? false);
  }

  Future<void> _doImport(BuildContext context) async {
    final result = await importRemotesFromPicker(context, current: remotes);
    if (result == null) return;

    final isFailure = result.message.toLowerCase().contains('failed') ||
        result.message.toLowerCase().contains('unsupported') ||
        result.message.toLowerCase().contains('invalid');

    if (result.remotes.isEmpty && isFailure) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result.message)));
      return;
    }

    remotes = result.remotes;
    await writeRemotelist(remotes);
    remotes = await readRemotes();
    notifyRemotesChanged();

    if (result.macros != null) {
      await writeMacrosList(result.macros!);
      final freshMacros = await readMacros();
      setMacros(freshMacros);
    }

    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result.message)));
  }

  Future<void> _doBulkImportFolder(BuildContext context) async {
    final result = await importRemotesFromFolderPicker(context, current: remotes);
    if (result == null) return;

    final isFailure = result.message.toLowerCase().contains('failed') ||
        result.message.toLowerCase().contains('unsupported') ||
        result.message.toLowerCase().contains('invalid');

    if (result.remotes.isEmpty && isFailure) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result.message)));
      return;
    }

    remotes = result.remotes;
    await writeRemotelist(remotes);
    remotes = await readRemotes();
    notifyRemotesChanged();

    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result.message)));
  }

  Future<void> _doExport(BuildContext context) async {
    await exportRemotesToDownloads(
      context,
      remotes: remotes,
      macros: macros,
    );
  }

  Future<void> _restoreDemoRemote(BuildContext context) async {
    final l10n = context.l10n;
    final confirmed = await _confirmAction(
      context,
      title: l10n.settingsRestoreDemoTitle,
      message: l10n.settingsRestoreDemoMessage,
      confirmLabel: l10n.settingsRestoreDemoConfirm,
      icon: Icons.restore_rounded,
      destructive: true,
    );
    if (!confirmed) return;

    remotes = writeDefaultRemotes(demoRemoteName: l10n.demoRemoteName);
    await writeRemotelist(remotes);
    notifyRemotesChanged();

    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.settingsDemoRemotesRestored)));
  }

  Future<void> _deleteAllRemotes(BuildContext context) async {
    final confirmed = await _confirmAction(
      context,
      title: context.l10n.settingsDeleteAllRemotesTitle,
      message: context.l10n.settingsDeleteAllRemotesMessage,
      confirmLabel: context.l10n.settingsDeleteAllConfirm,
      icon: Icons.delete_forever,
      destructive: true,
    );
    if (!confirmed) return;

    remotes = <Remote>[];
    await writeRemotelist(remotes);
    notifyRemotesChanged();

    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(context.l10n.settingsAllRemotesDeleted)));
  }

  void _openDonationSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      showDragHandle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      builder: (ctx) {
        return FractionallySizedBox(
          heightFactor: 0.92,
          child: DonationSheet(
            repoUrl: _repoUrl,
            btcAddress: _btcAddress,
            ethAddress: _ethAddress,
            liberapayUrl: _liberapayUrl,
            onCopy: (text, message) => _copyToClipboard(ctx, text: text, message: message),
          ),
        );
      },
    );
  }

  Future<void> _changeTheme(BuildContext context, ThemeMode mode) async {
    await AppThemeController.instance.setMode(mode);
    await Haptics.selectionClick();
  }

  Future<void> _changeAppLanguage(BuildContext context, Locale? locale) async {
    await AppLocaleController.instance.setOverride(locale);
    await Haptics.selectionClick();
  }

  Future<void> _setFollowSystemLanguage(BuildContext context, bool value) async {
    if (value) {
      await _changeAppLanguage(context, null);
      return;
    }
    final activeLocale = AppLocaleController.instance.resolveActiveLocale(
      AppLocalizations.supportedLocales.toList(),
      Localizations.localeOf(context),
    );
    await _changeAppLanguage(context, activeLocale);
  }

  Future<void> _openLanguagePicker(BuildContext context) async {
    final locales = AppLocalizations.supportedLocales.toList()
      ..sort((a, b) => _getLanguageName(context, a).compareTo(_getLanguageName(context, b)));
    Locale? selected = AppLocaleController.instance.overrideLocale ??
        AppLocaleController.instance.resolveActiveLocale(locales, Localizations.localeOf(context));
    String query = '';

    final picked = await showModalBottomSheet<Locale>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: true,
      builder: (ctx) {
        final theme = Theme.of(ctx);
        return StatefulBuilder(
          builder: (ctx2, setModal) {
            final filtered = locales.where((locale) {
              final q = query.trim().toLowerCase();
              if (q.isEmpty) return true;
              final label = _getLanguageName(ctx2, locale).toLowerCase();
              final code = locale.toLanguageTag().toLowerCase();
              return label.contains(q) || code.contains(q);
            }).toList(growable: false);

            return Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 8,
                bottom: 16 + MediaQuery.of(ctx2).viewInsets.bottom,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          context.l10n.chooseAppLanguage,
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                      IconButton(
                        tooltip: context.l10n.close,
                        onPressed: () => Navigator.of(ctx2).pop(),
                        icon: const Icon(Icons.close_rounded),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    onChanged: (value) => setModal(() => query = value),
                    decoration: InputDecoration(
                      hintText: context.l10n.searchLanguages,
                      prefixIcon: const Icon(Icons.search_rounded),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (filtered.isEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: Text(
                        context.l10n.noLanguagesFound,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    )
                  else
                    Flexible(
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: filtered.length,
                        separatorBuilder: (_, __) => const Divider(height: 0),
                        itemBuilder: (ctx3, index) {
                          final locale = filtered[index];
                          final isSelected = selected == locale;
                          return ListTile(
                            leading: Icon(
                              Icons.translate_rounded,
                              color: isSelected ? theme.colorScheme.primary : null,
                            ),
                            title: Text(_getLanguageName(ctx3, locale)),
                            subtitle: Text(locale.toLanguageTag()),
                            trailing: isSelected ? const Icon(Icons.check_rounded) : null,
                            onTap: () => Navigator.of(ctx3).pop(locale),
                          );
                        },
                      ),
                    ),
                ],
              ),
            );
          },
        );
      },
    );

    if (picked == null || !context.mounted) return;
    await _changeAppLanguage(context, picked);
  }

  String _getThemeName(BuildContext context, ThemeMode mode) {
    switch (mode) {
      case ThemeMode.system:
        return context.l10n.themeAuto;
      case ThemeMode.light:
        return context.l10n.themeLight;
      case ThemeMode.dark:
        return context.l10n.themeDark;
    }
  }

  IconData _getThemeIcon(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.system:
        return Icons.auto_awesome_rounded;
      case ThemeMode.light:
        return Icons.light_mode_rounded;
      case ThemeMode.dark:
        return Icons.dark_mode_rounded;
    }
  }

  String _getThemeDescription(BuildContext context, ThemeMode mode) {
    switch (mode) {
      case ThemeMode.system:
        return context.l10n.themeDescAuto;
      case ThemeMode.light:
        return context.l10n.themeDescLight;
      case ThemeMode.dark:
        return context.l10n.themeDescDark;
    }
  }

  String _getThemeHint(BuildContext context, ThemeMode mode) {
    switch (mode) {
      case ThemeMode.system:
        return context.l10n.themeHintAuto;
      case ThemeMode.light:
        return context.l10n.themeHintLight;
      case ThemeMode.dark:
        return context.l10n.themeHintDark;
    }
  }

  String _getLanguageName(BuildContext context, Locale? locale) {
    if (locale == null) return context.l10n.languageAuto;
    final tag = locale.toLanguageTag().replaceAll('-', '_');
    final exactName = _languageNativeNames[tag];
    if (exactName != null) return exactName;
    final languageName =
        _languageNativeNames[locale.languageCode] ?? locale.languageCode.toUpperCase();
    final countryCode = locale.countryCode;
    if (countryCode == null || countryCode.isEmpty) return languageName;
    return '$languageName (${countryCode.toUpperCase()})';
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.settingsTitle)),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          _buildSupportSection(context),
          const SizedBox(height: 10),
          _buildAppearanceSection(context),
          const SizedBox(height: 10),
          _buildLocalizationSection(context),
          const SizedBox(height: 10),
          _buildInteractionSection(context),
          const SizedBox(height: 10),
          _buildIrTransmitterSection(context, cs),
          const SizedBox(height: 10),
          _buildRemotesSection(context),
          const SizedBox(height: 10),
          _buildDeviceControlsSection(context),
          const SizedBox(height: 10),
          _buildQuickSettingsSection(context),
          const SizedBox(height: 10),
          _buildTvKillSection(context),
          const SizedBox(height: 10),
          _buildAboutSection(context),
          const SizedBox(height: 18),
        ],
      ),
    );
  }

  Widget _buildSupportSection(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SectionCard(
        title: context.l10n.supportDevelopmentTitle,
        subtitle: context.l10n.supportDevelopmentSubtitle,
        leading: Icon(Icons.volunteer_activism_rounded, color: cs.primary),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      cs.secondaryContainer.withValues(alpha: 0.7),
                      cs.secondaryContainer.withValues(alpha: 0.4),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: cs.outlineVariant.withValues(alpha: 0.3)),
                ),
                child: Text(
                  context.l10n.supportDevelopmentBody,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: cs.onSecondaryContainer,
                    fontWeight: FontWeight.w600,
                    height: 1.3,
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: () => _openDonationSheet(context),
                      icon: const Icon(Icons.favorite_rounded),
                      label: Text(context.l10n.donate),
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => _launchUrl(context, _repoUrl),
                      onLongPress: () => _copyToClipboard(
                        context,
                        text: _repoUrl,
                        message: context.l10n.repositoryLinkCopied,
                      ),
                      icon: const Icon(Icons.star_border_rounded),
                      label: Text(context.l10n.starRepo),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  SupportPill(icon: Icons.lock_outline_rounded, label: context.l10n.supportPillLocalOnly),
                  SupportPill(icon: Icons.shield_outlined, label: context.l10n.supportPillNoTracking),
                  SupportPill(icon: Icons.memory_rounded, label: context.l10n.supportPillHardwareAware),
                  SupportPill(icon: Icons.code_rounded, label: context.l10n.supportPillOpenSource),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppearanceSection(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AnimatedBuilder(
        animation: AppThemeController.instance,
        builder: (context, _) {
          final mode = AppThemeController.instance.mode;

          return SectionCard(
            title: context.l10n.appearanceTitle,
            subtitle: context.l10n.appearanceSubtitle,
            leading: Icon(Icons.palette_outlined, color: cs.primary),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          cs.primaryContainer.withValues(alpha: 0.6),
                          cs.primaryContainer.withValues(alpha: 0.3),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: cs.primary.withValues(alpha: 0.3)),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: cs.primary,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            _getThemeIcon(mode),
                            size: 20,
                            color: cs.onPrimary,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _getThemeName(context, mode),
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: cs.onPrimaryContainer,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                _getThemeDescription(context, mode),
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: cs.onPrimaryContainer.withValues(alpha: 0.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SwitchListTile.adaptive(
                    secondary: const Icon(Icons.wallpaper_rounded),
                    title: Text(context.l10n.useDynamicColors),
                    value: DynamicColorController.instance.enabled,
                    onChanged: (v) async {
                      await DynamicColorController.instance.setEnabled(v);
                      await Haptics.selectionClick();
                    },
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: _ThemeOptionCard(
                          icon: Icons.auto_awesome_rounded,
                          label: context.l10n.themeChoiceAuto,
                          isSelected: mode == ThemeMode.system,
                          onTap: () => _changeTheme(context, ThemeMode.system),
                          theme: theme,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _ThemeOptionCard(
                          icon: Icons.light_mode_rounded,
                          label: context.l10n.themeChoiceLight,
                          isSelected: mode == ThemeMode.light,
                          onTap: () => _changeTheme(context, ThemeMode.light),
                          theme: theme,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _ThemeOptionCard(
                          icon: Icons.dark_mode_rounded,
                          label: context.l10n.themeChoiceDark,
                          isSelected: mode == ThemeMode.dark,
                          onTap: () => _changeTheme(context, ThemeMode.dark),
                          theme: theme,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: cs.surfaceContainerHighest.withValues(alpha: 0.4),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: cs.outlineVariant.withValues(alpha: 0.3)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.lightbulb_outline, size: 16, color: cs.primary),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            _getThemeHint(context, mode),
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: cs.onSurfaceVariant,
                              height: 1.3,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildIrTransmitterSection(BuildContext context, ColorScheme cs) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SectionCard(
        title: context.l10n.irTransmitterTitle,
        subtitle: context.l10n.irTransmitterSubtitle,
        leading: Icon(Icons.settings_input_antenna_rounded, color: cs.primary),
        child: const _IrTransmitterCard(),
      ),
    );
  }

  Widget _buildLocalizationSection(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AnimatedBuilder(
        animation: AppLocaleController.instance,
        builder: (context, _) {
          final localeOverride = AppLocaleController.instance.overrideLocale;
          final usingSystemLanguage = localeOverride == null;
          final activeLocale = AppLocaleController.instance.resolveActiveLocale(
            AppLocalizations.supportedLocales.toList(),
            Localizations.localeOf(context),
          );
          final effectiveLocale = localeOverride ?? activeLocale;

          return SectionCard(
            title: context.l10n.localizationTitle,
            subtitle: context.l10n.localizationSubtitle,
            leading: Icon(Icons.language_rounded, color: cs.primary),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          cs.tertiaryContainer.withValues(alpha: 0.55),
                          cs.tertiaryContainer.withValues(alpha: 0.25),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: cs.tertiary.withValues(alpha: 0.28)),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: cs.tertiary,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.translate_rounded,
                            size: 20,
                            color: cs.onTertiary,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                usingSystemLanguage
                                    ? context.l10n.localizationAutoUsing(_getLanguageName(context, effectiveLocale))
                                    : _getLanguageName(context, effectiveLocale),
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: cs.onTertiaryContainer,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                usingSystemLanguage
                                    ? context.l10n.localizationAutoDescription
                                    : context.l10n.localizationManualDescription,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: cs.onTertiaryContainer.withValues(alpha: 0.82),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  SwitchListTile.adaptive(
                    secondary: const Icon(Icons.settings_suggest_rounded),
                    title: Text(context.l10n.useSystemLanguageTitle),
                    subtitle: Text(
                      usingSystemLanguage
                          ? context.l10n.useSystemLanguageEnabled(_getLanguageName(context, activeLocale))
                          : context.l10n.useSystemLanguageDisabled,
                    ),
                    value: usingSystemLanguage,
                    onChanged: (value) => _setFollowSystemLanguage(context, value),
                  ),
                  ListTile(
                    leading: const Icon(Icons.manage_search_rounded),
                    enabled: !usingSystemLanguage,
                    title: Text(context.l10n.chooseAppLanguage),
                    subtitle: Text(
                      usingSystemLanguage
                          ? context.l10n.languagePickerDisabledHint
                          : _getLanguageName(context, effectiveLocale),
                    ),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: usingSystemLanguage ? null : () => _openLanguagePicker(context),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: cs.surfaceContainerHighest.withValues(alpha: 0.4),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: cs.outlineVariant.withValues(alpha: 0.3)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.info_outline_rounded, size: 16, color: cs.primary),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            context.l10n.localizationHint,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: cs.onSurfaceVariant,
                              height: 1.3,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildInteractionSection(BuildContext context) {
    final orientationCtrl = RemoteOrientationController.instance;
    final cs = Theme.of(context).colorScheme;
    unawaited(HapticsController.instance.refreshDiagnostics(notify: false));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SectionCard(
        title: context.l10n.interactionTitle,
        subtitle: context.l10n.interactionSubtitle,
        leading: Icon(Icons.vibration_rounded, color: cs.primary),
        child: Column(
          children: [
            AnimatedBuilder(
              animation: HapticsController.instance,
              builder: (context, _) {
                final enabled = HapticsController.instance.enabled;
                final intensity = HapticsController.instance.intensity.clamp(1, 3);
                final forceOverride = HapticsController.instance.forceVibrationOverride;
                final diagnostics = HapticsController.instance.diagnostics;
                final forceBlocked = forceOverride && diagnostics.forceOverrideLikelyBlocked;
                final forceBlockedMessage = switch (diagnostics.reasonCode) {
                  'no_vibrator' => context.l10n.forceInAppVibrationNoVibratorWarning,
                  'master_vibration_disabled' => context.l10n.forceInAppVibrationBlockedMasterWarning,
                  _ => context.l10n.forceInAppVibrationBlockedMasterWarning,
                };

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SwitchListTile.adaptive(
                      secondary: const Icon(Icons.vibration_rounded),
                      title: Text(context.l10n.hapticFeedbackTitle),
                      subtitle: Text(context.l10n.hapticFeedbackSubtitle),
                      value: enabled,
                      onChanged: (v) => HapticsController.instance.setEnabled(v),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 56, right: 12, bottom: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(context.l10n.intensity, style: Theme.of(context).textTheme.labelMedium),
                          const SizedBox(height: 6),
                          SegmentedButton<int>(
                            segments: [
                              ButtonSegment(value: 1, label: Text(context.l10n.intensityLight)),
                              ButtonSegment(value: 2, label: Text(context.l10n.intensityMedium)),
                              ButtonSegment(value: 3, label: Text(context.l10n.intensityStrong)),
                            ],
                            selected: <int>{intensity},
                            onSelectionChanged: enabled
                                ? (s) async {
                                    await HapticsController.instance.setIntensity(s.first);
                                    if (context.mounted) {
                                      await Haptics.mediumImpact();
                                    }
                                  }
                                : null,
                          ),
                        ],
                      ),
                    ),
                    SwitchListTile.adaptive(
                      secondary: const Icon(Icons.vibration_rounded),
                      title: Text(context.l10n.forceInAppVibrationTitle),
                      value: forceOverride,
                      onChanged: enabled
                          ? (v) async {
                              await HapticsController.instance.setForceVibrationOverride(v);
                              await HapticsController.instance.refreshDiagnostics();
                              if (!context.mounted) return;
                              final currentDiagnostics = HapticsController.instance.diagnostics;
                              if (v && currentDiagnostics.forceOverrideLikelyBlocked) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      switch (currentDiagnostics.reasonCode) {
                                        'no_vibrator' => context.l10n.forceInAppVibrationNoVibratorWarning,
                                        'master_vibration_disabled' => context.l10n.forceInAppVibrationBlockedMasterWarning,
                                        _ => context.l10n.forceInAppVibrationBlockedMasterWarning,
                                      },
                                    ),
                                    behavior: SnackBarBehavior.floating,
                                  ),
                                );
                              } else if (v) {
                                await Haptics.heavyImpact();
                              }
                            }
                          : null,
                    ),
                    if (forceBlocked)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(56, 0, 12, 8),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: cs.errorContainer.withValues(alpha: 0.65),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.warning_amber_rounded, size: 18, color: cs.onErrorContainer),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  forceBlockedMessage,
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: cs.onErrorContainer,
                                    height: 1.3,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
            const Divider(height: 1),
            AnimatedBuilder(
              animation: orientationCtrl,
              builder: (context, _) {
                return AnimatedRotation(
                  turns: orientationCtrl.flipped ? 0.5 : 0.0,
                  duration: const Duration(milliseconds: 260),
                  curve: Curves.easeOutCubic,
                  child: SwitchListTile.adaptive(
                    secondary: const Icon(Icons.screen_rotation_rounded),
                    title: Text(context.l10n.flipRemoteDefaultTitle),
                    subtitle: Text(context.l10n.flipRemoteDefaultSubtitle),
                    value: orientationCtrl.flipped,
                    onChanged: (v) async {
                      final messenger = ScaffoldMessenger.of(context);
                      final l10n = context.l10n;
                      await orientationCtrl.setFlipped(v);
                      messenger.showSnackBar(
                        SnackBar(
                          content: Text(v ? l10n.remoteViewFlipped : l10n.remoteViewNormal),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRemotesSection(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SectionCard(
        title: context.l10n.backupTitle,
        subtitle: context.l10n.backupSubtitle,
        leading: Icon(Icons.storage_rounded, color: cs.primary),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.file_upload_outlined),
              title: Text(context.l10n.importBackup),
              subtitle: Text(context.l10n.importBackupSubtitle),
              onTap: () => _doImport(context),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.drive_folder_upload_outlined),
              title: Text(context.l10n.bulkImportFolder),
              subtitle: Text(context.l10n.bulkImportFolderSubtitle),
              onTap: () => _doBulkImportFolder(context),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.file_download_outlined),
              title: Text(context.l10n.exportBackup),
              subtitle: Text(context.l10n.exportBackupSubtitle),
              onTap: () => _doExport(context),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.restore_rounded),
              title: Text(context.l10n.restoreDemoRemotes),
              subtitle: Text(context.l10n.restoreDemoRemotesSubtitle),
              onTap: () => _restoreDemoRemote(context),
            ),
            const Divider(height: 1),
            ListTile(
              leading: Icon(Icons.delete_forever, color: theme.colorScheme.error),
              title: Text(context.l10n.deleteAllRemotes, style: TextStyle(color: theme.colorScheme.error)),
              subtitle: Text(context.l10n.deleteAllRemotesSubtitle),
              onTap: () => _deleteAllRemotes(context),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Text(
                context.l10n.backupTip,
                style: TextStyle(color: cs.onSurfaceVariant),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutSection(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SectionCard(
        title: context.l10n.aboutTitle,
        subtitle: context.l10n.aboutSubtitle,
        leading: Icon(Icons.info_outline, color: cs.primary),
        child: Column(
          children: [
            FutureBuilder<PackageInfo>(
              future: PackageInfo.fromPlatform(),
              builder: (context, snapshot) {
                final info = snapshot.data;
                final version = info == null ? '—' : '${info.version}+${info.buildNumber}';
                return ListTile(
                  leading: const Icon(Icons.apps),
                  title: Text(context.l10n.aboutAppNameWithCreator(_creatorName)),
                  subtitle: Text(context.l10n.versionLabel(version)),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AboutScreen(
                          repoUrl: _repoUrl,
                          issuesUrl: _issuesUrl,
                          liberapayUrl: _liberapayUrl,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.code),
              title: Text(context.l10n.sourceCode),
              subtitle: Text(context.l10n.viewOnGitHub),
              trailing: const Icon(Icons.open_in_new),
              onTap: () => _launchUrl(context, _repoUrl),
              onLongPress: () => _copyToClipboard(context, text: _repoUrl, message: context.l10n.repositoryUrlCopied),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.bug_report),
              title: Text(context.l10n.reportIssue),
              subtitle: Text(context.l10n.reportIssueSubtitle),
              trailing: const Icon(Icons.open_in_new),
              onTap: () => _launchUrl(context, _issuesUrl),
              onLongPress: () => _copyToClipboard(context, text: _issuesUrl, message: context.l10n.issuesUrlCopied),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.gavel),
              title: Text(context.l10n.license),
              subtitle: Text(context.l10n.openSourceLicense),
              trailing: const Icon(Icons.open_in_new),
              onTap: () => _launchUrl(context, _licenseUrl),
              onLongPress: () => _copyToClipboard(context, text: _licenseUrl, message: context.l10n.licenseUrlCopied),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.business),
              title: Text(context.l10n.companyName),
              subtitle: Text(context.l10n.visitWebsite),
              trailing: const Icon(Icons.open_in_new),
              onTap: () => _launchUrl(context, _companyUrl),
              onLongPress: () => _copyToClipboard(context, text: _companyUrl, message: context.l10n.companyUrlCopied),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.receipt_long),
              title: Text(context.l10n.licenses),
              subtitle: Text(context.l10n.openSourceLicenses),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                showLicensePage(
                  context: context,
                  applicationName: context.l10n.appTitle,
                  applicationVersion: context.l10n.byCreator(_creatorName),
                  applicationIcon: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Icon(Icons.settings_remote_rounded, size: 48, color: cs.primary),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeviceControlsSection(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SectionCard(
        title: context.l10n.deviceControlsTitle,
        subtitle: context.l10n.deviceControlsSubtitle,
        leading: Icon(Icons.tune_rounded, color: cs.primary),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.power_outlined),
              title: Text(context.l10n.manageFavorites),
              subtitle: Text(context.l10n.manageFavoritesSubtitle),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const DeviceControlsScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickSettingsSection(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SectionCard(
        title: context.l10n.quickSettingsTitle,
        subtitle: context.l10n.quickSettingsSubtitle,
        leading: Icon(Icons.view_quilt_rounded, color: cs.primary),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.tune_rounded),
              title: Text(context.l10n.configureTiles),
              subtitle: Text(context.l10n.configureTilesSubtitle),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const QuickSettingsScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTvKillSection(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SectionCard(
        title: context.l10n.tvKillTitle,
        subtitle: context.l10n.tvKillSubtitle,
        leading: Icon(Icons.power_settings_new_rounded, color: cs.primary),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.flash_on_rounded),
              title: Text(context.l10n.openTvKill),
              subtitle: Text(context.l10n.openTvKillSubtitle),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const UniversalPowerScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ThemeOptionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final ThemeData theme;

  const _ThemeOptionCard({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final cs = theme.colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? cs.primaryContainer.withValues(alpha: 0.7)
              : cs.surfaceContainerHighest.withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected
                ? cs.primary.withValues(alpha: 0.5)
                : cs.outlineVariant.withValues(alpha: 0.3),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isSelected ? cs.primary : cs.surfaceContainerHighest,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 24,
                color: isSelected ? cs.onPrimary : cs.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: theme.textTheme.labelLarge?.copyWith(
                fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
                color: isSelected ? cs.onPrimaryContainer : cs.onSurfaceVariant,
              ),
            ),
            if (isSelected) ...[
              const SizedBox(height: 4),
              Icon(Icons.check_circle, size: 16, color: cs.primary),
            ],
          ],
        ),
      ),
    );
  }
}

class _IrTransmitterCard extends StatefulWidget {
  const _IrTransmitterCard();

  @override
  State<_IrTransmitterCard> createState() => _IrTransmitterCardState();
}

class _IrTransmitterCardState extends State<_IrTransmitterCard> {
  bool _loading = true;
  bool _busy = false;

  IrTransmitterType _preferred = IrTransmitterType.internal;
  IrTransmitterType _active = IrTransmitterType.internal;

  IrTransmitterCapabilities? _caps;
  bool _autoSwitchEnabled = false;
  bool _openOnUsbAttachEnabled = false;

  StreamSubscription<IrTransmitterCapabilities>? _capsSub;

  @override
  void initState() {
    super.initState();
    _capsSub = IrTransmitterPlatform.capabilitiesEvents().listen(
      (caps) {
        if (!mounted) return;

        final hasInternal = caps.hasInternal;
        final bool activeIsAudio = caps.currentType == IrTransmitterType.audio1Led || caps.currentType == IrTransmitterType.audio2Led;
        final autoSwitch = (hasInternal && !activeIsAudio) ? caps.autoSwitchEnabled : false;

        setState(() {
          _caps = caps;
          _active = caps.currentType;
          _autoSwitchEnabled = autoSwitch;
          _loading = false;
        });

        if (!hasInternal && _preferred == IrTransmitterType.internal) {
          setState(() {
            _preferred = IrTransmitterType.usb;
          });
          unawaited(IrTransmitterPlatform.setPreferredType(IrTransmitterType.usb));
        }
      },
      onError: (_) {},
      cancelOnError: false,
    );

    _load();
  }

  @override
  void dispose() {
    _capsSub?.cancel();
    _capsSub = null;
    super.dispose();
  }

  IrTransmitterType _effectiveSelection(bool hasInternal) {
    final bool preferredIsAudio = _preferred == IrTransmitterType.audio1Led || _preferred == IrTransmitterType.audio2Led;
    final bool activeIsAudio = _active == IrTransmitterType.audio1Led || _active == IrTransmitterType.audio2Led;
    if (preferredIsAudio || activeIsAudio) return _preferred;
    if (hasInternal && _autoSwitchEnabled) return _active;
    return _preferred;
  }

  Future<void> _load({bool showErrors = false}) async {
    try {
      final preferred = await IrTransmitterPlatform.getPreferredType();
      final caps = await IrTransmitterPlatform.getCapabilities();

      bool autoSwitch = false;
      bool openOnUsbAttach = false;

      try {
        autoSwitch = await IrTransmitterPlatform.getAutoSwitchEnabled();
      } catch (_) {
        autoSwitch = caps.autoSwitchEnabled;
      }

      try {
        openOnUsbAttach = await IrTransmitterPlatform.getOpenOnUsbAttachEnabled();
      } catch (_) {}

      if (!mounted) return;

      IrTransmitterType effectivePreferred = preferred;
      final bool activeIsAudio = caps.currentType == IrTransmitterType.audio1Led || caps.currentType == IrTransmitterType.audio2Led;
      bool effectiveAuto = (caps.hasInternal && !activeIsAudio) ? autoSwitch : false;

      if (!caps.hasInternal) {
        if (effectivePreferred == IrTransmitterType.internal) {
          effectivePreferred = IrTransmitterType.usb;
          try {
            await IrTransmitterPlatform.setPreferredType(IrTransmitterType.usb);
          } catch (_) {}
        }
        if (effectiveAuto) {
          effectiveAuto = false;
          try {
            await IrTransmitterPlatform.setAutoSwitchEnabled(false);
          } catch (_) {}
        }
      }

      setState(() {
        _preferred = effectivePreferred;
        _caps = caps;
        _active = caps.currentType;
        _autoSwitchEnabled = effectiveAuto;
        _openOnUsbAttachEnabled = openOnUsbAttach;
        _loading = false;
        _busy = false;
      });
    } on PlatformException catch (e) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _busy = false;
      });
      if (showErrors) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? context.l10n.failedToLoadTransmitterSettings)),
        );
      }
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _busy = false;
      });
      if (showErrors) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.failedToLoadTransmitterSettings)),
        );
      }
    }
  }

  Future<void> _refreshCaps() async {
    try {
      final caps = await IrTransmitterPlatform.getCapabilities();
      bool autoSwitch = _autoSwitchEnabled;

      try {
        autoSwitch = await IrTransmitterPlatform.getAutoSwitchEnabled();
      } catch (_) {
        autoSwitch = caps.autoSwitchEnabled;
      }

      if (!mounted) return;

      final bool activeIsAudio = caps.currentType == IrTransmitterType.audio1Led || caps.currentType == IrTransmitterType.audio2Led;
      setState(() {
        _caps = caps;
        _active = caps.currentType;
        _autoSwitchEnabled = (caps.hasInternal && !activeIsAudio) ? autoSwitch : false;
      });
    } catch (_) {}
  }

  String _usbStatusBannerText(BuildContext context, IrTransmitterCapabilities caps) {
    switch (caps.usbStatus) {
      case UsbConnectionStatus.ready:
        return context.l10n.usbStatusReady;
      case UsbConnectionStatus.permissionRequired:
        return context.l10n.usbStatusPermissionRequired;
      case UsbConnectionStatus.permissionDenied:
        return context.l10n.usbStatusPermissionDenied;
      case UsbConnectionStatus.permissionGranted:
        return context.l10n.usbStatusPermissionGranted;
      case UsbConnectionStatus.openFailed:
        return caps.usbStatusMessage ?? context.l10n.usbStatusOpenFailed;
      case UsbConnectionStatus.noDevice:
        return context.l10n.usbStatusNoDevice;
    }
  }

  String _usbSelectionMessage(BuildContext context, IrTransmitterCapabilities caps) {
    switch (caps.usbStatus) {
      case UsbConnectionStatus.permissionRequired:
        return context.l10n.usbSelectPermissionRequired;
      case UsbConnectionStatus.permissionDenied:
        return context.l10n.usbSelectPermissionDenied;
      case UsbConnectionStatus.permissionGranted:
        return context.l10n.usbSelectPermissionGranted;
      case UsbConnectionStatus.openFailed:
        return caps.usbStatusMessage ?? context.l10n.usbSelectOpenFailed;
      case UsbConnectionStatus.noDevice:
        return context.l10n.usbSelectNoDevice;
      case UsbConnectionStatus.ready:
        return context.l10n.usbSelectReady;
    }
  }

  Future<void> _setAutoSwitch(bool enabled) async {
    final messenger = ScaffoldMessenger.of(context);
    final l10n = context.l10n;
    final caps = _caps;
    if (caps == null) return;

    final bool activeIsAudio = _active == IrTransmitterType.audio1Led || _active == IrTransmitterType.audio2Led;
    if (activeIsAudio) enabled = false;
    if (!caps.hasInternal && enabled) enabled = false;

    setState(() {
      _busy = true;
      _autoSwitchEnabled = enabled;
    });

    try {
      await IrTransmitterPlatform.setAutoSwitchEnabled(enabled);
      await _refreshCaps();

      if (!mounted) return;

      if (enabled) {
        messenger.showSnackBar(
          SnackBar(content: Text(l10n.autoSwitchEnabledMessage)),
        );
      } else {
        messenger.showSnackBar(
          SnackBar(content: Text(l10n.autoSwitchDisabledMessage)),
        );
      }
    } catch (_) {
      if (mounted) {
        messenger.showSnackBar(
          SnackBar(content: Text(l10n.failedToUpdateAutoSwitch)),
        );
      }
    }

    await _refreshCaps();
    if (!mounted) return;
    setState(() {
      _busy = false;
    });
  }

  Future<void> _setOpenOnUsbAttach(bool value) async {
    final messenger = ScaffoldMessenger.of(context);
    final l10n = context.l10n;

    setState(() {
      _busy = true;
      _openOnUsbAttachEnabled = value;
    });

    try {
      final ok = await IrTransmitterPlatform.setOpenOnUsbAttachEnabled(value);
      if (!mounted) return;
      setState(() {
        _openOnUsbAttachEnabled = ok;
      });
      messenger.showSnackBar(
        SnackBar(
          content: Text(ok ? l10n.openOnUsbAttachEnabledMessage : l10n.openOnUsbAttachDisabledMessage),
        ),
      );
    } catch (_) {
      if (mounted) {
        messenger.showSnackBar(
          SnackBar(content: Text(l10n.failedToUpdateSetting)),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _busy = false;
        });
      }
    }
  }

  Future<void> _applyManualSelection(IrTransmitterType t) async {
    final caps = _caps;
    if (caps != null && !caps.hasInternal && t == IrTransmitterType.internal) return;

    final bool selectedIsAudio = t == IrTransmitterType.audio1Led || t == IrTransmitterType.audio2Led;
    final bool turningOffAutoNow = (_autoSwitchEnabled && (selectedIsAudio || t == IrTransmitterType.internal || t == IrTransmitterType.usb));

    setState(() {
      _busy = true;
      _preferred = t;
      if (turningOffAutoNow) _autoSwitchEnabled = false;
    });

    try {
      await IrTransmitterPlatform.setPreferredType(t);
    } catch (_) {}

    if (turningOffAutoNow) {
      try {
        await IrTransmitterPlatform.setAutoSwitchEnabled(false);
      } catch (_) {}
    }

    try {
      await IrTransmitterPlatform.setActiveType(t);
    } on PlatformException catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? context.l10n.failedToSwitchTransmitter)),
      );
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.failedToSwitchTransmitter)),
      );
    } finally {
      await _refreshCaps();
    }

    if (!mounted) return;
    final freshCaps = _caps;

    if (t == IrTransmitterType.usb && freshCaps != null && !freshCaps.usbReady) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_usbSelectionMessage(context, freshCaps))),
      );
    }

    if (t == IrTransmitterType.internal && freshCaps != null && !freshCaps.hasInternal) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.deviceHasNoInternalIr)),
      );
    }

    if (selectedIsAudio) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.audioModeEnabledMessage)),
      );
    }

    setState(() {
      _busy = false;
    });
  }

  Future<void> _requestUsbPermission() async {
    final messenger = ScaffoldMessenger.of(context);
    final l10n = context.l10n;
    setState(() {
      _busy = true;
    });

    try {
      final ok = await IrTransmitterPlatform.usbScanAndRequest();
      await _refreshCaps();
      if (!mounted) return;

      final freshCaps = _caps;

      if (!ok) {
        messenger.showSnackBar(
          SnackBar(content: Text(l10n.homeUsbDongleNotDetected)),
        );
      } else if (freshCaps == null) {
        messenger.showSnackBar(
          SnackBar(content: Text(l10n.usbPermissionRequestSent)),
        );
      } else if (freshCaps.usbStatus == UsbConnectionStatus.permissionRequired ||
          freshCaps.usbStatus == UsbConnectionStatus.permissionDenied) {
        messenger.showSnackBar(
          SnackBar(content: Text(l10n.usbPermissionRequestSentApprove)),
        );
      } else if (freshCaps.usbStatus == UsbConnectionStatus.ready) {
        messenger.showSnackBar(
          SnackBar(content: Text(l10n.usbAlreadyReady)),
        );
      } else {
        messenger.showSnackBar(
          SnackBar(content: Text(_usbStatusBannerText(context, freshCaps))),
        );
      }
    } catch (_) {
      if (mounted) {
        messenger.showSnackBar(
          SnackBar(content: Text(l10n.failedToRequestUsbPermission)),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _busy = false;
        });
      }
    }
  }

  String _helpTextFor(BuildContext context, IrTransmitterType t) {
    switch (t) {
      case IrTransmitterType.internal:
        return context.l10n.transmitterHelpInternal;
      case IrTransmitterType.usb:
        return context.l10n.transmitterHelpUsb;
      case IrTransmitterType.audio1Led:
        return context.l10n.transmitterHelpAudio1;
      case IrTransmitterType.audio2Led:
        return context.l10n.transmitterHelpAudio2;
    }
  }

  String _titleFor(BuildContext context, IrTransmitterType t) {
    switch (t) {
      case IrTransmitterType.internal:
        return context.l10n.transmitterInternal;
      case IrTransmitterType.usb:
        return context.l10n.transmitterUsb;
      case IrTransmitterType.audio1Led:
        return context.l10n.transmitterAudio1;
      case IrTransmitterType.audio2Led:
        return context.l10n.transmitterAudio2;
    }
  }

  IconData _iconFor(IrTransmitterType t) {
    switch (t) {
      case IrTransmitterType.internal:
        return Icons.settings_input_antenna_rounded;
      case IrTransmitterType.usb:
        return Icons.usb_rounded;
      case IrTransmitterType.audio1Led:
        return Icons.volume_up_rounded;
      case IrTransmitterType.audio2Led:
        return Icons.surround_sound_rounded;
    }
  }

  bool _availableFor(IrTransmitterType t, IrTransmitterCapabilities caps) {
    switch (t) {
      case IrTransmitterType.internal:
        return caps.hasInternal;
      case IrTransmitterType.usb:
        return caps.hasUsb;
      case IrTransmitterType.audio1Led:
      case IrTransmitterType.audio2Led:
        return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    if (_loading) {
      return const Padding(
        padding: EdgeInsets.all(18),
        child: Center(child: CircularProgressIndicator()),
      );
    }

    final caps = _caps;
    if (caps == null) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(context.l10n.failedToLoadTransmitterCapabilities, style: TextStyle(color: cs.onSurfaceVariant)),
            const SizedBox(height: 10),
            FilledButton.tonalIcon(
              onPressed: _busy ? null : () => _load(showErrors: true),
              icon: const Icon(Icons.refresh_rounded),
              label: Text(context.l10n.retry),
            ),
          ],
        ),
      );
    }

    final effective = _effectiveSelection(caps.hasInternal);
    final active = _active;
    final bool activeIsAudio = active == IrTransmitterType.audio1Led || active == IrTransmitterType.audio2Led;

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(_iconFor(effective), color: cs.primary),
            title: Text(context.l10n.selectedTransmitter),
            subtitle: Text(
              context.l10n.selectedTransmitterValue(
                _titleFor(context, effective),
                _titleFor(context, active),
              ),
              style: TextStyle(color: cs.onSurfaceVariant),
            ),
            trailing: IconButton(
              tooltip: context.l10n.refresh,
              onPressed: _busy ? null : _refreshCaps,
              icon: const Icon(Icons.refresh_rounded),
            ),
          ),
          const Divider(height: 18),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            value: _autoSwitchEnabled,
            onChanged: (_busy || !caps.hasInternal || activeIsAudio) ? null : (v) => _setAutoSwitch(v),
            title: Text(context.l10n.autoSwitchTitle),
            subtitle: Text(
              activeIsAudio
                  ? context.l10n.autoSwitchDisabledWhileAudio
                  : (caps.hasInternal
                      ? context.l10n.autoSwitchUsesUsbOtherwiseInternal
                      : context.l10n.unavailableOnThisDevice),
            ),
          ),
          const Divider(height: 18),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            value: _openOnUsbAttachEnabled,
            onChanged: _busy
                ? null
                : _setOpenOnUsbAttach,
            title: Text(context.l10n.openOnUsbAttachTitle),
            subtitle: Text(context.l10n.openOnUsbAttachSubtitle),
          ),
          const Divider(height: 18),
          for (final t in IrTransmitterType.values) ...[
            _TransmitterOptionTile(
              type: t,
              title: _titleFor(context, t),
              subtitle: _helpTextFor(context, t),
              icon: _iconFor(t),
              selected: effective == t,
              enabled: !_busy && _availableFor(t, caps),
              onTap: () => _applyManualSelection(t),
            ),
            if (t != IrTransmitterType.values.last) const Divider(height: 1),
          ],
          if (effective == IrTransmitterType.usb) ...[
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: cs.surfaceContainerHighest.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: cs.outlineVariant.withValues(alpha: 0.3)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.info_outline_rounded, size: 18, color: cs.primary),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      _usbStatusBannerText(context, caps),
                      style: TextStyle(color: cs.onSurfaceVariant, height: 1.3),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: _busy ? null : _requestUsbPermission,
                icon: const Icon(Icons.usb_rounded),
                label: Text(context.l10n.requestUsbPermission),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _TransmitterOptionTile extends StatelessWidget {
  final IrTransmitterType type;
  final String title;
  final String subtitle;
  final IconData icon;
  final bool selected;
  final bool enabled;
  final VoidCallback onTap;

  const _TransmitterOptionTile({
    required this.type,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.selected,
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enabled: enabled,
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Icon(
        selected ? Icons.radio_button_checked_rounded : Icons.radio_button_off_rounded,
      ),
      onTap: enabled ? onTap : null,
    );
  }
}
