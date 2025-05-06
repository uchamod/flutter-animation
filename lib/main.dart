import 'package:animation/pages/explicit%20animation/page_transition_page1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "animation test",
      debugShowCheckedModeBanner: false,

      home: PageTransitionPage1(),
    );
  }
}
