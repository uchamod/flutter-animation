import 'package:flutter/material.dart';

class IntroTransition extends StatefulWidget {
  const IntroTransition({super.key});

  @override
  State<IntroTransition> createState() => _IntroTransitionState();
}

class _IntroTransitionState extends State<IntroTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacity;
  late Animation<double> _scaleTransition;
  late Animation<Offset> _slideTransition;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );
    _opacity = Tween<double>(begin: 0, end: 1).animate(_animationController);
    _scaleTransition = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_animationController);
    _slideTransition = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset.zero,
    ).animate(_animationController);
    _animationController.forward();
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
          Center(
            child: FadeTransition(
              opacity: _opacity,
              child: FlutterLogo(size: 48),
            ),
          ),
          SlideTransition(
            position: _slideTransition,
            child: ScaleTransition(
              scale: _scaleTransition,

              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
