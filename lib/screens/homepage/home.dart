import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:streetpatch/screens/complaints/complaint.dart';
import 'package:streetpatch/screens/homepage/feed.dart';

import 'package:streetpatch/screens/suggestions/suggestions.dart';
import 'package:streetpatch/screens/trackComplaints/track.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  final items = [
    Icon(
      Icons.home,
      size: 25,
    ),
    Icon(
      Icons.add,
      size: 25,
    ),
    Icon(
      Icons.post_add_rounded,
      size: 25,
    ),
    Icon(
      Icons.track_changes,
      size: 25,
    )
  ];

  int index = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(0, 0, 0, 0),
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        index: index,
        onTap: (selctedIndex) {
          setState(() {
            index = selctedIndex;
          });
        },
        height: 60,
        backgroundColor: Color.fromARGB(0, 0, 0, 0),
        animationDuration: const Duration(milliseconds: 300),
        // animationCurve: ,
      ),
      body: Container(
          color: Colors.blue,
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: getSelectedWidget(index: index)),
    );
  }
}

Widget getSelectedWidget({required int index}) {
  Widget widget;
  switch (index) {
    case 0:
      widget = const homePage();
      break;
    case 1:
      widget = const complaint();
      break;
    case 2:
      widget = const SuggPage();
      break;

    default:
      widget = const trackpage();
      break;
  }
  return widget;
}
