import 'package:flutter/material.dart';

class AnimatedTextstyleWidget extends StatefulWidget {
  const AnimatedTextstyleWidget({super.key});

  @override
  State<AnimatedTextstyleWidget> createState() =>
      _AnimatedTextstyleWidgetState();
}

class _AnimatedTextstyleWidgetState extends State<AnimatedTextstyleWidget> {
  bool _isChange = false;

  void _toggle() {
    setState(() {
      _isChange = !_isChange;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => _toggle(),
            child: Text("change style"),
          ),
          SizedBox(height: 20),
          Center(
            child: AnimatedDefaultTextStyle(
              style:
                  _isChange
                      ? TextStyle(
                        fontSize: 24,
                        color: Colors.blue,
                        fontWeight: FontWeight.w400,
                      )
                      : TextStyle(
                        fontSize: 28,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
              duration: Duration(milliseconds: 500),
              softWrap: true,
              curve: Curves.linear,
              child: Text("change style"),
            ),
          ),
        ],
      ),
    );
  }
}
