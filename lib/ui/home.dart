import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
@override
  Widget build(BuildContext context ) {
    return new Scaffold (
      appBar: new AppBar(
          title: new Text('Firestore Demo'),
      ),
      body:StreamBuilder(
        stream: Firestore.instance.collection('Text_questions').snapshots(),
        builder: (context,snapshot) {
          if(!snapshot.hasData) return Text('Loading data');
          return Column(
            children: <Widget>[
              Text(snapshot.data.documents[0]['quest'])
            ],
          );
        },
      )
    );
  }
}