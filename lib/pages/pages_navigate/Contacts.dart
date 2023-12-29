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
        title: const Text('Contact Us'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: Text('Individual Support',
                  style: TextStyle(color: Colors.deepPurple.shade800)),
              leading: const Icon(Icons.person, color: Colors.deepPurple),
              onTap: () => launchUrl(emailLaunchUri),
            ),
            ListTile(
              title: Text('Workplace Training',
                  style: TextStyle(color: Colors.deepPurple.shade800)),
              leading: const Icon(Icons.work, color: Colors.deepPurple),
              onTap: () => launchUrl(emailLaunchUri),
            ),
            ListTile(
              title: Text('Workshops & Retreats',
                  style: TextStyle(color: Colors.deepPurple.shade800)),
              leading:
                  const Icon(Icons.nature_people, color: Colors.deepPurple),
              onTap: () => launchUrl(emailLaunchUri),
            ),
            ListTile(
              title: Text('Other Queries',
                  style: TextStyle(color: Colors.deepPurple.shade800)),
              leading: const Icon(Icons.more, color: Colors.deepPurple),
              onTap: () => launchUrl(emailLaunchUri),
            ),
            const Divider(color: Colors.deepPurpleAccent),
            ListTile(
              title: Text('Phone',
                  style: TextStyle(color: Colors.deepPurple.shade800)),
              leading: const Icon(Icons.phone, color: Colors.deepPurple),
              onTap: () async {
                final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
                if (await canLaunchUrl(phoneUri)) {
                  await launchUrl(phoneUri);
                } else {
                  // Can't launch the phone Uri, handle error.
                }
              },
            ),
            ListTile(
              title: Text('Email',
                  style: TextStyle(color: Colors.deepPurple.shade800)),
              leading: const Icon(Icons.email, color: Colors.deepPurple),
              onTap: () => launchUrl(emailLaunchUri),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.deepPurple[50],
    );
  }
}
