import 'package:flutter/material.dart';

import 'screens/open_page/login/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: loginPage(),
    );
  } // This widget is the root of your application.
}
