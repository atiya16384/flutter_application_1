import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Placeholder for user data, you should replace these with real data
    final String userName = 'John Doe';
    final String userEmail = 'johndoe@example.com';
    final String userAvatar =
        'JD'; // Typically this would be a URL to the user's avatar image

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor:
            Colors.deepPurple, // Adjust the color to fit your theme
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200, // Adjust the height to fit your content
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    height: 150, // Adjust the height to fit your content
                    decoration: BoxDecoration(
                      color: Colors
                          .deepPurple, // Adjust the color to fit your theme
                    ),
                  ),
                ),
                Positioned(
                  top: 100, // Adjust the position to fit your content
                  child: CircleAvatar(
                    radius: 50, // Adjust the size to fit your content
                    backgroundColor: Colors.grey.shade800,
                    child: Text(
                      userAvatar,
                      style: TextStyle(
                        fontSize:
                            40, // Adjust the font size to fit your content
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
            style: TextStyle(
              fontSize: 24, // Adjust the font size to fit your content
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            userEmail,
            style: TextStyle(
              fontSize: 16, // Adjust the font size to fit your content
              color: Colors.grey.shade600,
            ),
          ),
          SizedBox(height: 20), // Adjust the size to fit your content
          ListTile(
            leading: Icon(Icons.edit,
                color: Colors.deepPurple), // Adjust the color to fit your theme
            title: Text('Edit Profile'),
            onTap: () {
              // Handle profile editing
            },
          ),
          ListTile(
            leading: Icon(Icons.settings,
                color: Colors.deepPurple), // Adjust the color to fit your theme
            title: Text('Account Settings'),
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
