import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Placeholder for user data
    final String userName = 'John Doe';
    final String userEmail = 'johndoe@example.com';
    final String userAvatar = 'JD';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.black, // Updated color
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.black, // Updated color
                    ),
                  ),
                ),
                Positioned(
                  top: 100,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey.shade800,
                    child: Text(
                      userAvatar,
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            userName,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black, // Text color
            ),
          ),
          Text(
            userEmail,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
            ),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.edit, color: Colors.pink), // Updated color
            title: Text('Edit Profile', style: TextStyle(color: Colors.black)),
            onTap: () {
              // Handle profile editing
            },
          ),
          ListTile(
            leading:
                const Icon(Icons.settings, color: Colors.pink), // Updated color
            title:
                Text('Account Settings', style: TextStyle(color: Colors.black)),
            onTap: () {
              // Handle account settings
            },
          ),
          // Add more ListTiles for other profile options
        ],
      ),
    );
  }
}
