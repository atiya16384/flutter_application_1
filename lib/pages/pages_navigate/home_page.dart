import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(228, 92, 162, 100),
      appBar: AppBar(
        //colour selected using colour picker
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: signOut,
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      drawer: const NavigationDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Your wellness journey begins now',
              style: TextStyle(
                fontSize: 22,
              ),
            ),

            SizedBox(height: 20),
            Center(
              // Image placeholder
              child: Image.asset(
                'lib/images/homepageImage.png', // Replace with your asset image path
                width: MediaQuery.of(context).size.width *
                    1, // 80% of screen width
                height:
                    300, // Fixed height, adjust according to your image aspect ratio
              ),
            ),
            SizedBox(height: 20),
            _buildDailyTipCard(context),

            // Add more widgets as needed
          ],
        ),
      ),
    );
  }
}

Widget _buildDailyTipCard(BuildContext context) {
  // Placeholder for daily tip data
  String dailyTip = "Remember to stay hydrated and maintain a balanced diet!";

  return Card(
    elevation: 4.0,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            //could possibly implement an API for daily tip
            'Daily Tip',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Text(
            dailyTip,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    ),
  );
}

// we crearted another class
// this needs to extend to the homepage class
//implement some sort of inheritance

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              DrawerHeader(
                decoration:
                    BoxDecoration(color: Color.fromRGBO(228, 92, 162, 100)),
                child: SvgPicture.asset(
                  'assets/logo.svg', // Assuming you have a logo in SVG format
                  fit: BoxFit.cover,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home_outlined),
                title: const Text('Home'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.notifications_outlined),
                title: const Text('Notifications'),
                onTap: () {},
              ),
              // Add more ListTile widgets as needed
            ],
          ),
        ),
      );
}
