import 'package:flutter/material.dart';

class PrivacySecurityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy & Security'),
        backgroundColor: Colors.deepPurple, // Or any color that fits theme
      ),
      body: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            ListTile(
              leading: const Icon(Icons.lock_outline,
                  color: Colors.deepPurple), // Or any color that fits theme
              title: const Text('Change Password'),
              onTap: () {
                // Navigate to change password screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.phonelink_lock,
                  color:
                      Colors.deepPurple), // Or any color that fits your theme
              title: const Text('Two-Factor Authentication'),
              onTap: () {
                // Navigate to two-factor authentication settings
              },
            ),
            ListTile(
              leading: const Icon(Icons.perm_identity,
                  color:
                      Colors.deepPurple), // Or any color that fits your theme
              title: const Text('Manage Account Permissions'),
              onTap: () {
                // Navigate to manage permissions screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.history,
                  color:
                      Colors.deepPurple), // Or any color that fits your theme
              title: const Text('Activity History'),
              onTap: () {
                // Navigate to activity history screen
              },
            ),
            SwitchListTile(
              activeColor:
                  Colors.deepPurple, // Or any color that fits your theme
              title: const Text('Make Profile Private'),
              value:
                  true, // Replace with a variable that holds the current value
              onChanged: (bool newValue) {
                // Update the privacy setting
              },
            ),
            // Add more options
          ],
        ).toList(),
      ),
    );
  }
}
