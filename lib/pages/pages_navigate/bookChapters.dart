import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class bookChapters extends StatefulWidget {
  @override
  State<bookChapters> createState() => _bookChaptersState();
}

class _bookChaptersState extends State<bookChapters> {
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(228, 92, 162, 100),
        appBar: AppBar(
          backgroundColor: Colors.black,
          actions: [
            IconButton(
              onPressed: signOut,
              icon: const Icon(Icons.logout),
            )
          ],
        ),
        body: PageView(children: [
          //  controller: pageController,

          Container(
              color: Colors.red, child: const Center(child: Text('Page 1'))),
          Container(
              color: Colors.indigo, child: const Center(child: Text('Page 2'))),
          Container(
              color: Colors.green, child: const Center(child: Text('Page 3'))),
        ]));
  }
}
