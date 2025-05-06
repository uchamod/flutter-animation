import 'dart:async';

import 'package:animation/pages/explicit%20animation/page_transition_page2.dart';
import 'package:flutter/material.dart';

class PageTransitionPage1 extends StatefulWidget {
  const PageTransitionPage1({super.key});

  @override
  State<PageTransitionPage1> createState() => _PageTransitionPage1State();
}

class _PageTransitionPage1State extends State<PageTransitionPage1>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleanimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _scaleanimation = Tween<double>(begin: 1, end: 10).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.addListener(() {
      if (_animationController.isCompleted) {
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return PageTransitionPage2();
            },
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              return ScaleTransition(scale: animation, child: child);
            },
          ),
        );
        Timer(Duration(seconds: 1), () {
          _animationController.reset();
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _pageShift() {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return PageTransitionPage2();
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return ScaleTransition(scale: animation);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page 1")),
      body: Center(
        child: GestureDetector(
          onTap: () {
            _animationController.forward();
          },
          child: ScaleTransition(
            scale: _scaleanimation,
            child: Container(
              width: 100,
              height: 100,

              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
