import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/symptom_tracker/add_symptom.dart';

// the widget associated with the symptom tracker option
class trackSymp extends StatefulWidget {
  // we add a route
  static route() => MaterialPageRoute(
        builder: (context) => trackSymp(),
      );

  @override
  State<trackSymp> createState() => _trackSympState();
}

// @override
// void initState() {
//   getlistIDs();
//   super.initState();
// }

class _trackSympState extends State<trackSymp> {
  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  onAddSymptom() {
    Navigator.push(context, CreateSymptomTab.route());
  }

  // Stream<List<User>> readUsers() => FirebaseFirestore.instance
  //     .collection('users')
  //     .snapshots()
  //     .map((snapshot) =>
  //         //what is doc
  //         //we get the data from the json file and convert to list
  //         snapshot.docs.map(((doc) => User.fromJson(doc.data()))).toList());

  // Widget buildUser(User user) => ListTile(
  //       subtitle: Text(user.symptom + user.prescription),
  //       //title: Text(user.prescription),
  //     );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(228, 92, 162, 100),
      appBar: AppBar(
        title: Text('Add data below'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: signOut,
            icon: const Icon(Icons.logout),
            // color: Colors.black,
            //change colour of app bar to black
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onAddSymptom,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          //Change background of button to pink
          //change
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
