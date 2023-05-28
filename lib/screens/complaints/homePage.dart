import 'package:flutter/material.dart';
import 'package:streetpatch/screens/complaints/project.dart';

void main() {
  runApp(myapp());
}

class myapp extends StatefulWidget {
  const myapp({super.key});

  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => complaint()));
                    //Navigator.of(context).push(MaterialPageRoute(builder: (ctx){ return Productscreen();}));
                  },
                  child: Text(
                    "complaint register",
                    style: TextStyle(fontSize: 20),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
