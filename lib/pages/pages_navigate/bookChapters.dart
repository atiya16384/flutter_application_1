import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class bookChapters extends StatelessWidget {
  const bookChapters({super.key});

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page 3"),
        actions: [
          IconButton(
            onPressed: signOut,
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      drawer: const NavigationDrawer1(),
    );
  }
}

class NavigationDrawer1 extends StatelessWidget {
  const NavigationDrawer1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Header(context),
              Items(context),
            ],
          ),
        ),
      );

  Widget Header(BuildContext context) => Container(
          padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ));

  Widget Items(BuildContext context) => Column(
        children: [
          ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Chapter 1'),
              onTap: () {}),
          ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Chapter 2'),
              onTap: () {}),
        ],
      );
}
