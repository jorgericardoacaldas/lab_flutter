import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
        ), 
        body: Column(
          children: <Widget>[
            Image.asset('/Users/catalog/Documents/flutter_examples/lab/lab_flutter/bytebank/assets/bytebank_logo.png'),
            Container(
              color: Colors.green,
              child: Column(
                children: <Widget>[
                  Icon(Icons.people),
                  Text('Contacts')
                ],
              ),
            ),
          ],
        ), 
      ), 
    ); 
  }
}