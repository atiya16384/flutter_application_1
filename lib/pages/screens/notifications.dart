import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> notifications = [
    // Placeholder data - replace with your actual data source
    {
      'title': 'New Message',
      'subtitle': 'You have received a new message.',
      'timestamp': '2 min ago',
    },
    {
      'title': 'System Update',
      'subtitle': 'System update is available. Please update your app.',
      'timestamp': '1 hour ago',
    },
    {
      'title': 'Account Alert',
      'subtitle': 'Your account was accessed from an unknown device.',
      'timestamp': 'Yesterday',
    },
    // Add more notifications as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.deepPurple, // Or any color that fits your theme
      ),
      body: ListView.separated(
        itemCount: notifications.length,
        separatorBuilder: (context, index) =>
            Divider(color: Colors.grey.shade300),
        itemBuilder: (context, index) {
          var notification = notifications[index];
          return ListTile(
            leading: const Icon(
              Icons.notifications_none,
              color: Colors.deepPurple, // Or any color that fits your theme
            ),
            title: Text(notification['title']),
            subtitle: Text(notification['subtitle']),
            trailing: Text(
              notification['timestamp'],
              style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
            ),
            onTap: () {
              // Handle the tap event, potentially navigate to the detail page
            },
          );
        },
      ),
    );
  }
}
