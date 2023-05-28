import 'package:flutter/material.dart';

class complaint extends StatefulWidget {
  const complaint({super.key});

  @override
  State<complaint> createState() => _complaintState();
}

class _complaintState extends State<complaint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register your complaint"),
        centerTitle: true,
        //leading

        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //------- name
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    //hintText: "enter your name" ,
                    label: Text("enter your name")),
              ),
              //------phone number
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    label: Text("phone number")),
              ),

              //------any accident occur

              // TextField(
              //    decoration: InputDecoration(
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(30),

              //     ),
              //     //hintText: "enter your name" ,
              //     label: Text("Any accident occur"),
              //    ),
              // ),

              Container(
                color: Colors.cyanAccent,
                child: Row(
                  children: [
                    Text(
                      "any accident occur",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),

                    //----yes
                    /* ListTile(
                      title: Text("yes"),
                      leading: Radio(
                          value: 'yes',
                          groupValue: option,
                          onChanged: (String? value) {
                            setState(() {
                              option = value;
                            });
                          }),
                    ),
//---no
                    ListTile(
                      title: Text("no"),
                      leading: Radio(
                          value: 'no',
                          groupValue: option,
                          onChanged: (String? value) {
                            setState(() {
                              option = value;
                            });
                          }),
                    ),*/
                  ],
                ),
              ),

              //-------descrption
              TextField(
                //  textAlignVertical: TextAlignVertical.top,
                //    expands:true,
                //     maxLines:null,
                decoration: InputDecoration(
                  label: Text("descrption"),
                  contentPadding: EdgeInsets.all(80),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              //--------danger level
              // TextField(
              //    decoration: InputDecoration(
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(30),
              //     ),
              //     //hintText: "enter your name",
              //     label: Text("Danger level"),
              //    ),
              // ),
              Container(
                color: Colors.cyanAccent,
                child: Row(
                  children: [
                    Text(
                      "Danger level",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),

//----low
                    /*ListTile(
                      title: Text("low"),
                      leading: Radio(
                          value: 'low',
                          groupValue: level,
                          onChanged: (String? value) {
                            setState(() {
                              level = value;
                            });
                          }),
                    ),*/
//---medium
                    /*ListTile(
                      title: Text("medium"),
                      leading: Radio(
                          value: 'medium',
                          groupValue: level,
                          onChanged: (String? value) {
                            setState(() {
                              level = value;
                            });
                          }),
                    ),
//---high
                    ListTile(
                      title: Text("high"),
                      leading: Radio(
                          value: 'high',
                          groupValue: level,
                          onChanged: (String? value) {
                            setState(() {
                              level = value;
                            });
                          }),
                    ),*/
                  ],
                ),
              ),

              // --------------------------upload photo

              TextButton.icon(
                style: ButtonStyle(
                    textStyle: MaterialStateProperty.all(
                      TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    foregroundColor: MaterialStateProperty.all(Colors.black)),
                //text button
                onPressed: () {},
                icon: Icon(Icons.camera_alt_outlined),
                label: Text("upload photos"),
              ),

              //------------------------post
              ElevatedButton(onPressed: () {}, child: Text("post")),
            ],
          ),
        ),
      ),
    );
  }
}
