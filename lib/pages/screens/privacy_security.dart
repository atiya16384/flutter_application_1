import 'package:flutter/material.dart';

class PrivacySecurityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy & Security'),
        backgroundColor: Colors.black, // Updated color
      ),
      body: ListView(
        children: ListTile.divideTiles(
          color: Colors.grey, // Divider color adjusted
          context: context,
          tiles: [
            ListTile(
              leading: const Icon(Icons.lock_outline,
                  color: Colors.pink), // Updated color
              title: const Text('Change Password',
                  style: TextStyle(color: Colors.black)), // Text color adjusted
              onTap: () {
                // Navigate to change password screen
              },
            ),
            // ... Repeat for each ListTile
            SwitchListTile(
              activeColor: Colors.pink, // Updated color
              title: const Text('Make Profile Private',
                  style: TextStyle(color: Colors.black)), // Text color adjusted
              value: true,
              onChanged: (bool newValue) {
                // Update the privacy setting
              },
            ),
            // Add more options as needed
          ],
        ).toList(),
      ),
    );
  }
}
