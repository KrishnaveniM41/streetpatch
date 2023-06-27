import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:streetpatch/screens/complaints/complaint.dart';
import 'package:streetpatch/screens/homepage/feed.dart';
import 'package:streetpatch/screens/suggestions/suggestions.dart';
import 'package:streetpatch/screens/trackComplaints/track.dart';
import 'screens/open_page/login/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: loginPage(),
      debugShowCheckedModeBanner: false,
    );
  } // This widget is the root of your application.
}
