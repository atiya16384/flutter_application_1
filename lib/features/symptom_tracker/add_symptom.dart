import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'button_tab.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/models/users.dart';
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

  @override
  Widget build(BuildContext context) {
//we create info symptom

    //once the info has been added to firebase, we read the relevant information
    //read the info sysmptom from firebase to display on app screen

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
          ]),
      body:

//read the info system data

          SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
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
                trailing: const Icon(Icons.calendar_today),
                onTap: () => _selectDate(context),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                child: const Text('Add Info'),
                onPressed: () {
                  final user = User(
                    symptom: controllerSymptom.text,
                    prescription: controllerPrescription.text,
                    todaysdate: selectedDate,
                    id: '',
                  );
                  createInfoSymptom(user);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
