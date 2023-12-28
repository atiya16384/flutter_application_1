import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/features/symptom_tracker/add_symptom.dart';
import 'package:flutter_application_1/models/users.dart' as userModel;
import 'package:flutter_application_1/components/button_location.dart';
import 'package:intl/intl.dart';

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

  void deleteUser(String userId) async {
    if (userId.isNotEmpty) {
      try {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .delete();
        // You might want to show a snackbar or a dialog to confirm deletion or to inform that it was successful.
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("User deleted successfully"),
          ),
        );
      } catch (e) {
        // Handle the error, for instance by showing an error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error deleting user: $e"),
          ),
        );
      }
    }
  }

  Stream<List<userModel.User>> readUsers() => FirebaseFirestore.instance
      .collection('users')
      .snapshots()
      .map((snapshot) =>
          //what is doc
          //we get the data from the json file and convert to list
          snapshot.docs
              .map(((doc) => userModel.User.fromJson(doc.data())))
              .toList());

  Widget buildUser(userModel.User user) => Card(
        elevation: 2, // Adds a subtle shadow
        margin: const EdgeInsets.symmetric(
            horizontal: 8, vertical: 4), // Adds margin around the card
        child: ListTile(
          leading: Icon(Icons.report_problem,
              color: Theme.of(context).colorScheme.secondary),
          title: Text(user.symptom ?? 'No symptom',
              style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(user.prescription ?? 'No prescription'),
          trailing: Wrap(
            spacing: 12, // space between two icons
            children: <Widget>[
              Text(user.todaysdate != null
                  ? DateFormat('yyyy-MM-dd').format(user.todaysdate!)
                  : 'No date'), // Date text
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () => deleteUser(user.id),
                // Call the deleteUser function when the button is pressed
              ),
            ],
          ),
          isThreeLine: true,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(228, 92, 162, 100),
      appBar: AppBar(
        title: const Text('Add data below'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: signOut,
            icon: const Icon(Icons.logout),
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
      floatingActionButtonLocation: const BottomRightButton(),
      body: StreamBuilder<List<userModel.User>>(
        stream: readUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final users = snapshot.data!;
          return ListView.separated(
            itemCount: users.length,
            separatorBuilder: (context, index) => const Divider(
                color: Colors.grey), // Adds a divider between items
            itemBuilder: (context, index) => buildUser(users[index]),
          );
        },
      ),
    );
  }
}
