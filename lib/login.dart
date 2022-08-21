import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //**Firebase Auth Part 1**//
  String email = "";
  String password = "";
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Login"),
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
                    child: Text('Login',
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
                          controller: _controller,
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
                  // **************** Login Button ****************
                  Center(
                    child: Container(
                      width: 100,
                      child: ElevatedButton(
                        child: Text('login'),
                        onPressed: ()
                            //**Firebase Auth Part 2**//
                            async {
                          try {
                            final user = await _auth.signInWithEmailAndPassword(
                                email: email, password: password);
                            if (user != null) {
                              Navigator.pushNamed(context, 'Service');
                              _controller.clear();
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
