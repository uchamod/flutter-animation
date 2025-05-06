import 'package:flutter/material.dart';

class SingleGriditemPage extends StatelessWidget {
  final int index;
  final String item;
  const SingleGriditemPage({
    super.key,
    required this.index,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("single Item")),
      body: Center(
        child: Hero(
          tag: "Item $index",
          flightShuttleBuilder: _flightShutterBuilder,
          child: Card(
            elevation: 2,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  item,
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _flightShutterBuilder(
    BuildContext flightContext,
    Animation<double> animation,
    HeroFlightDirection flightDirection,
    BuildContext fromHeroContext,
    BuildContext toHeroContext,
  ) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        double angle =
            flightDirection == HeroFlightDirection.push
                ? animation.value * 3.14
                : (1 - animation.value) * 3.14;
        return Transform(
          transform: Matrix4.identity()..rotateZ(angle),
          alignment: Alignment.center,
          child: toHeroContext.widget,
        );
      },
    );
  }
}
