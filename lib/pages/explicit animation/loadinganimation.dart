import 'package:flutter/material.dart';

class LoadinganimationWidget extends StatefulWidget {
  const LoadinganimationWidget({super.key});

  @override
  State<LoadinganimationWidget> createState() => _LoadinganimationWidgetState();
}

class _LoadinganimationWidgetState extends State<LoadinganimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _loadAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );
    _loadAnimation = Tween<double>(
      begin: 0,
      end: 100,
    ).animate(_animationController);
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.black,

                  color: Colors.blue,
                  value: _loadAnimation.value / 100,
                  strokeWidth: 5,
                ),
              ),
              Text("${_loadAnimation.value.toInt()}%"),
            ],
          );
        },
      ),
    );
  }
}
