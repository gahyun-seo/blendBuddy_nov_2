import 'package:blend_buddy/general/w_theme.dart';
import 'package:flutter/material.dart';

import 'w_settings_app_bar.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        alignment: Alignment.center,
        child: Text('settings screen'),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SettingsAppBar(),
      ),
    );
  }
}
