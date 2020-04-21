import 'package:evenmind/services/auth_service.dart';
import 'package:evenmind/sign_up.dart';
import 'package:flutter/material.dart';
import 'home_widget.dart';
import 'package:evenmind/first_view.dart';
import 'package:evenmind/widgets/provider_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Provider(
      auth: AuthService(),
      child: MaterialApp(
        title: "EvenMind",
        home: HomeController(),
        routes: <String, WidgetBuilder>{
          '/signUp': (BuildContext context) => SignUpView(
                authFormType: AuthFormType.signUp,
              ),
          '/signIn': (BuildContext context) => SignUpView(
                authFormType: AuthFormType.signIn,
              ),
          '/home': (BuildContext context) => HomeController()
        },
      ),
    );
  }
}

class HomeController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider.of(context).auth;
    return StreamBuilder(
      stream: auth.onAuthStateChange,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final bool signedIn = snapshot.hasData;
          return signedIn ? Home() : FirstView();
        }
        return FirstView();
      },
    );
  }
}
