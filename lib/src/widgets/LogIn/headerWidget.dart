import 'package:assets_img/src/pages/Constant.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
        width: double.infinity,
        height: 350.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0),
          ),
          color: Color(0xff6C63FF),
        ),
          ),
        Container(
            margin: EdgeInsets.only(top:80.0),
            child: Text('WeDevs',style: ktittle)
        ),
      ],
    );
  }
}

