import 'package:flutter/material.dart';
import 'package:flutter_estudos/drawer.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
            drawer: AppDrawer(),

      body: Center(
        child: Text('Bem-vindo à tela Home!'),
      ),
    );
  }
}
