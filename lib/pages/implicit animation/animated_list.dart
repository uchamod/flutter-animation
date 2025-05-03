import 'package:flutter/material.dart';

class AnimatedListWidget extends StatefulWidget {
  const AnimatedListWidget({super.key});

  @override
  State<AnimatedListWidget> createState() => _AnimatedListWidgetState();
}

class _AnimatedListWidgetState extends State<AnimatedListWidget> {
  final GlobalKey<AnimatedListState> _globalKey =
      GlobalKey<AnimatedListState>();
  final List<String> _itemList = [];
  int _count = 0;
  int value = 1;
  void _insertItem() {
    _itemList.insert(_count, "Item ${value++}");

    _globalKey.currentState!.insertItem(
      _count++,
      duration: Duration(microseconds: 500),
    );
  }

  void _removeItem(int index) {
    final removedItem = _itemList.removeAt(index);
    _globalKey.currentState!.removeItem(index, (context, animation) {
      _count--;
      return _buildList(removedItem, animation);
    });
  }

  Widget _buildList(String index, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: ListTile(
        title: Text(index),
        trailing: IconButton(
          onPressed: () {
            _removeItem(_itemList.indexOf(index));
          },
          icon: Icon(Icons.delete, size: 24),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Animated List", style: TextStyle(fontSize: 14)),
          TextButton(
            onPressed: () {
              if (_itemList.isEmpty) {
                setState(() {
                  _count = 0;
                  value = 1;
                });
              }
              _insertItem();
            },
            child: Text("Insert Item", style: TextStyle(fontSize: 14)),
          ),
          SizedBox(height: 20),
          Expanded(
            child: AnimatedList(
              key: _globalKey,
              initialItemCount: _itemList.length,
              itemBuilder: (context, index, animation) {
                return _buildList(_itemList[index], animation);
              },
            ),
          ),
        ],
      ),
    );
  }
}
