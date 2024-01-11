import 'package:flutter/material.dart';
import 'package:flutter_estudos/app_theme.dart';
import 'package:flutter_estudos/login_screen.dart';  // Importe corretamente

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu app de estudos',
      home: LoginScreen(), 
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: AppTheme.textTheme,
        platform: TargetPlatform.iOS,
      ), 
    );
  }
}
