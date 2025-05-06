import 'package:flutter/material.dart';

class RotationTransitionWidget extends StatefulWidget {
  const RotationTransitionWidget({super.key});

  @override
  State<RotationTransitionWidget> createState() =>
      _RotationTransitionWidgetState();
}

class _RotationTransitionWidgetState extends State<RotationTransitionWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotateAnimation;
  late Animation<Color?> _colorAnimation;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000), 
    );
    _scaleAnimation = Tween<double>(begin: 50, end: 250).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _rotateAnimation = Tween<double>(begin: 0, end: 2 * 3.14159).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _colorAnimation = ColorTween(
      begin: Colors.blue,
      end: Colors.green,
    ).animate(_animationController);
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.rotate(
            angle: _rotateAnimation.value,
            child: Container(
              width: _scaleAnimation.value,
              height: _scaleAnimation.value,
              color: _colorAnimation.value,
            ),
          );
        },
      ),
    );
  }
}
