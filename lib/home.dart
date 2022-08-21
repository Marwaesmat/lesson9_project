import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Firebase Authentication"),
        ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: Text('New User Account'),
                onPressed: (){Navigator.pushNamed(context, 'NewAccount');},
              ),
              SizedBox(height: 40,),
              ElevatedButton(
                child: Text('Login'),
                onPressed: (){Navigator.pushNamed(context, 'Login');},
              ),
              SizedBox(height: 40,),
              ElevatedButton(
                child: Text('Cloud'),
                onPressed: (){Navigator.pushNamed(context, 'Cloud');},
              ),
            ],
        ),
      ),
      ),
    );
  }
}