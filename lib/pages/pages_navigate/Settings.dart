import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/screens/help_feedback.dart';
import 'package:flutter_application_1/pages/screens/notifications.dart';
import 'package:flutter_application_1/pages/screens/privacy_security.dart';

import '../screens/profile_screen.dart';

class Settings extends StatelessWidget {
  void navigateToProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfileScreen()),
    );
  }

  void navigateToNotifications(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NotificationsScreen()),
    );
  }

  void navigateToPrivacyAndSecurity(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PrivacySecurityScreen()),
    );
  }

  void navigateToHelpAndFeedback(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HelpFeedbackScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(228, 92, 162, 100),
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('User Name'), // Replace with actual user data
            accountEmail:
                Text('user@example.com'), // Replace with actual user data
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text('UN'), // Replace with actual user initials/data
            ),
            decoration: BoxDecoration(
              color: Colors.black,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person, color: Colors.black),
            title: const Text('Profile'),
            onTap: () => navigateToProfile(context),
            // Navigate to profile settings page
          ),
          ListTile(
            leading: const Icon(Icons.notifications, color: Colors.black),
            title: const Text('Notifications'),
            onTap: () => navigateToNotifications(context),
          ),
          ListTile(
            leading: const Icon(Icons.lock, color: Colors.black),
            title: const Text('Privacy & Security'),
            onTap: () => navigateToPrivacyAndSecurity(context),
          ),
          ListTile(
            leading: const Icon(Icons.help, color: Colors.black),
            title: const Text('Help & Feedback'),
            onTap: () => navigateToHelpAndFeedback(context),
          ),
          // Other settings options can be added here
        ],
      ),
    );
  }
}
