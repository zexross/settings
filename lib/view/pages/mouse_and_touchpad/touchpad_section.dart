import 'package:flutter/material.dart';
import 'package:gsettings/gsettings.dart';
import 'package:settings/view/widgets/settings_section.dart';
import 'package:settings/view/widgets/settings_row.dart';

class TouchpadSection extends StatefulWidget {
  const TouchpadSection({Key? key}) : super(key: key);

  @override
  State<TouchpadSection> createState() => _TouchpadSectionState();
}

class _TouchpadSectionState extends State<TouchpadSection> {
  late GSettings _settings;

  @override
  void initState() {
    _settings = GSettings(schemaId: 'org.gnome.desktop.peripherals.touchpad');
    super.initState();
  }

  @override
  void dispose() {
    _settings.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SettingsSection(headline: 'Touchpad', children: [
      BoolSettingsRow(
          actionLabel: 'Natural Scrolling',
          settingsKey: 'natural-scroll',
          settings: _settings)
    ]);
  }
}