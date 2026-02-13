import 'package:flutter/material.dart';

class IconPickerData {
  final IconData iconData;
  final String name;
  final String category;

  const IconPickerData({
    required this.iconData,
    required this.name,
    required this.category,
  });
}

class IconPicker extends StatefulWidget {
  final IconData? initialIcon;

  const IconPicker({super.key, this.initialIcon});

  @override
  State<IconPicker> createState() => _IconPickerState();
}

class _IconPickerState extends State<IconPicker> {
  String _selectedCategory = 'All';
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  static const List<String> _categories = [
    'All',
    'Media',
    'Volume',
    'Navigation',
    'Power',
    'Numbers',
    'Settings',
    'Display',
    'Input',
    'Favorite',
  ];

  static final List<IconPickerData> _allIcons = [
    // Media Controls
    IconPickerData(iconData: Icons.play_arrow, name: 'Play', category: 'Media'),
    IconPickerData(iconData: Icons.pause, name: 'Pause', category: 'Media'),
    IconPickerData(iconData: Icons.stop, name: 'Stop', category: 'Media'),
    IconPickerData(iconData: Icons.fast_forward, name: 'Fast Forward', category: 'Media'),
    IconPickerData(iconData: Icons.fast_rewind, name: 'Rewind', category: 'Media'),
    IconPickerData(iconData: Icons.skip_next, name: 'Skip Next', category: 'Media'),
    IconPickerData(iconData: Icons.skip_previous, name: 'Skip Previous', category: 'Media'),
    IconPickerData(iconData: Icons.replay, name: 'Replay', category: 'Media'),
    IconPickerData(iconData: Icons.forward_10, name: 'Forward 10s', category: 'Media'),
    IconPickerData(iconData: Icons.forward_30, name: 'Forward 30s', category: 'Media'),
    IconPickerData(iconData: Icons.replay_10, name: 'Replay 10s', category: 'Media'),
    IconPickerData(iconData: Icons.replay_30, name: 'Replay 30s', category: 'Media'),
    IconPickerData(iconData: Icons.fiber_manual_record, name: 'Record', category: 'Media'),
    IconPickerData(iconData: Icons.radio_button_checked, name: 'Record Alt', category: 'Media'),
    IconPickerData(iconData: Icons.eject, name: 'Eject', category: 'Media'),
    IconPickerData(iconData: Icons.shuffle, name: 'Shuffle', category: 'Media'),
    IconPickerData(iconData: Icons.repeat, name: 'Repeat', category: 'Media'),
    IconPickerData(iconData: Icons.repeat_one, name: 'Repeat One', category: 'Media'),

    // Volume & Audio
    IconPickerData(iconData: Icons.volume_up, name: 'Volume Up', category: 'Volume'),
    IconPickerData(iconData: Icons.volume_down, name: 'Volume Down', category: 'Volume'),
    IconPickerData(iconData: Icons.volume_off, name: 'Volume Off', category: 'Volume'),
    IconPickerData(iconData: Icons.volume_mute, name: 'Mute', category: 'Volume'),
    IconPickerData(iconData: Icons.speaker, name: 'Speaker', category: 'Volume'),
    IconPickerData(iconData: Icons.surround_sound, name: 'Surround Sound', category: 'Volume'),
    IconPickerData(iconData: Icons.equalizer, name: 'Equalizer', category: 'Volume'),
    IconPickerData(iconData: Icons.hearing, name: 'Audio', category: 'Volume'),
    IconPickerData(iconData: Icons.mic, name: 'Microphone', category: 'Volume'),
    IconPickerData(iconData: Icons.mic_off, name: 'Mic Off', category: 'Volume'),

    // Navigation
    IconPickerData(iconData: Icons.arrow_upward, name: 'Up', category: 'Navigation'),
    IconPickerData(iconData: Icons.arrow_downward, name: 'Down', category: 'Navigation'),
    IconPickerData(iconData: Icons.arrow_back, name: 'Left', category: 'Navigation'),
    IconPickerData(iconData: Icons.arrow_forward, name: 'Right', category: 'Navigation'),
    IconPickerData(iconData: Icons.keyboard_arrow_up, name: 'Arrow Up', category: 'Navigation'),
    IconPickerData(iconData: Icons.keyboard_arrow_down, name: 'Arrow Down', category: 'Navigation'),
    IconPickerData(iconData: Icons.keyboard_arrow_left, name: 'Arrow Left', category: 'Navigation'),
    IconPickerData(iconData: Icons.keyboard_arrow_right, name: 'Arrow Right', category: 'Navigation'),
    IconPickerData(iconData: Icons.navigation, name: 'Navigation', category: 'Navigation'),
    IconPickerData(iconData: Icons.chevron_left, name: 'Chevron Left', category: 'Navigation'),
    IconPickerData(iconData: Icons.chevron_right, name: 'Chevron Right', category: 'Navigation'),
    IconPickerData(iconData: Icons.expand_less, name: 'Expand Less', category: 'Navigation'),
    IconPickerData(iconData: Icons.expand_more, name: 'Expand More', category: 'Navigation'),
    IconPickerData(iconData: Icons.unfold_less, name: 'Collapse', category: 'Navigation'),
    IconPickerData(iconData: Icons.unfold_more, name: 'Expand', category: 'Navigation'),
    IconPickerData(iconData: Icons.arrow_circle_up, name: 'Circle Up', category: 'Navigation'),
    IconPickerData(iconData: Icons.arrow_circle_down, name: 'Circle Down', category: 'Navigation'),
    IconPickerData(iconData: Icons.arrow_circle_left, name: 'Circle Left', category: 'Navigation'),
    IconPickerData(iconData: Icons.arrow_circle_right, name: 'Circle Right', category: 'Navigation'),
    IconPickerData(iconData: Icons.radio_button_checked, name: 'OK/Select', category: 'Navigation'),
    IconPickerData(iconData: Icons.check_circle, name: 'Confirm', category: 'Navigation'),
    IconPickerData(iconData: Icons.cancel, name: 'Cancel', category: 'Navigation'),
    IconPickerData(iconData: Icons.close, name: 'Close', category: 'Navigation'),
    IconPickerData(iconData: Icons.home, name: 'Home', category: 'Navigation'),
    IconPickerData(iconData: Icons.keyboard_return, name: 'Return', category: 'Navigation'),
    IconPickerData(iconData: Icons.exit_to_app, name: 'Exit', category: 'Navigation'),
    IconPickerData(iconData: Icons.undo, name: 'Undo', category: 'Navigation'),
    IconPickerData(iconData: Icons.redo, name: 'Redo', category: 'Navigation'),

    // Power
    IconPickerData(iconData: Icons.power_settings_new, name: 'Power', category: 'Power'),
    IconPickerData(iconData: Icons.power, name: 'Power Alt', category: 'Power'),
    IconPickerData(iconData: Icons.power_off, name: 'Power Off', category: 'Power'),
    IconPickerData(iconData: Icons.flash_on, name: 'On', category: 'Power'),
    IconPickerData(iconData: Icons.flash_off, name: 'Off', category: 'Power'),
    IconPickerData(iconData: Icons.toggle_on, name: 'Toggle On', category: 'Power'),
    IconPickerData(iconData: Icons.toggle_off, name: 'Toggle Off', category: 'Power'),
    IconPickerData(iconData: Icons.restart_alt, name: 'Restart', category: 'Power'),

    // Numbers
    IconPickerData(iconData: Icons.filter_1, name: '1', category: 'Numbers'),
    IconPickerData(iconData: Icons.filter_2, name: '2', category: 'Numbers'),
    IconPickerData(iconData: Icons.filter_3, name: '3', category: 'Numbers'),
    IconPickerData(iconData: Icons.filter_4, name: '4', category: 'Numbers'),
    IconPickerData(iconData: Icons.filter_5, name: '5', category: 'Numbers'),
    IconPickerData(iconData: Icons.filter_6, name: '6', category: 'Numbers'),
    IconPickerData(iconData: Icons.filter_7, name: '7', category: 'Numbers'),
    IconPickerData(iconData: Icons.filter_8, name: '8', category: 'Numbers'),
    IconPickerData(iconData: Icons.filter_9, name: '9', category: 'Numbers'),
    IconPickerData(iconData: Icons.filter_9_plus, name: '9+', category: 'Numbers'),
    IconPickerData(iconData: Icons.exposure_zero, name: '0', category: 'Numbers'),
    IconPickerData(iconData: Icons.looks_one, name: 'One', category: 'Numbers'),
    IconPickerData(iconData: Icons.looks_two, name: 'Two', category: 'Numbers'),
    IconPickerData(iconData: Icons.looks_3, name: 'Three', category: 'Numbers'),
    IconPickerData(iconData: Icons.looks_4, name: 'Four', category: 'Numbers'),
    IconPickerData(iconData: Icons.looks_5, name: 'Five', category: 'Numbers'),
    IconPickerData(iconData: Icons.looks_6, name: 'Six', category: 'Numbers'),
    IconPickerData(iconData: Icons.add, name: 'Plus', category: 'Numbers'),
    IconPickerData(iconData: Icons.remove, name: 'Minus', category: 'Numbers'),
    IconPickerData(iconData: Icons.add_circle, name: 'Add Circle', category: 'Numbers'),
    IconPickerData(iconData: Icons.remove_circle, name: 'Remove Circle', category: 'Numbers'),

    // Settings & Menu
    IconPickerData(iconData: Icons.settings, name: 'Settings', category: 'Settings'),
    IconPickerData(iconData: Icons.menu, name: 'Menu', category: 'Settings'),
    IconPickerData(iconData: Icons.more_vert, name: 'More Vertical', category: 'Settings'),
    IconPickerData(iconData: Icons.more_horiz, name: 'More Horizontal', category: 'Settings'),
    IconPickerData(iconData: Icons.tune, name: 'Tune', category: 'Settings'),
    IconPickerData(iconData: Icons.settings_remote, name: 'Remote Settings', category: 'Settings'),
    IconPickerData(iconData: Icons.info, name: 'Info', category: 'Settings'),
    IconPickerData(iconData: Icons.info_outline, name: 'Info Outline', category: 'Settings'),
    IconPickerData(iconData: Icons.help, name: 'Help', category: 'Settings'),
    IconPickerData(iconData: Icons.help_outline, name: 'Help Outline', category: 'Settings'),
    IconPickerData(iconData: Icons.list, name: 'List', category: 'Settings'),
    IconPickerData(iconData: Icons.view_list, name: 'View List', category: 'Settings'),
    IconPickerData(iconData: Icons.view_module, name: 'View Grid', category: 'Settings'),
    IconPickerData(iconData: Icons.apps, name: 'Apps', category: 'Settings'),
    IconPickerData(iconData: Icons.widgets, name: 'Widgets', category: 'Settings'),

    // Display & Brightness
    IconPickerData(iconData: Icons.tv, name: 'TV', category: 'Display'),
    IconPickerData(iconData: Icons.monitor, name: 'Monitor', category: 'Display'),
    IconPickerData(iconData: Icons.desktop_windows, name: 'Desktop', category: 'Display'),
    IconPickerData(iconData: Icons.brightness_high, name: 'Brightness High', category: 'Display'),
    IconPickerData(iconData: Icons.brightness_medium, name: 'Brightness Medium', category: 'Display'),
    IconPickerData(iconData: Icons.brightness_low, name: 'Brightness Low', category: 'Display'),
    IconPickerData(iconData: Icons.brightness_auto, name: 'Auto Brightness', category: 'Display'),
    IconPickerData(iconData: Icons.light_mode, name: 'Light Mode', category: 'Display'),
    IconPickerData(iconData: Icons.dark_mode, name: 'Dark Mode', category: 'Display'),
    IconPickerData(iconData: Icons.contrast, name: 'Contrast', category: 'Display'),
    IconPickerData(iconData: Icons.hdr_on, name: 'HDR On', category: 'Display'),
    IconPickerData(iconData: Icons.hdr_off, name: 'HDR Off', category: 'Display'),
    IconPickerData(iconData: Icons.aspect_ratio, name: 'Aspect Ratio', category: 'Display'),
    IconPickerData(iconData: Icons.crop, name: 'Crop', category: 'Display'),
    IconPickerData(iconData: Icons.zoom_in, name: 'Zoom In', category: 'Display'),
    IconPickerData(iconData: Icons.zoom_out, name: 'Zoom Out', category: 'Display'),
    IconPickerData(iconData: Icons.fullscreen, name: 'Fullscreen', category: 'Display'),
    IconPickerData(iconData: Icons.fullscreen_exit, name: 'Exit Fullscreen', category: 'Display'),
    IconPickerData(iconData: Icons.fit_screen, name: 'Fit Screen', category: 'Display'),
    IconPickerData(iconData: Icons.picture_in_picture, name: 'PiP', category: 'Display'),
    IconPickerData(iconData: Icons.crop_free, name: 'Crop Free', category: 'Display'),

    // Input Sources & Channels
    IconPickerData(iconData: Icons.input, name: 'Input', category: 'Input'),
    IconPickerData(iconData: Icons.cable, name: 'Cable', category: 'Input'),
    IconPickerData(iconData: Icons.cast, name: 'Cast', category: 'Input'),
    IconPickerData(iconData: Icons.cast_connected, name: 'Cast Connected', category: 'Input'),
    IconPickerData(iconData: Icons.screen_share, name: 'Screen Share', category: 'Input'),
    IconPickerData(iconData: Icons.bluetooth, name: 'Bluetooth', category: 'Input'),
    IconPickerData(iconData: Icons.wifi, name: 'WiFi', category: 'Input'),
    IconPickerData(iconData: Icons.router, name: 'Router', category: 'Input'),
    IconPickerData(iconData: Icons.memory, name: 'Memory', category: 'Input'),
    IconPickerData(iconData: Icons.videogame_asset, name: 'Game Console', category: 'Input'),
    IconPickerData(iconData: Icons.sports_esports, name: 'Gaming', category: 'Input'),
    IconPickerData(iconData: Icons.album, name: 'Media', category: 'Input'),
    IconPickerData(iconData: Icons.queue_music, name: 'Music Queue', category: 'Input'),
    IconPickerData(iconData: Icons.video_library, name: 'Video Library', category: 'Input'),
    IconPickerData(iconData: Icons.photo_library, name: 'Photo Library', category: 'Input'),
    IconPickerData(iconData: Icons.settings_input_component, name: 'Component', category: 'Input'),
    IconPickerData(iconData: Icons.settings_input_hdmi, name: 'HDMI', category: 'Input'),
    IconPickerData(iconData: Icons.settings_input_composite, name: 'Composite', category: 'Input'),
    IconPickerData(iconData: Icons.settings_input_antenna, name: 'Antenna', category: 'Input'),

    // Favorites & Special
    IconPickerData(iconData: Icons.favorite, name: 'Favorite', category: 'Favorite'),
    IconPickerData(iconData: Icons.favorite_border, name: 'Favorite Outline', category: 'Favorite'),
    IconPickerData(iconData: Icons.star, name: 'Star', category: 'Favorite'),
    IconPickerData(iconData: Icons.star_border, name: 'Star Outline', category: 'Favorite'),
    IconPickerData(iconData: Icons.bookmark, name: 'Bookmark', category: 'Favorite'),
    IconPickerData(iconData: Icons.bookmark_border, name: 'Bookmark Outline', category: 'Favorite'),
    IconPickerData(iconData: Icons.flag, name: 'Flag', category: 'Favorite'),
    IconPickerData(iconData: Icons.check, name: 'Check', category: 'Favorite'),
    IconPickerData(iconData: Icons.done, name: 'Done', category: 'Favorite'),
    IconPickerData(iconData: Icons.done_all, name: 'Done All', category: 'Favorite'),
    IconPickerData(iconData: Icons.schedule, name: 'Schedule', category: 'Favorite'),
    IconPickerData(iconData: Icons.timer, name: 'Timer', category: 'Favorite'),
    IconPickerData(iconData: Icons.access_time, name: 'Time', category: 'Favorite'),
    IconPickerData(iconData: Icons.alarm, name: 'Alarm', category: 'Favorite'),
    IconPickerData(iconData: Icons.notifications, name: 'Notifications', category: 'Favorite'),
    IconPickerData(iconData: Icons.lock, name: 'Lock', category: 'Favorite'),
    IconPickerData(iconData: Icons.lock_open, name: 'Unlock', category: 'Favorite'),

    // Colors & Lights (useful for LED remotes)
    IconPickerData(iconData: Icons.lightbulb, name: 'Light', category: 'Display'),
    IconPickerData(iconData: Icons.lightbulb_outline, name: 'Light Outline', category: 'Display'),
    IconPickerData(iconData: Icons.wb_incandescent, name: 'Warm Light', category: 'Display'),
    IconPickerData(iconData: Icons.wb_sunny, name: 'Sunny', category: 'Display'),
    IconPickerData(iconData: Icons.wb_cloudy, name: 'Cloudy', category: 'Display'),
    IconPickerData(iconData: Icons.nights_stay, name: 'Night', category: 'Display'),
    IconPickerData(iconData: Icons.flare, name: 'Flare', category: 'Display'),
    IconPickerData(iconData: Icons.gradient, name: 'Gradient', category: 'Display'),
    IconPickerData(iconData: Icons.invert_colors, name: 'Invert Colors', category: 'Display'),
    IconPickerData(iconData: Icons.palette, name: 'Palette', category: 'Display'),
    IconPickerData(iconData: Icons.color_lens, name: 'Color', category: 'Display'),
    IconPickerData(iconData: Icons.tonality, name: 'Tonality', category: 'Display'),

    // Additional useful icons
    IconPickerData(iconData: Icons.search, name: 'Search', category: 'Navigation'),
    IconPickerData(iconData: Icons.refresh, name: 'Refresh', category: 'Navigation'),
    IconPickerData(iconData: Icons.sync, name: 'Sync', category: 'Settings'),
    IconPickerData(iconData: Icons.update, name: 'Update', category: 'Settings'),
    IconPickerData(iconData: Icons.download, name: 'Download', category: 'Media'),
    IconPickerData(iconData: Icons.upload, name: 'Upload', category: 'Media'),
    IconPickerData(iconData: Icons.cloud, name: 'Cloud', category: 'Input'),
    IconPickerData(iconData: Icons.folder, name: 'Folder', category: 'Media'),
    IconPickerData(iconData: Icons.delete, name: 'Delete', category: 'Settings'),
    IconPickerData(iconData: Icons.edit, name: 'Edit', category: 'Settings'),
    IconPickerData(iconData: Icons.save, name: 'Save', category: 'Settings'),
    IconPickerData(iconData: Icons.share, name: 'Share', category: 'Media'),
    IconPickerData(iconData: Icons.print, name: 'Print', category: 'Settings'),
    IconPickerData(iconData: Icons.language, name: 'Language', category: 'Settings'),
    IconPickerData(iconData: Icons.translate, name: 'Translate', category: 'Settings'),
    IconPickerData(iconData: Icons.mic_none, name: 'Mic None', category: 'Volume'),
    IconPickerData(iconData: Icons.subtitles, name: 'Subtitles', category: 'Display'),
    IconPickerData(iconData: Icons.closed_caption, name: 'Closed Caption', category: 'Display'),
    IconPickerData(iconData: Icons.music_note, name: 'Music', category: 'Media'),
    IconPickerData(iconData: Icons.movie, name: 'Movie', category: 'Media'),
    IconPickerData(iconData: Icons.theaters, name: 'Theater', category: 'Display'),
    IconPickerData(iconData: Icons.live_tv, name: 'Live TV', category: 'Display'),
    IconPickerData(iconData: Icons.radio, name: 'Radio', category: 'Media'),
    IconPickerData(iconData: Icons.camera, name: 'Camera', category: 'Media'),
    IconPickerData(iconData: Icons.videocam, name: 'Video Camera', category: 'Media'),
    IconPickerData(iconData: Icons.photo_camera, name: 'Photo Camera', category: 'Media'),
  ];

  List<IconPickerData> get _filteredIcons {
    var icons = _allIcons;

    // Filter by category
    if (_selectedCategory != 'All') {
      icons = icons.where((icon) => icon.category == _selectedCategory).toList();
    }

    // Filter by search query
    if (_searchQuery.isNotEmpty) {
      final query = _searchQuery.toLowerCase();
      icons = icons.where((icon) => icon.name.toLowerCase().contains(query)).toList();
    }

    return icons;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredIcons = _filteredIcons;

    return Dialog(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          children: [
            // Header
            AppBar(
              title: const Text('Select Icon'),
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),

            // Search Bar
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search icons...',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: _searchQuery.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _searchController.clear();
                            setState(() {
                              _searchQuery = '';
                            });
                          },
                        )
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
              ),
            ),

            // Category Filter
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  final category = _categories[index];
                  final isSelected = category == _selectedCategory;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: FilterChip(
                      label: Text(category),
                      selected: isSelected,
                      onSelected: (selected) {
                        setState(() {
                          _selectedCategory = category;
                        });
                      },
                    ),
                  );
                },
              ),
            ),

            const Divider(height: 1),

            // Icons Grid
            Expanded(
              child: filteredIcons.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search_off, size: 64, color: Colors.grey[400]),
                          const SizedBox(height: 16),
                          Text(
                            'No icons found',
                            style: TextStyle(color: Colors.grey[600], fontSize: 16),
                          ),
                        ],
                      ),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.all(8),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 1,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: filteredIcons.length,
                      itemBuilder: (context, index) {
                        final iconData = filteredIcons[index];
                        final isSelected = widget.initialIcon != null &&
                            widget.initialIcon!.codePoint == iconData.iconData.codePoint;

                        return Card(
                          elevation: isSelected ? 4 : 1,
                          color: isSelected
                              ? Theme.of(context).colorScheme.primaryContainer
                              : null,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop(iconData.iconData);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  iconData.iconData,
                                  size: 32,
                                  color: isSelected
                                      ? Theme.of(context).colorScheme.onPrimaryContainer
                                      : null,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  iconData.name,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: isSelected
                                        ? Theme.of(context).colorScheme.onPrimaryContainer
                                        : null,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),

            // Footer info
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceVariant,
                border: Border(
                  top: BorderSide(color: Theme.of(context).dividerColor),
                ),
              ),
              child: Text(
                '${filteredIcons.length} icons available',
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
