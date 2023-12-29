import 'package:flutter/material.dart';

class HelpFeedbackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Feedback'),
        backgroundColor: Colors.black, // Updated color
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          Card(
            color: Colors.pink.shade100, // Updated color
            child: ListTile(
              leading: const Icon(Icons.question_answer,
                  color: Colors.white), // Updated color
              title: const Text(
                'FAQs',
                style: TextStyle(color: Colors.black), // Updated color
              ),
              subtitle: const Text(
                'Frequently Asked Questions',
                style: TextStyle(color: Colors.grey), // Updated color
              ),
              onTap: () {
                // TODO: Navigate to the FAQs page
              },
            ),
          ),
          Card(
            color: Colors.pink.shade100, // Updated color
            child: ListTile(
              leading:
                  const Icon(Icons.mail, color: Colors.white), // Updated color
              title: const Text(
                'Contact Support',
                style: TextStyle(color: Colors.black), // Updated color
              ),
              subtitle: const Text(
                'Get in touch with our support team',
                style: TextStyle(color: Colors.grey), // Updated color
              ),
              onTap: () {
                // TODO: Implement contact support action
              },
            ),
          ),
          Card(
            color: Colors.pink.shade100, // Updated color
            child: ListTile(
              leading: const Icon(Icons.feedback,
                  color: Colors.white), // Updated color
              title: const Text(
                'Give Feedback',
                style: TextStyle(color: Colors.black), // Updated color
              ),
              subtitle: const Text(
                'Tell us about your experience',
                style: TextStyle(color: Colors.grey), // Updated color
              ),
              onTap: () {
                // TODO: Navigate to the feedback form page
              },
            ),
          ),
          Card(
            color: Colors.pink.shade100, // Updated color
            child: ListTile(
              leading: const Icon(Icons.book_online,
                  color: Colors.white), // Updated color
              title: const Text(
                'User Guide',
                style: TextStyle(color: Colors.black), // Updated color
              ),
              subtitle: const Text(
                'Learn how to use the app',
                style: TextStyle(color: Colors.grey), // Updated color
              ),
              onTap: () {
                // TODO: Navigate to the User Guide page
              },
            ),
          ),
          // Add more options as required
        ],
      ),
    );
  }
}
