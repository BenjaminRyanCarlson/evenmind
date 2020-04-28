import 'package:flutter/material.dart';
import 'package:evenmind/services/auth_service.dart';
import 'package:evenmind/widgets/provider_widget.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Center(
          child: Container(
              child: RaisedButton(
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Sign Out',
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w300),
              ),
            ),
            onPressed: () async {
              try {
                AuthService auth = Provider.of(context).auth;
                await auth.signOut();
                print("Signed Out!");
              } catch (e) {
                print(e);
              }
            },
          )),
        ));
  }
}
