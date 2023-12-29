// NotificationsScreen.dart
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> notifications = [
    {
      'title': 'New Message',
      'subtitle': 'You have received a new message.',
      'timestamp': '2 min ago',
    },
    // Add more notifications as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.black,
      ),
      body: ListView.separated(
        itemCount: notifications.length,
        separatorBuilder: (context, index) =>
            Divider(color: Colors.grey.shade300),
        itemBuilder: (context, index) {
          var notification = notifications[index];
          return ListTile(
            leading: const Icon(Icons.notifications_none, color: Colors.white),
            title: Text(notification['title'],
                style: TextStyle(color: Colors.black)),
            subtitle: Text(notification['subtitle'],
                style: TextStyle(color: Colors.grey)),
            trailing: Text(notification['timestamp'],
                style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
            onTap: () {
              // Handle tap event
            },
          );
        },
      ),
    );
  }
}
