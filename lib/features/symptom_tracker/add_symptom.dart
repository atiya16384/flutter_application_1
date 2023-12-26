import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'button_tab.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//tab that opens up when the user presses addition
//take the CRUD approach

class CreateSymptomTab extends ConsumerStatefulWidget {
  const CreateSymptomTab({super.key});

  //we add a static route
  static route() => MaterialPageRoute(
        builder: (context) => const CreateSymptomTab(),
      );
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateSymptomTab();
}

class _CreateSymptomTab extends ConsumerState<CreateSymptomTab> {
  final controllerSymptom = TextEditingController();
  final controllerPrescription = TextEditingController();
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future createInfoSymptom(User user) async {
    try {
      final docUser = FirebaseFirestore.instance.collection('users').doc();
      user.id = docUser.id;

      final json = user.toJson();
      await docUser.set(json);
    } catch (e) {
      print('Error adding user: $e');
    }
  }

  InputDecoration design(String label) => InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      );

  //document IDs

  // List<String> listIDs = [];

  // Future getlistIDs() async {
  //   await FirebaseFirestore.instance.collection('users').get().then(
  //         (snapshot) => snapshot.docs.forEach((dataItem) {
  //           print(dataItem.reference);
  //           listIDs.add(dataItem.reference.id);
  //         }),
  //       );
  // }

  // @override
  // void initState() {
  //   getlistIDs();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
//we create info symptom

    //once the info has been added to firebase, we read the relevant information
    //read the info sysmptom from firebase to display on app screen

    Stream<List<User>> readUsers() => FirebaseFirestore.instance
        .collection('users')
        .snapshots()
        .map((snapshot) =>
            //what is doc
            //we get the data from the json file and convert to list
            snapshot.docs.map(((doc) => User.fromJson(doc.data()))).toList());

    return Scaffold(
      appBar: AppBar(
          title: const Text('Tracker'),
          backgroundColor: const Color.fromRGBO(228, 92, 162, 100),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              size: 30,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ]
          // actions: [
          //   ButtonTab(
          //     onTap: () async {
          //       final symptom = tabTextController.text;
          //       createSymptom(symptom: symptom);
          //     },
          //     label: 'Add Symptom',
          //   ),
          // ],
          ),
      body:

//read the info system data

          SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // const SizedBox(width: 15),
              // TextField(
              //   controller: tabTextController,
              //   style: const TextStyle(
              //     fontSize: 22,
              //   ),
              //   decoration: const InputDecoration(
              //     hintText: "Note a symptom here",
              //     hintStyle: TextStyle(
              //       color: Colors.grey,
              //       fontSize: 22,
              //       fontWeight: FontWeight.w600,
              //     ),
              //     border: InputBorder.none,
              //   ),
              //   maxLines: null,
              //add some border stuff
              TextField(
                controller: controllerSymptom,
                decoration: design('Symptom'),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: controllerPrescription,
                decoration: design('Prescription'),
              ),
              const SizedBox(height: 24),
              ListTile(
                title: Text(
                  "Selected date: ${DateFormat('yyyy-MM-dd').format(selectedDate)}",
                ),
                trailing: Icon(Icons.calendar_today),
                onTap: () => _selectDate(context),
              ),
              const SizedBox(height: 24),
//if condition evaluates to true, the consequent
              // DateTimeField(
              //   controller: controllerDate,
              //   decoration: design('Date'),
              //   format: DateFormat('yyyy-MM-dd'),
              //   ShowPicker: (context, currentValue) =>
              //     context: context,
              //     firstDate: DateTime(1930),
              //     lastDate: DateTime(2100),
              //     initialDate: currentValue ??

              //function for the
              //              void _datePickerField() {
              // showDatePicker(
              //     context: context,
              //     initialDate: DateTime.now(),
              //     firstDate: DateTime(1930),
              //     lastDate: DateTime(2100));

              // ),

              ElevatedButton(
                child: const Text('Add Info'),
                onPressed: () {
                  final user = User(
                    symptom: controllerSymptom.text,
                    prescription: controllerPrescription.text,
                    todaysdate: selectedDate,
                  );
                  createInfoSymptom(user);

                  //      Navigator.pop(context);

                  // StreamBuilder<List<User>>(
                  //     stream: readUsers(),
                  //     builder: (context, snapshot) {
                  //       //we need to handle errors
                  //       // we check if we have an error in getting data
                  //       //getting an eror in capturing the data from firebase
                  //       if (snapshot.hasError) {
                  //         // getting an error in capturing the daa
                  //         return const Text(
                  //             'something went wrong!' /* ${snapshot.error}*/);
                  //         //this elif needs to produce output onto screen
                  //       } else if (snapshot.hasData) {
                  //         final users = snapshot.data!;
                  //         //may need to display a builder here
                  //         return ListView(
                  //           children: users.map(buildUser).toList(),
                  //         );
                  //       } else {
                  //         return const Center(
                  //             child: CircularProgressIndicator());
                  //       }
                  //     });
                  // Navigator.pop(context);
                },
              ),
              // Expanded(
              //     child: FutureBuilder(
              //         future: getlistIDs(),
              //         builder: (context, snapshot) {
              //           return ListView.builder(
              //               itemCount: listIDs.length,
              //               itemBuilder: (context, index) {
              //                 return ListTile(
              //                   title: Text(listIDs[index]),
              //                 );
              //               });
              //         })),
              //read info from the firebase
              // StreamBuilder<List<User>>(
              //     stream: readInfoSymptom(),
              //     builder: (context, snapshot) {
              //       //we need to handle errors
              //       // we check if we have an error in getting data
              //       //getting an eror in capturing the data from firebase
              //       if (snapshot.hasError) {
              //         // getting an error in capturing the daa
              //         return const Text(
              //             'something went wrong!' /* ${snapshot.error}*/);
              //       } else if (snapshot.hasData) {
              //         final users = snapshot.data!;

              //         return ListView(
              //           children: users.map(buildUser).toList(),
              //         );
              //       } else {
              //         return const Center(child: CircularProgressIndicator());
              //       }
              //     }),
            ],
          ),
        ),
      ),
    );
  }
}

class User {
  //late is added to tell the compiler to treat this variable as non-nullable
  //without it the compiler will treat this as non-zero and cause an error
  // we use final to indicate that the attribute should not be reassigned or redefined or overriden
  late String id;
  late final String symptom;
  late final String prescription;
  late final DateTime todaysdate; // Add a DateTime field

  User({
    this.id = ' ',
    required this.symptom,
    required this.prescription,
    required this.todaysdate, // Add required date parameter
  });

  // Modify toJson to include the date
  Map<String, dynamic> toJson() => {
        'id': id,
        'symptom': symptom,
        'prescription': prescription,
        'todaysdate': todaysdate, // Save date as Timestamp
      };

  // Modify fromJson to include the date
  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        symptom: json['symptom'],
        prescription: json['prescription'],
        todaysdate: (json['todaysdate'] as Timestamp)
            .toDate(), // Convert Timestamp to DateTime
      );
}
