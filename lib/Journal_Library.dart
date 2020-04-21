import 'package:evenmind/Journal.dart';
import 'package:flutter/material.dart';

class Journal_Library extends StatefulWidget {
  final primaryColor = const Color(0xff9fb2d1);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Journal_Library> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        backgroundColor: primaryColor,
        body: ListView.builder(
          itemBuilder: (context, index) {
            return TileItem(num: index);
          },
        ),
      ),
    );
  }
}

class TileItem extends StatelessWidget {
  final int num;

  const TileItem({Key key, this.num}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Hero(
      tag: "card$num",
      child: Card(
        color: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 100.0 / 40.0,
                ),
                Material(
                  color: primaryColor,
                  child: ListTile(
                    title: Text("Item $num"),
                    subtitle: Text("This is item #$num"),
                  ),
                )
              ],
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              bottom: 0.0,
              right: 0.0,
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () async {
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
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
