import 'package:flutter/material.dart';

class PageTransitionPage2 extends StatefulWidget {
  const PageTransitionPage2({super.key});

  @override
  State<PageTransitionPage2> createState() => _PageTransitionPage2State();
}

class _PageTransitionPage2State extends State<PageTransitionPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(title: Text("Page 2")),
      body: Column(),
    );
  }
}
