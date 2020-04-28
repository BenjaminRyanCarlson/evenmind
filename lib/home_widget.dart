import 'package:evenmind/Journal.dart';
import 'package:evenmind/edit_journal.dart';
import 'package:evenmind/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'placeholder_widget.dart';
import 'Journal.dart';
import 'Journal_Library.dart';
import 'package:evenmind/models/journal_data.dart';
import 'j_Library.dart';
import 'package:evenmind/widgets/provider_widget.dart';
import 'meditate.dart';
import 'settingsView.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    j_Library(jData, journalList),
    Meditate(),
    Settings()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EvenMind"),
        backgroundColor: Colors.blueGrey,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.undo),
            onPressed: () async {
              try {
                AuthService auth = Provider.of(context).auth;
                await auth.signOut();
                print("Signed Out!");
              } catch (e) {
                print(e);
              }
            },
          )
        ],
      ),
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
