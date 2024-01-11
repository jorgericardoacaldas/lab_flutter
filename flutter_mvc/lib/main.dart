import 'package:flutter/material.dart';
import 'package:flutter_mvc/start.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Catalogo",
      // theme: ThemeData.dark(useMaterial3: true),
      home: Start(),
    );
  }
}
