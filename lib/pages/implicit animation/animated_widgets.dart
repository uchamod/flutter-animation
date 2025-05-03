import 'package:flutter/material.dart';

class AnimatedWidgets extends StatefulWidget {
  const AnimatedWidgets({super.key});

  @override
  State<AnimatedWidgets> createState() => _AnimatedWidgetsState();
}

class _AnimatedWidgetsState extends State<AnimatedWidgets> {
  bool _isExpand = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isExpand = !_isExpand;
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 1500),
                curve: Curves.easeInOut,
                width: _isExpand ? 150 : 300,
                height: _isExpand ? 150 : 300,
                decoration: BoxDecoration(
                  color: _isExpand ? Colors.red : Colors.blue,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
