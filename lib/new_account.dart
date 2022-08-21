import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NewAccount extends StatefulWidget {
  @override
  _NewAccountState createState() => _NewAccountState();
}

class _NewAccountState extends State<NewAccount> {
  //**ADD Firebase Auth Part 1**//
  String email = "";
  String password = "";
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("New Account"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: Text('New User Account',
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // **************** User Name ****************
                  Row(
                    children: [
                      Text('Email Address:'),
                      SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: 220,
                        child: TextField(
                          onChanged: (eVal) {
                            email = eVal;
                          },

                          style: TextStyle(color: Colors.teal),
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.done,
                          autocorrect: false,
                          cursorColor: Colors.red,
                          decoration: InputDecoration(
                            hintText: 'Your Email',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // **************** Password ****************
                  Row(
                    children: [
                      Text('Password:'),
                      SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: 220,
                        child: TextField(
                          onChanged: (pVal) {
                            password = pVal;
                          },

                          obscureText: true,
                          style: TextStyle(color: Colors.teal),
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.done,
                          autocorrect: false,
                          cursorColor: Colors.red,
                          decoration: InputDecoration(
                            hintText: 'Your Password',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // **************** Create Button ****************
                  Center(
                    child: Container(
                      width: 100,
                      child: ElevatedButton(
                        child: Text('Create'),
                        onPressed: ()
                          //** Firebase Auth Part 2 **//
                            async {
                          try {
                            final newUser =
                                await _auth.createUserWithEmailAndPassword(
                                    email: email, password: password);
                            if (newUser != null) {
                              print("Account has been created!");
                              Navigator.pushNamed(context, 'Home');
                            }
                          } catch (e) {
                            print(e);
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
