import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:tasks/HomeScreen/Profile.dart';
import 'package:tasks/Login/LoginScreen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isOff = true;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SettingsList(
            shrinkWrap: true,
            lightTheme: const SettingsThemeData(
                titleTextColor: Colors.grey,
                settingsListBackground: Colors.white,
                tileDescriptionTextColor: Colors.grey,
                dividerColor: Colors.grey),
            sections: [
              SettingsSection(
                title: const Text('General'),
                tiles: <SettingsTile>[
                  SettingsTile.navigation(
                    leading: const Icon(Icons.person_outline),
                    title: const Text(
                      'Edit Profile',
                    ),
                    onPressed: (c) {
                      Get.to(const Profile());
                    },
                    trailing: const Icon(
                      Icons.navigate_next,
                      size: 40,
                    ),
                    enabled: true,
                  ),
                  SettingsTile.navigation(
                    leading: const Icon(Icons.notifications_none_outlined),
                    title: const Text(
                      'Notification',
                    ),
                    onPressed: (c) {},
                    trailing: const Icon(
                      Icons.navigate_next,
                      size: 40,
                    ),
                    enabled: true,
                  ),
                  SettingsTile.navigation(
                    leading: const Icon(Icons.language),
                    title: const Text(
                      'Language',
                    ),
                    value: const Text(
                      'English',
                    ),
                    onPressed: (c) {},
                    trailing: const Icon(
                      Icons.navigate_next,
                      size: 40,
                    ),
                    enabled: true,
                  ),
                  SettingsTile.navigation(
                    leading: const Icon(Icons.security),
                    title: const Text(
                      'Security',
                    ),
                    onPressed: (c) {},
                    trailing: const Icon(
                      Icons.navigate_next,
                      size: 40,
                    ),
                    enabled: true,
                  ),
                ],
              ),
              SettingsSection(
                title: const Text('About'),
                tiles: <SettingsTile>[
                  SettingsTile.navigation(
                    leading: const Icon(Icons.help_outline),
                    title: const Text(
                      'Help & Feedback',
                    ),
                    onPressed: (c) {},
                    trailing: const Icon(
                      Icons.navigate_next,
                      size: 40,
                    ),
                    enabled: true,
                  ),
                  SettingsTile.switchTile(
                    onToggle: (value) {
                      isOff = !isOff;

                      if (isOff) {
                        return value;
                      }
                      return !value;
                    },
                    initialValue: false,
                    leading: const Icon(Icons.dark_mode),
                    title: const Text('Dark Mode'),
                  ),
                  SettingsTile.navigation(
                    onPressed: (c)
                    {
                      Get.to(LoginScreen());
                    },
                    leading: const Icon(
                      Icons.logout_outlined,
                      size: 25,
                      color: Colors.red,
                    ),
                    title: const Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
