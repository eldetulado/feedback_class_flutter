import 'package:flutter/material.dart';
import 'package:assets_img/src/pages/HomePage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Imagenes'),
        ),
        body: HomePage(),
      )
    );
  }
}
