import 'package:flutter/material.dart';

class HelpFeedbackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Feedback'),
        backgroundColor: Colors.deepPurple, // Or any color that fits your theme
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.question_answer,
                  color:
                      Colors.deepPurple), // Or any color that fits your theme
              title: const Text('FAQs'),
              subtitle: const Text('Frequently Asked Questions'),
              onTap: () {
                // Navigate to FAQ page
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.mail,
                  color:
                      Colors.deepPurple), // Or any color that fits your theme
              title: const Text('Contact Support'),
              subtitle: const Text('Get in touch with our support team'),
              onTap: () {
                // Implement contact support action, like opening email or a contact form
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.feedback,
                  color:
                      Colors.deepPurple), // Or any color that fits your theme
              title: const Text('Give Feedback'),
              subtitle: const Text('Tell us about your experience'),
              onTap: () {
                // Navigate to feedback form page
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.book_online,
                  color:
                      Colors.deepPurple), // Or any color that fits your theme
              title: const Text('User Guide'),
              subtitle: const Text('Learn how to use the app'),
              onTap: () {
                // Navigate to User Guide page
              },
            ),
          ),
          // You can add more options as required
        ],
      ),
    );
  }
}
