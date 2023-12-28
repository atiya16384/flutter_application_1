import 'package:flutter/material.dart';
import 'package:flutter_dropdown_search/flutter_dropdown_search.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BookChapters extends StatefulWidget {
  @override
  State<BookChapters> createState() => _BookChaptersState();
}

class _BookChaptersState extends State<BookChapters> {
  String? selectedChapterId;
  Map<String, dynamic>? selectedChapter;

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  Stream<List<Map<String, dynamic>>> readChapters() {
    return FirebaseFirestore.instance
        .collection('chapters')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              var data = doc.data() as Map<String, dynamic>;
              data['id'] = doc.id; // Capture the document ID
              return data;
            }).toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(228, 92, 162, 100),
      appBar: AppBar(
        title: const Text('Book Chapters'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: signOut,
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: readChapters(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No chapters available.'));
          }

          var chapters = snapshot.data!;

          return Column(
            children: [
              DropdownSearch<Map<String, dynamic>>(
                items: chapters,
                dropdownSearchDecoration: const InputDecoration(
                  labelText: "Select Chapter",
                  contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                  border: OutlineInputBorder(),
                ),
                popupItemBuilder: (context, item, isSelected) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(item['title'] ?? 'No Title'),
                  );
                },
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      selectedChapterId = value['id'];
                      selectedChapter = value;
                    });
                  }
                },
                selectedItem: selectedChapter,
                showSearchBox: true,
                itemAsString: (item) => item['title'] ?? 'No Title',
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: selectedChapter != null
                      ? Text(
                          selectedChapter!['content'] ?? 'No Content',
                          style: const TextStyle(fontSize: 18),
                        )
                      : const Center(child: Text('Please select a chapter')),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
