import 'package:evenmind/Journal.dart';
import 'package:flutter/material.dart';

class j_Library extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<j_Library> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: Scaffold(
          body: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new Container(
                margin: EdgeInsets.fromLTRB(115.0, 220.0, 32.0, 0.0),
                padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                child: Text(
                  'Journal Library',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              new Container(
                height: 220,
                width: 175,
                margin: EdgeInsets.fromLTRB(115.0, 0.0, 20.0, 20.0),
                padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                child: new Hero(
                  tag: 'null',
                  child: new Card(
                    color: Colors.orangeAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Stack(
                      children: <Widget>[
                        Material(
                          color: Colors.orangeAccent,
                          child: Center(
                            child: ListTile(
                              title: Icon(Icons.create),
                              subtitle: Text('      Add New Entry'),
                            ),
                          ),
                        ),
                        Material(
                          type: MaterialType.transparency,
                          child: InkWell(onTap: () async {
                            await Future.delayed(Duration(milliseconds: 200));
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return new Journal();
                                },
                                fullscreenDialog: true,
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.blueGrey),
    );
  }
}
