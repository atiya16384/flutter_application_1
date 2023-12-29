import 'dart:js';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Help extends StatelessWidget {
  // Define the contact methods
  final Uri nhsUri = Uri.parse('https://www.nhs.uk/conditions/menopause/');
  final String emergencyNumber = '999'; // Use the appropriate emergency number

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help & Support'),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: const Text('NHS Menopause Guide'),
            subtitle: const Text('Comprehensive information on menopause'),
            leading: const Icon(Icons.library_books, color: Colors.deepPurple),
            onTap: () => _launchUrl(context, nhsUri),
          ),
          ListTile(
            title: const Text('Emergency Services'),
            subtitle:
                const Text('Contact in case of immediate health emergency'),
            leading: const Icon(Icons.local_hospital, color: Colors.deepPurple),
            onTap: () => _makePhoneCall(context, emergencyNumber),
          ),
          ListTile(
            title: const Text('Support Networks'),
            subtitle: const Text('Find support groups and communities'),
            leading: const Icon(Icons.people, color: Colors.deepPurple),
            onTap: () {
              // Navigate to support networks page or perform another action
            },
          ),
          // ... Add more helpful resources and contacts as needed
        ],
      ),
    );
  }

  // Helper method to launch URLs
  void _launchUrl(BuildContext context, Uri url) async {
    if (!await launchUrl(url)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch $url')),
      );
    }
  }

  // Helper method to make phone calls
  void _makePhoneCall(BuildContext context, String phoneNumber) async {
    final Uri callUri = Uri(scheme: 'tel', path: phoneNumber);
    if (!await launchUrl(callUri)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not place a call to $phoneNumber')),
      );
    }
  }
}
