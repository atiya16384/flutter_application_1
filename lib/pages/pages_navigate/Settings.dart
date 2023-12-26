import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
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
          UserAccountsDrawerHeader(
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
            onTap: () {
              // Navigate to profile settings page
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications, color: Colors.black),
            title: const Text('Notifications'),
            onTap: () {
              // Navigate to notifications settings page
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock, color: Colors.black),
            title: const Text('Privacy & Security'),
            onTap: () {
              // Navigate to privacy settings page
            },
          ),
          ListTile(
            leading: const Icon(Icons.help, color: Colors.black),
            title: const Text('Help & Feedback'),
            onTap: () {
              // Navigate to help page
            },
          ),
          // Other settings options can be added here
        ],
      ),
    );
  }
}
