import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class Service extends StatefulWidget {
  @override
  _ServiceState createState() => _ServiceState();
}

class _ServiceState extends State<Service> {
  //** Firebase Auth/Realtime Database **//
  final FirebaseAuth auth = FirebaseAuth.instance;

  final DatabaseReference rtDB =
      FirebaseDatabase.instance.ref().child("My_Service");

  sendData() {
    rtDB
        .push()
        .set({'Name': 'Lab A', 'Email': 'laba@next.edu', 'Password': '123456'});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Services"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                //******** Signout part******//
                auth.signOut();
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              Center(
                child: Container(
                  child: Text('Enjoy our services!'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    sendData();
                    Navigator.pop(context);
                  },
                  child: Text('Save')),
            ],
          ),
        ),
      ),
    );
  }
}
