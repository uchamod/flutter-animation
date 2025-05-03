import 'package:flutter/material.dart';

class PositionSwither extends StatefulWidget {
  const PositionSwither({super.key});

  @override
  State<PositionSwither> createState() => _PositionSwitherState();
}

class _PositionSwitherState extends State<PositionSwither> {
  bool _isSwitch = false;

  void _toggle() {
    setState(() {
      _isSwitch = !_isSwitch;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: () => _toggle(), child: Text("switch")),
            AnimatedSwitcher(
              duration: Duration(seconds: 2),
              switchInCurve: Curves.easeInOut,
              switchOutCurve: Curves.easeInOut,

              child:
                  _isSwitch
                      ? Container(
                        key: ValueKey(1),
                        width: 200,
                        height: 200,
                        color: Colors.amber,
                      )
                      : Container(
                        key: ValueKey(2),
                        width: 100,
                        height: 100,
                        color: Colors.blueAccent,
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
