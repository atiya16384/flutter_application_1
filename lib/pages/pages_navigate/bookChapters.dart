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
        drawer: const NavigationDrawer1(),
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
