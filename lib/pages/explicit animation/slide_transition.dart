import 'package:flutter/material.dart';

class SlideTransitionWidet extends StatefulWidget {
  const SlideTransitionWidet({super.key});

  @override
  State<SlideTransitionWidet> createState() => _SlideTransitionWidetState();
}

class _SlideTransitionWidetState extends State<SlideTransitionWidet>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideTransition;
  void _onslide() {
    if (_animationController.isDismissed) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );
    _slideTransition = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(0, 1),
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticInOut),
    );

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: _onslide, child: Text("slide")),
          Align(
            alignment: Alignment.center,
            child: SlideTransition(
              position: _slideTransition,

              child: Container(width: 100, height: 100, color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
