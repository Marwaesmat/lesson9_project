import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CloudDB extends StatefulWidget {
  @override
  _CloudDB createState() => _CloudDB();
}

class _CloudDB extends State<CloudDB> {
//** Cloud Firestore Part 1 **//
  List<Widget> dataListWidget(AsyncSnapshot snapshot) {
    return snapshot.data.docs.map<Widget>(
        (document) {
      return ListTile(
          title: Text(document['Name']),
          subtitle: Text(document['Country'] + '-' + document['City']));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Use Cloud DB"),
        ),
        body: Center(
          child: Container(
            //**Cloud Firestore Part 2**//

            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('Customers')
                  .snapshots(),
              builder: (context, snapshot) {
                return ListView(
                  children: dataListWidget(snapshot),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
