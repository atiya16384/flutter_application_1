import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Contacts extends StatelessWidget {
  final String phoneNumber = '07805515936';
  final String email = 'hello@freddycarrick.com';
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'hello@freddycarrick.com',
    query: encodeQueryParameters(
        <String, String>{'subject': 'Inquiry from Menopause Unzipped App'}),
  );

  static String encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
        backgroundColor: Colors.black, // Updated theme color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildContactTile(
                'Individual Support', Icons.person, emailLaunchUri),
            _buildContactTile('Workplace Training', Icons.work, emailLaunchUri),
            _buildContactTile(
                'Workshops & Retreats', Icons.nature_people, emailLaunchUri),
            _buildContactTile('Other Queries', Icons.more, emailLaunchUri),
            const Divider(color: Colors.grey),
            _buildPhoneTile('Phone', Icons.phone, phoneNumber),
            _buildEmailTile('Email', Icons.email, emailLaunchUri),
          ],
        ),
      ),
      backgroundColor: Colors.white, // Updated theme color
    );
  }

  ListTile _buildContactTile(String title, IconData icon, Uri launchUri) {
    return ListTile(
      title: Text(title,
          style: TextStyle(color: Colors.black)), // Updated text color
      leading: Icon(icon, color: Colors.pink), // Updated icon color
      onTap: () => launchUrl(launchUri),
    );
  }

  ListTile _buildPhoneTile(String title, IconData icon, String phoneNumber) {
    return ListTile(
      title: Text(title,
          style: TextStyle(color: Colors.black)), // Updated text color
      leading: Icon(icon, color: Colors.pink), // Updated icon color
      onTap: () async {
        final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
        if (await canLaunchUrl(phoneUri)) {
          await launchUrl(phoneUri);
        } else {
          // Handle error
        }
      },
    );
  }

  ListTile _buildEmailTile(String title, IconData icon, Uri launchUri) {
    return ListTile(
      title: Text(title,
          style: const TextStyle(color: Colors.black)), // Updated text color
      leading: Icon(icon, color: Colors.pink), // Updated icon color
      onTap: () => launchUrl(launchUri),
    );
  }
}
