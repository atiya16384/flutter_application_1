import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Help extends StatelessWidget {
  final Uri nhsUri = Uri.parse('https://www.nhs.uk/conditions/menopause/');
  final String emergencyNumber = '999';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help & Support'),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            tileColor: Colors.pink.shade50,
            title: const Text(
              'NHS Menopause Guide',
              style: TextStyle(color: Colors.black),
            ),
            subtitle: Text(
              'Comprehensive information on menopause',
              style: TextStyle(color: Colors.grey.shade600),
            ),
            leading: Icon(Icons.library_books, color: Colors.pink.shade300),
            onTap: () => _launchUrl(context, nhsUri),
          ),
          ListTile(
            tileColor: Colors.pink.shade50,
            title: Text(
              'Emergency Services',
              style: TextStyle(color: Colors.black),
            ),
            subtitle: Text(
              'Contact in case of immediate health emergency',
              style: TextStyle(color: Colors.grey.shade600),
            ),
            leading: Icon(Icons.local_hospital, color: Colors.pink.shade300),
            onTap: () => _makePhoneCall(context, emergencyNumber),
          ),
          ListTile(
            tileColor: Colors.pink.shade50,
            title: Text(
              'Support Networks',
              style: TextStyle(color: Colors.black),
            ),
            subtitle: Text(
              'Find support groups and communities',
              style: TextStyle(color: Colors.grey.shade600),
            ),
            leading: Icon(Icons.people, color: Colors.pink.shade300),
            onTap: () {
              // Navigate to support networks page or perform another action
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }

  void _launchUrl(BuildContext context, Uri url) async {
    if (!await launchUrl(url)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch $url')),
      );
    }
  }

  void _makePhoneCall(BuildContext context, String phoneNumber) async {
    final Uri callUri = Uri(scheme: 'tel', path: phoneNumber);
    if (!await launchUrl(callUri)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not place a call to $phoneNumber')),
      );
    }
  }
}
