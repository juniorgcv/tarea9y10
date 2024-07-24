import 'package:flutter/material.dart';
import 'input_page.dart';
import 'map_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarea 9 y 10',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/map': (context) => const MapPage(),
      },
    );
  }
}
