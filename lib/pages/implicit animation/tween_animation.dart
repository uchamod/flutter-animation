import 'package:flutter/material.dart';

class TweenAnimationWidget extends StatefulWidget {
  const TweenAnimationWidget({super.key});

  @override
  State<TweenAnimationWidget> createState() => _TweenAnimationWidgetState();
}

class _TweenAnimationWidgetState extends State<TweenAnimationWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: 250),
              duration: Duration(milliseconds: 800),
              builder: (context, value, child) {
                return Container(
                  width: value,
                  height: value,
                  color: Colors.blue,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
