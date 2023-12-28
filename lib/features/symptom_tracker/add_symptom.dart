import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/models/users.dart' as userModel;

class CreateSymptomTab extends ConsumerStatefulWidget {
  const CreateSymptomTab({super.key});

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
  int selectedSeverity = 1; // Variable to store the selected severity

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

  Future createInfoSymptom(userModel.User user) async {
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
        ],
      ),
      body: SafeArea(
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
              DropdownButton<int>(
                value: selectedSeverity,
                items: <int>[1, 2, 3, 4, 5]
                    .map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
                onChanged: (int? newValue) {
                  setState(() {
                    selectedSeverity = newValue ?? 1;
                  });
                },
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
                  final user = userModel.User(
                    symptom: controllerSymptom.text,
                    prescription: controllerPrescription.text,
                    todaysdate: selectedDate,
                    symptomSeverity: selectedSeverity,
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
