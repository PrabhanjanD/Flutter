import 'package:flutter/material.dart';
import 'package:to_do_advance_ui/assignment3.dart';
import 'assignment3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TODOAppUI(),
      debugShowCheckedModeBanner: false,
    );
  }
}
