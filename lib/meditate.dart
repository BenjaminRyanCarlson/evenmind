import 'package:flutter/material.dart';

class Meditate extends StatefulWidget {
  @override
  MeditateState createState() => MeditateState();
}

final primaryColor = const Color(0xff9fb2d1);
AnimationController controller;

Duration duration;

int setLength = 1;

String buttonText = 'Meditate';

String get timerString {
  duration = controller.duration * controller.value;
  return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
}

class MeditateState extends State<Meditate>
    with SingleTickerProviderStateMixin {
  // bool isPlaying = false;

  @override
  void initState() {
    int getLength = setLength;
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(minutes: getLength));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Align(
                alignment: FractionalOffset.center,
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: Stack(
                    children: <Widget>[
                      // timer countdown is here
                      Align(
                        alignment: FractionalOffset.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            durationSetter(context),
                            Text(
                              "Meditate",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 90.0,
                                  fontWeight: FontWeight.w300),
                            ),
                            AnimatedBuilder(
                                animation: controller,
                                builder: (BuildContext context, Widget child) {
                                  return Text(
                                    timerString,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 120.0,
                                        fontWeight: FontWeight.w100),
                                  );
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 45.0, top: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    child: AnimatedBuilder(
                      animation: controller,
                      builder: (BuildContext context, Widget child) {
                        return Text(buttonText,
                            style: TextStyle(color: Colors.blueGrey));
                      },
                    ),
                    onPressed: () async {
//                      playLocalAsset().then((player) {
//                        _audioPlayer = player;
//                      });

                      if (controller.isAnimating) {
                        controller.stop(canceled: true);
                      } else {
                        controller.reverse(
                            from: controller.value == 0.0
                                ? 1.0
                                : controller.value);
                      }
                      if (buttonText == 'Meditate') {
                        buttonText = 'Pause';
                      }
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  String dropdownValue = 'One Minute';
  Widget durationSetter(BuildContext context) {
    return Material(
        color: Colors.blueGrey,
        child: DropdownButton<String>(
          value: dropdownValue,
          icon: Icon(Icons.arrow_downward, color: Colors.white),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: primaryColor),
          underline: Container(
            height: 2,
            color: Colors.white,
          ),
          onChanged: (String newValue) {
            setState(() {
              dropdownValue = newValue;
            });

            if (newValue == 'Two Minutes') {
              setLength = 2;
            }
            if (newValue == 'Three Minutes') {
              setLength = 3;
            }
            if (newValue == 'Four Minutes') {
              setLength = 4;
            }
            if (newValue == 'Five Minutes') {
              setLength = 5;
            }
            if (newValue == 'One Minute') {
              setLength = 1;
            }

            controller.reset();
            controller.duration = Duration(minutes: setLength);
          },
          items: <String>[
            'One Minute',
            'Two Minutes',
            'Three Minutes',
            'Four Minutes',
            'Five Minutes'
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ));
  }
}
