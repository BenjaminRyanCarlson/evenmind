import 'package:evenmind/Journal.dart';
import 'package:flutter/material.dart';
import 'placeholder_widget.dart';
import 'Journal.dart';
import 'Journal_Library.dart';
import 'j_Library.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    j_Library(),
    PlaceholderWidget(Colors.blueGrey),
    PlaceholderWidget(Colors.cyanAccent)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.create),
            title: new Text('Journal'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.insert_emoticon),
            title: new Text('Meditate'),
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.settings), title: new Text('Settings'))
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
