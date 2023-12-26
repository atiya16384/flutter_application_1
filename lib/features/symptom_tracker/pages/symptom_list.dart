import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../add_symptom.dart';

class SymptomDisplayScreen extends StatelessWidget {
  final Stream<List<User>> userStream;

  SymptomDisplayScreen({required this.userStream});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Symptom Tracker Results'),
      ),
      body: StreamBuilder<List<User>>(
        stream: userStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<User> users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                User user = users[index];
                return ListTile(
                  title: Text('Symptom: ${user.symptom}'),
                  subtitle: Text('Prescription: ${user.prescription}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
