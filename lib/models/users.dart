import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String
      id; // id should not be late as it's always initialized in the constructor
  final String? symptom; // Make symptom nullable
  final String? prescription; // Make prescription nullable
  final DateTime? todaysdate; // Already nullable
  final int? symptomSeverity; //symptom severity

  User({
    required this.id, // id is required and should not have a default value
    this.symptom, // symptom is nullable, so it's not required
    this.prescription, // prescription is nullable, so it's not required
    this.todaysdate, // todaysdate is nullable, so it's not required
    this.symptomSeverity,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'symptom':
            symptom, // No need to check for null as Firestore supports null values
        'prescription':
            prescription, // No need to check for null as Firestore supports null values
        'todaysdate':
            todaysdate != null ? Timestamp.fromDate(todaysdate!) : null,
        'symptomSeverity': symptomSeverity,
      };

  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'] ?? '', // Provide a default empty string if null
        symptom: json['symptom'] as String?, // Cast to a nullable String
        prescription:
            json['prescription'] as String?, // Cast to a nullable String
        todaysdate: json['todaysdate'] != null
            ? (json['todaysdate'] as Timestamp).toDate()
            : null,
        symptomSeverity: json['symptomSeverity'] as int?,
      );
}
