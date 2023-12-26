import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/pages_navigate/Settings.dart';
import 'package:flutter_application_1/pages/pages_navigate/report.dart';

import '../pages/pages_navigate/home_page.dart';
import '../pages/pages_navigate/bookChapters.dart';
import '../pages/pages_navigate/symptom_tracker.dart';

// we used the cupertino to create the bottom navigation bar
// this cupertino navigation bar disappears
// need to link with other pages
class PageConst extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
            // have a list of bottom navigation bar items
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.track_changes),
              label: 'Symptom Tracker',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Book Chapters',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.report),
              label: 'Report',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),

        //we have a switch statement to switch between the different pages on the app
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return CupertinoTabView(builder: (context) {
                return CupertinoPageScaffold(child: HomePage());
              });
            case 1:
              return CupertinoTabView(builder: (context) {
                return CupertinoPageScaffold(child: trackSymp());
              });

            case 2:
              return CupertinoTabView(builder: (context) {
                return CupertinoPageScaffold(child: bookChapters());
              });

            case 3:
              return CupertinoTabView(builder: (context) {
                return CupertinoPageScaffold(child: ReportPage());
              });

            case 4:
              return CupertinoTabView(builder: (context) {
                return CupertinoPageScaffold(child: Settings());
              });
//the default case is homepage
            default:
              return CupertinoTabView(builder: (context) {
                return CupertinoPageScaffold(child: HomePage());
              });
          }
        });
  }
}
