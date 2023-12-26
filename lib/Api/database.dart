// database.dart
import 'package:cloud_firestore/cloud_firestore.dart';

import '../features/symptom_tracker/add_symptom.dart';

Stream<List<User>> readUsers() =>
    FirebaseFirestore.instance.collection('users').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());
