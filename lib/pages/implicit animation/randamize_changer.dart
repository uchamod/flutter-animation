import 'dart:math';

import 'package:flutter/material.dart';

class RandamizeChanger extends StatefulWidget {
  const RandamizeChanger({super.key});

  @override
  State<RandamizeChanger> createState() => _RandamizeChangerState();
}

class _RandamizeChangerState extends State<RandamizeChanger> {
  final Random _random = Random();

  double _width = 200;
  double _heigth = 200;
  Color _color = Colors.amber;
  Alignment _alignment = Alignment.center;
  BorderRadius _borderRadius = BorderRadius.circular(16);
  void _toggalOn() {
    setState(() {
      _width = 100 + _random.nextDouble() * 250;
      _heigth = 100 + _random.nextDouble() * 250;
      _color = Color.fromARGB(
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
        1,
      );
      _alignment = Alignment(
        _random.nextDouble() * 2,
        _random.nextDouble() * 2,
      );
      _borderRadius = BorderRadius.circular(_random.nextDouble() * 32);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              _toggalOn();
            },
            child: Center(
              child: AnimatedContainer(
                width: _width,
                height: _heigth,

                duration: Duration(seconds: 1),
                curve: Curves.bounceIn,

                decoration: BoxDecoration(
                  borderRadius: _borderRadius,
                  color: _color,
                ),
                child: Center(
                  child: AnimatedAlign(
                    alignment: _alignment,
                    duration: Duration(seconds: 1),
                    child: FlutterLogo(curve: Curves.bounceInOut, size: 28),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
