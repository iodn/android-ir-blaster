import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

String? iconPickerNameFor({
  required int codePoint,
  String? fontFamily,
}) {
  for (final icon in _IconPickerState._allIcons) {
    if (icon.iconData.codePoint != codePoint) continue;
    if (fontFamily != null && icon.iconData.fontFamily != fontFamily) continue;
    return icon.name;
  }
  return null;
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

    // Additional media and control icons
    IconPickerData(iconData: Icons.slow_motion_video, name: 'Slow Motion', category: 'Media'),
    IconPickerData(iconData: Icons.speed, name: 'Speed', category: 'Media'),
    IconPickerData(iconData: Icons.video_settings, name: 'Video Settings', category: 'Settings'),
    IconPickerData(iconData: Icons.audiotrack, name: 'Audio Track', category: 'Volume'),
    IconPickerData(iconData: Icons.graphic_eq, name: 'Graphic EQ', category: 'Volume'),
    IconPickerData(iconData: Icons.music_video, name: 'Music Video', category: 'Media'),
    IconPickerData(iconData: Icons.playlist_play, name: 'Playlist', category: 'Media'),
    IconPickerData(iconData: Icons.queue, name: 'Queue', category: 'Media'),

    // Font Awesome Numbers (0-9) - Basic
    IconPickerData(iconData: FontAwesomeIcons.zero, name: '0 FA', category: 'Numbers'),
    IconPickerData(iconData: FontAwesomeIcons.one, name: '1 FA', category: 'Numbers'),
    IconPickerData(iconData: FontAwesomeIcons.two, name: '2 FA', category: 'Numbers'),
    IconPickerData(iconData: FontAwesomeIcons.three, name: '3 FA', category: 'Numbers'),
    IconPickerData(iconData: FontAwesomeIcons.four, name: '4 FA', category: 'Numbers'),
    IconPickerData(iconData: FontAwesomeIcons.five, name: '5 FA', category: 'Numbers'),
    IconPickerData(iconData: FontAwesomeIcons.six, name: '6 FA', category: 'Numbers'),
    IconPickerData(iconData: FontAwesomeIcons.seven, name: '7 FA', category: 'Numbers'),
    IconPickerData(iconData: FontAwesomeIcons.eight, name: '8 FA', category: 'Numbers'),
    IconPickerData(iconData: FontAwesomeIcons.nine, name: '9 FA', category: 'Numbers'),

    // Font Awesome Additional Number Symbols
    IconPickerData(iconData: FontAwesomeIcons.hashtag, name: 'Hash # FA', category: 'Numbers'),
    IconPickerData(iconData: FontAwesomeIcons.percent, name: 'Percent % FA', category: 'Numbers'),
    IconPickerData(iconData: FontAwesomeIcons.divide, name: 'Divide ÷ FA', category: 'Numbers'),
    IconPickerData(iconData: FontAwesomeIcons.xmark, name: 'Multiply × FA', category: 'Numbers'),
    IconPickerData(iconData: FontAwesomeIcons.equals, name: 'Equals = FA', category: 'Numbers'),
    IconPickerData(iconData: FontAwesomeIcons.notEqual, name: 'Not Equal ≠ FA', category: 'Numbers'),
    IconPickerData(iconData: FontAwesomeIcons.greaterThan, name: 'Greater Than > FA', category: 'Numbers'),
    IconPickerData(iconData: FontAwesomeIcons.lessThan, name: 'Less Than < FA', category: 'Numbers'),
    IconPickerData(iconData: FontAwesomeIcons.asterisk, name: 'Asterisk * FA', category: 'Numbers'),

    // Font Awesome Letters A-Z
    IconPickerData(iconData: FontAwesomeIcons.a, name: 'A FA', category: 'Numbers'),
    IconPickerData(iconData: FontAwesomeIcons.b, name: 'B FA', category: 'Numbers'),
    IconPickerData(iconData: FontAwesomeIcons.c, name: 'C FA', category: 'Numbers'),
    IconPickerData(iconData: FontAwesomeIcons.d, name: 'D FA', category: 'Numbers'),
    IconPickerData(iconData: FontAwesomeIcons.e, name: 'E FA', category: 'Numbers'),
    IconPickerData(iconData: FontAwesomeIcons.f, name: 'F FA', category: 'Numbers'),
    IconPickerData(iconData: FontAwesomeIcons.g, name: 'G FA', category: 'Numbers'),
    IconPickerData(iconData: FontAwesomeIcons.h, name: 'H FA', category: 'Numbers'),
    IconPickerData(iconData: FontAwesomeIcons.i, name: 'I FA', category: 'Numbers'),
    IconPickerData(iconData: FontAwesomeIcons.j, name: 'J FA', category: 'Numbers'),
    IconPickerData(iconData: FontAwesomeIcons.k, name: 'K FA', category: 'Numbers'),
    IconPickerData(iconData: FontAwesomeIcons.l, name: 'L FA', category: 'Numbers'),
    IconPickerData(iconData: FontAwesomeIcons.m, name: 'M FA', category: 'Numbers'),
    IconPickerData(iconData: FontAwesomeIcons.n, name: 'N FA', category: 'Numbers'),
    IconPickerData(iconData: FontAwesomeIcons.o, name: 'O FA', category: 'Numbers'),
    IconPickerData(iconData: FontAwesomeIcons.p, name: 'P FA', category: 'Numbers'),
    IconPickerData(iconData: FontAwesomeIcons.q, name: 'Q FA', category: 'Numbers'),
    IconPickerData(iconData: FontAwesomeIcons.r, name: 'R FA', category: 'Numbers'),
    IconPickerData(iconData: FontAwesomeIcons.s, name: 'S FA', category: 'Numbers'),
    IconPickerData(iconData: FontAwesomeIcons.t, name: 'T FA', category: 'Numbers'),
    IconPickerData(iconData: FontAwesomeIcons.u, name: 'U FA', category: 'Numbers'),
    IconPickerData(iconData: FontAwesomeIcons.v, name: 'V FA', category: 'Numbers'),
    IconPickerData(iconData: FontAwesomeIcons.w, name: 'W FA', category: 'Numbers'),
    IconPickerData(iconData: FontAwesomeIcons.x, name: 'X FA', category: 'Numbers'),
    IconPickerData(iconData: FontAwesomeIcons.y, name: 'Y FA', category: 'Numbers'),
    IconPickerData(iconData: FontAwesomeIcons.z, name: 'Z FA', category: 'Numbers'),

    // Font Awesome Media Controls
    IconPickerData(iconData: FontAwesomeIcons.solidCirclePlay, name: 'Play FA', category: 'Media'),
    IconPickerData(iconData: FontAwesomeIcons.solidCirclePause, name: 'Pause FA', category: 'Media'),
    IconPickerData(iconData: FontAwesomeIcons.solidCircleStop, name: 'Stop FA', category: 'Media'),
    IconPickerData(iconData: FontAwesomeIcons.circlePlay, name: 'Play FA Outline', category: 'Media'),
    IconPickerData(iconData: FontAwesomeIcons.circlePause, name: 'Pause FA Outline', category: 'Media'),
    IconPickerData(iconData: FontAwesomeIcons.circleStop, name: 'Stop FA Outline', category: 'Media'),
    IconPickerData(iconData: FontAwesomeIcons.backward, name: 'Backward FA', category: 'Media'),
    IconPickerData(iconData: FontAwesomeIcons.forward, name: 'Forward FA', category: 'Media'),
    IconPickerData(iconData: FontAwesomeIcons.backwardStep, name: 'Previous FA', category: 'Media'),
    IconPickerData(iconData: FontAwesomeIcons.forwardStep, name: 'Next FA', category: 'Media'),
    IconPickerData(iconData: FontAwesomeIcons.backwardFast, name: 'Rewind FA', category: 'Media'),
    IconPickerData(iconData: FontAwesomeIcons.forwardFast, name: 'Fast Forward FA', category: 'Media'),
    IconPickerData(iconData: FontAwesomeIcons.repeat, name: 'Repeat FA', category: 'Media'),
    IconPickerData(iconData: FontAwesomeIcons.shuffle, name: 'Shuffle FA', category: 'Media'),
    IconPickerData(iconData: FontAwesomeIcons.eject, name: 'Eject FA', category: 'Media'),
    IconPickerData(iconData: FontAwesomeIcons.film, name: 'Film FA', category: 'Media'),
    IconPickerData(iconData: FontAwesomeIcons.video, name: 'Video FA', category: 'Media'),
    IconPickerData(iconData: FontAwesomeIcons.music, name: 'Music FA', category: 'Media'),
    IconPickerData(iconData: FontAwesomeIcons.microphone, name: 'Microphone FA', category: 'Media'),
    IconPickerData(iconData: FontAwesomeIcons.camera, name: 'Camera FA', category: 'Media'),
    IconPickerData(iconData: FontAwesomeIcons.cameraRetro, name: 'Camera Retro FA', category: 'Media'),

    // Font Awesome Volume Controls
    IconPickerData(iconData: FontAwesomeIcons.volumeHigh, name: 'Volume High FA', category: 'Volume'),
    IconPickerData(iconData: FontAwesomeIcons.volumeLow, name: 'Volume Low FA', category: 'Volume'),
    IconPickerData(iconData: FontAwesomeIcons.volumeOff, name: 'Volume Off FA', category: 'Volume'),
    IconPickerData(iconData: FontAwesomeIcons.volumeXmark, name: 'Mute FA', category: 'Volume'),
    IconPickerData(iconData: FontAwesomeIcons.microphoneSlash, name: 'Mic Mute FA', category: 'Volume'),
    IconPickerData(iconData: FontAwesomeIcons.headphones, name: 'Headphones FA', category: 'Volume'),
    IconPickerData(iconData: FontAwesomeIcons.speakerDeck, name: 'Speaker FA', category: 'Volume'),

    // Font Awesome Navigation
    IconPickerData(iconData: FontAwesomeIcons.solidCircleUp, name: 'Up FA', category: 'Navigation'),
    IconPickerData(iconData: FontAwesomeIcons.solidCircleDown, name: 'Down FA', category: 'Navigation'),
    IconPickerData(iconData: FontAwesomeIcons.solidCircleLeft, name: 'Left FA', category: 'Navigation'),
    IconPickerData(iconData: FontAwesomeIcons.solidCircleRight, name: 'Right FA', category: 'Navigation'),
    IconPickerData(iconData: FontAwesomeIcons.circleUp, name: 'Up FA Outline', category: 'Navigation'),
    IconPickerData(iconData: FontAwesomeIcons.circleDown, name: 'Down FA Outline', category: 'Navigation'),
    IconPickerData(iconData: FontAwesomeIcons.circleLeft, name: 'Left FA Outline', category: 'Navigation'),
    IconPickerData(iconData: FontAwesomeIcons.circleRight, name: 'Right FA Outline', category: 'Navigation'),
    IconPickerData(iconData: FontAwesomeIcons.arrowUp, name: 'Arrow Up FA', category: 'Navigation'),
    IconPickerData(iconData: FontAwesomeIcons.arrowDown, name: 'Arrow Down FA', category: 'Navigation'),
    IconPickerData(iconData: FontAwesomeIcons.arrowLeft, name: 'Arrow Left FA', category: 'Navigation'),
    IconPickerData(iconData: FontAwesomeIcons.arrowRight, name: 'Arrow Right FA', category: 'Navigation'),
    IconPickerData(iconData: FontAwesomeIcons.chevronUp, name: 'Chevron Up FA', category: 'Navigation'),
    IconPickerData(iconData: FontAwesomeIcons.chevronDown, name: 'Chevron Down FA', category: 'Navigation'),
    IconPickerData(iconData: FontAwesomeIcons.chevronLeft, name: 'Chevron Left FA', category: 'Navigation'),
    IconPickerData(iconData: FontAwesomeIcons.chevronRight, name: 'Chevron Right FA', category: 'Navigation'),
    IconPickerData(iconData: FontAwesomeIcons.solidCircleCheck, name: 'OK FA', category: 'Navigation'),
    IconPickerData(iconData: FontAwesomeIcons.circleCheck, name: 'OK FA Outline', category: 'Navigation'),
    IconPickerData(iconData: FontAwesomeIcons.check, name: 'Check FA', category: 'Navigation'),
    IconPickerData(iconData: FontAwesomeIcons.xmark, name: 'Close FA', category: 'Navigation'),
    IconPickerData(iconData: FontAwesomeIcons.circleXmark, name: 'Close Circle FA', category: 'Navigation'),
    IconPickerData(iconData: FontAwesomeIcons.house, name: 'Home FA', category: 'Navigation'),
    IconPickerData(iconData: FontAwesomeIcons.arrowRotateLeft, name: 'Undo FA', category: 'Navigation'),
    IconPickerData(iconData: FontAwesomeIcons.arrowRotateRight, name: 'Redo FA', category: 'Navigation'),
    IconPickerData(iconData: FontAwesomeIcons.rotateRight, name: 'Rotate FA', category: 'Navigation'),
    IconPickerData(iconData: FontAwesomeIcons.magnifyingGlass, name: 'Search FA', category: 'Navigation'),
    IconPickerData(iconData: FontAwesomeIcons.arrowsRotate, name: 'Refresh FA', category: 'Navigation'),

    // Font Awesome Power
    IconPickerData(iconData: FontAwesomeIcons.powerOff, name: 'Power Off FA', category: 'Power'),
    IconPickerData(iconData: FontAwesomeIcons.plug, name: 'Plug FA', category: 'Power'),
    IconPickerData(iconData: FontAwesomeIcons.toggleOn, name: 'Toggle On FA', category: 'Power'),
    IconPickerData(iconData: FontAwesomeIcons.toggleOff, name: 'Toggle Off FA', category: 'Power'),

    // Font Awesome Settings & Menu
    IconPickerData(iconData: FontAwesomeIcons.gear, name: 'Settings FA', category: 'Settings'),
    IconPickerData(iconData: FontAwesomeIcons.gears, name: 'Settings Alt FA', category: 'Settings'),
    IconPickerData(iconData: FontAwesomeIcons.bars, name: 'Menu FA', category: 'Settings'),
    IconPickerData(iconData: FontAwesomeIcons.ellipsis, name: 'More FA', category: 'Settings'),
    IconPickerData(iconData: FontAwesomeIcons.ellipsisVertical, name: 'More Vertical FA', category: 'Settings'),
    IconPickerData(iconData: FontAwesomeIcons.infoCircle, name: 'Info FA', category: 'Settings'),
    IconPickerData(iconData: FontAwesomeIcons.circleInfo, name: 'Info FA Outline', category: 'Settings'),
    IconPickerData(iconData: FontAwesomeIcons.solidCircleQuestion, name: 'Help FA', category: 'Settings'),
    IconPickerData(iconData: FontAwesomeIcons.circleQuestion, name: 'Help FA Outline', category: 'Settings'),
    IconPickerData(iconData: FontAwesomeIcons.list, name: 'List FA', category: 'Settings'),
    IconPickerData(iconData: FontAwesomeIcons.tableCells, name: 'Grid FA', category: 'Settings'),
    IconPickerData(iconData: FontAwesomeIcons.sliders, name: 'Sliders FA', category: 'Settings'),

    // Font Awesome Display & Brightness
    IconPickerData(iconData: FontAwesomeIcons.tv, name: 'TV FA', category: 'Display'),
    IconPickerData(iconData: FontAwesomeIcons.display, name: 'Monitor FA', category: 'Display'),
    IconPickerData(iconData: FontAwesomeIcons.desktop, name: 'Desktop FA', category: 'Display'),
    IconPickerData(iconData: FontAwesomeIcons.sun, name: 'Brightness FA', category: 'Display'),
    IconPickerData(iconData: FontAwesomeIcons.moon, name: 'Night Mode FA', category: 'Display'),
    IconPickerData(iconData: FontAwesomeIcons.solidLightbulb, name: 'Light FA', category: 'Display'),
    IconPickerData(iconData: FontAwesomeIcons.lightbulb, name: 'Light FA Outline', category: 'Display'),
    IconPickerData(iconData: FontAwesomeIcons.bolt, name: 'Flash FA', category: 'Display'),
    IconPickerData(iconData: FontAwesomeIcons.expand, name: 'Fullscreen FA', category: 'Display'),
    IconPickerData(iconData: FontAwesomeIcons.compress, name: 'Exit Fullscreen FA', category: 'Display'),
    IconPickerData(iconData: FontAwesomeIcons.upRightAndDownLeftFromCenter, name: 'Zoom In FA', category: 'Display'),
    IconPickerData(iconData: FontAwesomeIcons.downLeftAndUpRightToCenter, name: 'Zoom Out FA', category: 'Display'),
    IconPickerData(iconData: FontAwesomeIcons.closedCaptioning, name: 'Subtitles FA', category: 'Display'),
    IconPickerData(iconData: FontAwesomeIcons.photoFilm, name: 'Picture in Picture FA', category: 'Display'),
    IconPickerData(iconData: FontAwesomeIcons.palette, name: 'Color FA', category: 'Display'),
    IconPickerData(iconData: FontAwesomeIcons.paintbrush, name: 'Paint FA', category: 'Display'),

    // Font Awesome Input Sources
    IconPickerData(iconData: FontAwesomeIcons.rightToBracket, name: 'Input FA', category: 'Input'),
    IconPickerData(iconData: FontAwesomeIcons.wifi, name: 'WiFi FA', category: 'Input'),
    IconPickerData(iconData: FontAwesomeIcons.bluetooth, name: 'Bluetooth FA', category: 'Input'),
    IconPickerData(iconData: FontAwesomeIcons.usb, name: 'USB FA', category: 'Input'),
    IconPickerData(iconData: FontAwesomeIcons.ethernet, name: 'Ethernet FA', category: 'Input'),
    IconPickerData(iconData: FontAwesomeIcons.gamepad, name: 'Gamepad FA', category: 'Input'),
    IconPickerData(iconData: FontAwesomeIcons.podcast, name: 'Broadcast FA', category: 'Input'),
    IconPickerData(iconData: FontAwesomeIcons.satellite, name: 'Satellite FA', category: 'Input'),
    IconPickerData(iconData: FontAwesomeIcons.satelliteDish, name: 'Antenna FA', category: 'Input'),
    IconPickerData(iconData: FontAwesomeIcons.networkWired, name: 'Network FA', category: 'Input'),
    IconPickerData(iconData: FontAwesomeIcons.cloud, name: 'Cloud FA', category: 'Input'),

    // Font Awesome Favorites
    IconPickerData(iconData: FontAwesomeIcons.solidStar, name: 'Star FA', category: 'Favorite'),
    IconPickerData(iconData: FontAwesomeIcons.star, name: 'Star FA Outline', category: 'Favorite'),
    IconPickerData(iconData: FontAwesomeIcons.solidHeart, name: 'Heart FA', category: 'Favorite'),
    IconPickerData(iconData: FontAwesomeIcons.heart, name: 'Heart FA Outline', category: 'Favorite'),
    IconPickerData(iconData: FontAwesomeIcons.solidBookmark, name: 'Bookmark FA', category: 'Favorite'),
    IconPickerData(iconData: FontAwesomeIcons.bookmark, name: 'Bookmark FA Outline', category: 'Favorite'),
    IconPickerData(iconData: FontAwesomeIcons.flag, name: 'Flag FA', category: 'Favorite'),
    IconPickerData(iconData: FontAwesomeIcons.solidClock, name: 'Clock FA', category: 'Favorite'),
    IconPickerData(iconData: FontAwesomeIcons.clock, name: 'Clock FA Outline', category: 'Favorite'),
    IconPickerData(iconData: FontAwesomeIcons.solidBell, name: 'Bell FA', category: 'Favorite'),
    IconPickerData(iconData: FontAwesomeIcons.bell, name: 'Bell FA Outline', category: 'Favorite'),
    IconPickerData(iconData: FontAwesomeIcons.hourglass, name: 'Timer FA', category: 'Favorite'),
    IconPickerData(iconData: FontAwesomeIcons.lock, name: 'Lock FA', category: 'Favorite'),
    IconPickerData(iconData: FontAwesomeIcons.lockOpen, name: 'Unlock FA', category: 'Favorite'),

    // Additional Font Awesome Media & Recording
    IconPickerData(iconData: FontAwesomeIcons.photoFilm, name: 'Gallery FA', category: 'Media'),
    IconPickerData(iconData: FontAwesomeIcons.images, name: 'Images FA', category: 'Media'),
    IconPickerData(iconData: FontAwesomeIcons.image, name: 'Image FA', category: 'Media'),
    IconPickerData(iconData: FontAwesomeIcons.fileVideo, name: 'Video File FA', category: 'Media'),
    IconPickerData(iconData: FontAwesomeIcons.fileAudio, name: 'Audio File FA', category: 'Media'),
    IconPickerData(iconData: FontAwesomeIcons.circlePlay, name: 'Play Outline FA', category: 'Media'),
    IconPickerData(iconData: FontAwesomeIcons.play, name: 'Play Simple FA', category: 'Media'),
    IconPickerData(iconData: FontAwesomeIcons.pause, name: 'Pause Simple FA', category: 'Media'),
    IconPickerData(iconData: FontAwesomeIcons.stop, name: 'Stop Simple FA', category: 'Media'),
    IconPickerData(iconData: FontAwesomeIcons.recordVinyl, name: 'Record FA', category: 'Media'),
    IconPickerData(iconData: FontAwesomeIcons.circleStop, name: 'Stop Circle FA', category: 'Media'),
    IconPickerData(iconData: FontAwesomeIcons.circleNotch, name: 'Loading FA', category: 'Media'),

    // Font Awesome Text & Language
    IconPickerData(iconData: FontAwesomeIcons.font, name: 'Text FA', category: 'Display'),
    IconPickerData(iconData: FontAwesomeIcons.textHeight, name: 'Text Size FA', category: 'Display'),
    IconPickerData(iconData: FontAwesomeIcons.language, name: 'Language FA', category: 'Display'),
    IconPickerData(iconData: FontAwesomeIcons.globe, name: 'Globe FA', category: 'Display'),
    IconPickerData(iconData: FontAwesomeIcons.solidCommentDots, name: 'Subtitles Alt FA', category: 'Display'),
    IconPickerData(iconData: FontAwesomeIcons.commentDots, name: 'Subtitles Alt Outline FA', category: 'Display'),

    // Font Awesome Channels & Guide
    IconPickerData(iconData: FontAwesomeIcons.angleUp, name: 'Channel Up FA', category: 'Navigation'),
    IconPickerData(iconData: FontAwesomeIcons.angleDown, name: 'Channel Down FA', category: 'Navigation'),
    IconPickerData(iconData: FontAwesomeIcons.angleDoubleUp, name: 'Page Up FA', category: 'Navigation'),
    IconPickerData(iconData: FontAwesomeIcons.angleDoubleDown, name: 'Page Down FA', category: 'Navigation'),
    IconPickerData(iconData: FontAwesomeIcons.listUl, name: 'Guide FA', category: 'Settings'),
    IconPickerData(iconData: FontAwesomeIcons.thLarge, name: 'Grid View FA', category: 'Settings'),
    IconPickerData(iconData: FontAwesomeIcons.th, name: 'Grid Alt FA', category: 'Settings'),
    IconPickerData(iconData: FontAwesomeIcons.calendarAlt, name: 'Schedule FA', category: 'Favorite'),
    IconPickerData(iconData: FontAwesomeIcons.calendar, name: 'Calendar FA', category: 'Favorite'),

    // Font Awesome Color Buttons (for universal remotes)
    IconPickerData(iconData: FontAwesomeIcons.solidCircle, name: 'Red Button FA', category: 'Favorite'),
    IconPickerData(iconData: FontAwesomeIcons.circle, name: 'Button Outline FA', category: 'Favorite'),
    IconPickerData(iconData: FontAwesomeIcons.solidSquare, name: 'Square Button FA', category: 'Favorite'),
    IconPickerData(iconData: FontAwesomeIcons.square, name: 'Square Outline FA', category: 'Favorite'),
    IconPickerData(iconData: FontAwesomeIcons.dotCircle, name: 'Dot Circle FA', category: 'Favorite'),

    // Font Awesome Tools & Functions
    IconPickerData(iconData: FontAwesomeIcons.wrench, name: 'Tools FA', category: 'Settings'),
    IconPickerData(iconData: FontAwesomeIcons.screwdriver, name: 'Screwdriver FA', category: 'Settings'),
    IconPickerData(iconData: FontAwesomeIcons.hammer, name: 'Hammer FA', category: 'Settings'),
    IconPickerData(iconData: FontAwesomeIcons.toolbox, name: 'Toolbox FA', category: 'Settings'),
    IconPickerData(iconData: FontAwesomeIcons.cog, name: 'Cog FA', category: 'Settings'),
    IconPickerData(iconData: FontAwesomeIcons.slidersH, name: 'Adjust FA', category: 'Settings'),
    IconPickerData(iconData: FontAwesomeIcons.filter, name: 'Filter FA', category: 'Settings'),
    IconPickerData(iconData: FontAwesomeIcons.sortAmountDown, name: 'Sort Down FA', category: 'Settings'),
    IconPickerData(iconData: FontAwesomeIcons.sortAmountUp, name: 'Sort Up FA', category: 'Settings'),

    // Font Awesome Sleep & Timer
    IconPickerData(iconData: FontAwesomeIcons.bed, name: 'Sleep FA', category: 'Power'),
    IconPickerData(iconData: FontAwesomeIcons.hourglassStart, name: 'Timer Start FA', category: 'Favorite'),
    IconPickerData(iconData: FontAwesomeIcons.hourglassHalf, name: 'Timer Half FA', category: 'Favorite'),
    IconPickerData(iconData: FontAwesomeIcons.hourglassEnd, name: 'Timer End FA', category: 'Favorite'),
    IconPickerData(iconData: FontAwesomeIcons.stopwatch, name: 'Stopwatch FA', category: 'Favorite'),
    IconPickerData(iconData: FontAwesomeIcons.alarmClock, name: 'Alarm FA', category: 'Favorite'),

    // Font Awesome Aspect Ratio & Picture
    IconPickerData(iconData: FontAwesomeIcons.cropAlt, name: 'Crop Alt FA', category: 'Display'),
    IconPickerData(iconData: FontAwesomeIcons.crop, name: 'Crop FA', category: 'Display'),
    IconPickerData(iconData: FontAwesomeIcons.squareFull, name: 'Square Full FA', category: 'Display'),
    IconPickerData(iconData: FontAwesomeIcons.arrowsAlt, name: 'Fullscreen Alt FA', category: 'Display'),
    IconPickerData(iconData: FontAwesomeIcons.searchPlus, name: 'Zoom Plus FA', category: 'Display'),
    IconPickerData(iconData: FontAwesomeIcons.searchMinus, name: 'Zoom Minus FA', category: 'Display'),

    // Font Awesome Audio & Sound
    IconPickerData(iconData: FontAwesomeIcons.music, name: 'Music Note FA', category: 'Volume'),
    IconPickerData(iconData: FontAwesomeIcons.compactDisc, name: 'CD FA', category: 'Media'),
    IconPickerData(iconData: FontAwesomeIcons.recordVinyl, name: 'Vinyl FA', category: 'Media'),
    IconPickerData(iconData: FontAwesomeIcons.rss, name: 'RSS FA', category: 'Media'),

    // Font Awesome Special Functions
    IconPickerData(iconData: FontAwesomeIcons.wandMagicSparkles, name: 'Magic FA', category: 'Settings'),
    IconPickerData(iconData: FontAwesomeIcons.fingerprint, name: 'Fingerprint FA', category: 'Settings'),
    IconPickerData(iconData: FontAwesomeIcons.userCircle, name: 'User FA', category: 'Settings'),
    IconPickerData(iconData: FontAwesomeIcons.users, name: 'Users FA', category: 'Settings'),
    IconPickerData(iconData: FontAwesomeIcons.child, name: 'Child Mode FA', category: 'Settings'),

    // Font Awesome Streaming & Network
    IconPickerData(iconData: FontAwesomeIcons.chromecast, name: 'Cast FA', category: 'Input'),
    IconPickerData(iconData: FontAwesomeIcons.stream, name: 'Stream FA', category: 'Input'),
    IconPickerData(iconData: FontAwesomeIcons.signal, name: 'Signal FA', category: 'Input'),
    IconPickerData(iconData: FontAwesomeIcons.rssSquare, name: 'Feed FA', category: 'Input'),

    // Font Awesome Arrows & Directions
    IconPickerData(iconData: FontAwesomeIcons.arrowAltCircleUp, name: 'Circle Arrow Up FA', category: 'Navigation'),
    IconPickerData(iconData: FontAwesomeIcons.arrowAltCircleDown, name: 'Circle Arrow Down FA', category: 'Navigation'),
    IconPickerData(iconData: FontAwesomeIcons.arrowAltCircleLeft, name: 'Circle Arrow Left FA', category: 'Navigation'),
    IconPickerData(iconData: FontAwesomeIcons.arrowAltCircleRight, name: 'Circle Arrow Right FA', category: 'Navigation'),
    IconPickerData(iconData: FontAwesomeIcons.longArrowAltUp, name: 'Long Arrow Up FA', category: 'Navigation'),
    IconPickerData(iconData: FontAwesomeIcons.longArrowAltDown, name: 'Long Arrow Down FA', category: 'Navigation'),
    IconPickerData(iconData: FontAwesomeIcons.longArrowAltLeft, name: 'Long Arrow Left FA', category: 'Navigation'),
    IconPickerData(iconData: FontAwesomeIcons.longArrowAltRight, name: 'Long Arrow Right FA', category: 'Navigation'),

    // Font Awesome Plus/Minus
    IconPickerData(iconData: FontAwesomeIcons.plus, name: 'Plus FA', category: 'Numbers'),
    IconPickerData(iconData: FontAwesomeIcons.minus, name: 'Minus FA', category: 'Numbers'),
    IconPickerData(iconData: FontAwesomeIcons.plusCircle, name: 'Plus Circle FA', category: 'Numbers'),
    IconPickerData(iconData: FontAwesomeIcons.minusCircle, name: 'Minus Circle FA', category: 'Numbers'),
    IconPickerData(iconData: FontAwesomeIcons.plusSquare, name: 'Plus Square FA', category: 'Numbers'),
    IconPickerData(iconData: FontAwesomeIcons.minusSquare, name: 'Minus Square FA', category: 'Numbers'),
    IconPickerData(iconData: FontAwesomeIcons.times, name: 'Times FA', category: 'Navigation'),
    IconPickerData(iconData: FontAwesomeIcons.timesCircle, name: 'Times Circle FA', category: 'Navigation'),

    // Font Awesome Battery & Power
    IconPickerData(iconData: FontAwesomeIcons.batteryFull, name: 'Battery Full FA', category: 'Power'),
    IconPickerData(iconData: FontAwesomeIcons.batteryThreeQuarters, name: 'Battery 3/4 FA', category: 'Power'),
    IconPickerData(iconData: FontAwesomeIcons.batteryHalf, name: 'Battery Half FA', category: 'Power'),
    IconPickerData(iconData: FontAwesomeIcons.batteryQuarter, name: 'Battery 1/4 FA', category: 'Power'),
    IconPickerData(iconData: FontAwesomeIcons.batteryEmpty, name: 'Battery Empty FA', category: 'Power'),
    IconPickerData(iconData: FontAwesomeIcons.chargingStation, name: 'Charging FA', category: 'Power'),

    // Font Awesome Weather & Environment
    IconPickerData(iconData: FontAwesomeIcons.cloudSun, name: 'Cloud Sun FA', category: 'Display'),
    IconPickerData(iconData: FontAwesomeIcons.cloudMoon, name: 'Cloud Moon FA', category: 'Display'),
    IconPickerData(iconData: FontAwesomeIcons.cloudRain, name: 'Rain FA', category: 'Display'),
    IconPickerData(iconData: FontAwesomeIcons.snowflake, name: 'Snowflake FA', category: 'Display'),
    IconPickerData(iconData: FontAwesomeIcons.fire, name: 'Fire FA', category: 'Display'),
    IconPickerData(iconData: FontAwesomeIcons.thermometerHalf, name: 'Temperature FA', category: 'Display'),

    // Font Awesome Misc Useful
    IconPickerData(iconData: FontAwesomeIcons.boxOpen, name: 'Box FA', category: 'Settings'),
    IconPickerData(iconData: FontAwesomeIcons.gift, name: 'Gift FA', category: 'Favorite'),
    IconPickerData(iconData: FontAwesomeIcons.trophy, name: 'Trophy FA', category: 'Favorite'),
    IconPickerData(iconData: FontAwesomeIcons.crown, name: 'Crown FA', category: 'Favorite'),
    IconPickerData(iconData: FontAwesomeIcons.gem, name: 'Gem FA', category: 'Favorite'),
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
