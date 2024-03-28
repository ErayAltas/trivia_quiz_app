import 'package:flutter/material.dart';
import 'package:trivia_quiz_app/ui/pages/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Open Trivia',
      home: HomePage(),
    );
  }
}
