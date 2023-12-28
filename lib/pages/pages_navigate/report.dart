import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ReportPage extends StatelessWidget {
  // Method to sign out the user
  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  // Method to fetch symptom data from Firestore
  Future<List<Map<String, dynamic>>> fetchSymptomData() async {
    // Retrieve all documents within the 'users' collection
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').get();

    List<Map<String, dynamic>> symptomData = [];
    // Iterate through each document in the collection
    for (var doc in snapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      // Check if the document contains 'symptom' and 'symptomSeverity' fields
      if (data.containsKey('symptom') && data.containsKey('symptomSeverity')) {
        // Add the symptom and its severity to the list
        symptomData.add({
          'symptom': data['symptom'],
          'severity': data['symptomSeverity'],
        });
      }
    }
    return symptomData;
  }

  // Method to process the fetched data and count the occurrence of each severity level
  Map<int, int> processSymptomData(List<Map<String, dynamic>> symptomData) {
    Map<int, int> severityCounts = {};

    // Iterate through each symptom data entry
    for (var data in symptomData) {
      int severity = data['severity'] as int;
      // Increment the count for the severity level
      severityCounts[severity] = (severityCounts[severity] ?? 0) + 1;
    }

    return severityCounts; // Return the map of severity counts
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Color.fromRGBO(228, 92, 162, 100),
      appBar: AppBar(
        title: const Text('Report Summary'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: signOut,
            icon: const Icon(Icons.logout),
            tooltip: 'Sign Out', // Tooltip for the logout button
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // FutureBuilder to handle asynchronous data fetching
              FutureBuilder<List<Map<String, dynamic>>>(
                future: fetchSymptomData(), // Fetch the symptom data
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Display a loading indicator while waiting for data
                    return Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    // Display a message if no data is available
                    return Text('No data available');
                  }

                  // Process the fetched data to count the severity occurrences
                  Map<int, int> severityCounts =
                      processSymptomData(snapshot.data!);

                  // Create a list of widgets based on the severity counts
                  List<Widget> severityWidgets = severityCounts.entries
                      .map((entry) => Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 4.0,
                            child: ListTile(
                              title: Text('Severity Level: ${entry.key}'),
                              subtitle: Text('Count: ${entry.value}'),
                            ),
                          ))
                      .toList();

                  return Column(
                      children:
                          severityWidgets); // Display the severity widgets
                },
              ),
              // Add more widgets or cards here as needed
            ],
          ),
        ),
      ),
    );
  }
}
