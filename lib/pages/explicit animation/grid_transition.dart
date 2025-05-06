import 'package:animation/pages/explicit%20animation/single_griditem_page.dart';
import 'package:flutter/material.dart';

class GridTransition extends StatelessWidget {
  GridTransition({super.key});

  final List<String> _itemList = List.generate(20, (index) => "item $index");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("grid item layout")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: _itemList.length,

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return SingleGriditemPage(
                        index: index,
                        item: _itemList[index],
                      );
                    },
                    transitionsBuilder: (
                      context,
                      animation,
                      secondaryAnimation,
                      child,
                    ) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                    transitionDuration: Duration(seconds: 1),
                  ),
                );
              },
              child: Hero(
                tag: "Item $index",
                flightShuttleBuilder: _flightShutterBuilder,
                child: GridTile(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        _itemList[index],
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
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
