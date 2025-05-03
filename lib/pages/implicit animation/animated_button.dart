import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({super.key});

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool _isUpload = false;

  void _onToggle() {
    setState(() {
      _isUpload = !_isUpload;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                _onToggle();
              },
              child: Center(
                child: AnimatedContainer(
                  width: _isUpload ? 200 : 250,

                  padding:
                      _isUpload
                          ? EdgeInsets.symmetric(horizontal: 16, vertical: 8)
                          : EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  duration: Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: _isUpload ? Colors.green : Colors.red,
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedContainer(
                          duration: Duration(seconds: 1),
                          curve: Curves.easeInOut,
                          child: Text(
                            _isUpload ? "Succsussfuly" : "Upload",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        AnimatedContainer(
                          duration: Duration(seconds: 1),
                          curve: Curves.easeInBack,
                          child:
                              _isUpload
                                  ? Icon(
                                    Icons.add_task,
                                    size: 24,
                                    color: Colors.white,
                                  )
                                  : Icon(
                                    Icons.upload,
                                    size: 24,
                                    color: Colors.white,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
