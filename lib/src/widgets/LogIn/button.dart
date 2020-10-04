import 'package:flutter/material.dart';

class SignInButtonWidget extends StatelessWidget {
  final Color kcolor;
  final String ktext;
  final TextStyle kstyle;
  final Function presionar;
  SignInButtonWidget(
      {@required this.kcolor, @required this.ktext, @required this.kstyle, @required this.presionar});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45.0,
      child: RaisedButton(
        elevation: 0.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        color: kcolor,
        child: Text(
          ktext,
          style: kstyle,
        ),
        onPressed: presionar,
      ),
    );
  }
}
