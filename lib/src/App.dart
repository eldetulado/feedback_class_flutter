import 'package:assets_img/src/pages/HomePage.dart';
import 'package:assets_img/src/pages/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:assets_img/src/pages/SignIn.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Scaffold(body: SignIn())
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => SignIn(),
        'home': (BuildContext context) => HomePage(),
        'signUp': (BuildContext context) => SignUp(),
      },

    );
  }
}
