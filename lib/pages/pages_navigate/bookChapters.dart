import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
    return FirebaseFirestore.instance.collection('chapters').snapshots().map(
        (snapshot) =>
            snapshot.docs.map((doc) => doc.data()..['id'] = doc.id).toList());
  }

  void selectChapter(String? chapterId) async {
    if (chapterId == null) return;

    DocumentSnapshot chapterSnapshot = await FirebaseFirestore.instance
        .collection('chapters')
        .doc(chapterId)
        .get();

    if (chapterSnapshot.exists) {
      setState(() {
        selectedChapterId = chapterId;
        selectedChapter = chapterSnapshot.data() as Map<String, dynamic>;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Color.fromRGBO(228, 92, 162, 100),
      appBar: AppBar(
        title: const Text('Book Chapters'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: signOut,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: StreamBuilder<List<Map<String, dynamic>>>(
          stream: readChapters(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No chapters available.'));
            }

            List<DropdownMenuItem<String>> chapterItems = snapshot.data!
                .map((chapter) => DropdownMenuItem<String>(
                      value: chapter['id'],
                      child: Text(
                        chapter['title'] ?? 'No Title',
                        style:
                            TextStyle(fontSize: 16, color: theme.primaryColor),
                      ),
                    ))
                .toList();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: selectedChapterId,
                      hint: Text(
                        'Select a Chapter',
                        style: TextStyle(color: Colors.grey[800]),
                      ),
                      onChanged: (value) {
                        setState(() {
                          selectedChapterId = value;
                        });
                        selectChapter(value);
                      },
                      items: chapterItems,
                      dropdownColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: selectedChapter != null
                        ? Text(
                            selectedChapter!['content'] ?? 'No Content',
                            style: const TextStyle(
                                fontSize: 18, color: Colors.black87),
                          )
                        : Center(
                            child: Text('Please select a chapter',
                                style: TextStyle(color: Colors.grey[700]))),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
