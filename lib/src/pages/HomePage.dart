import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int numero = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Container(
            height: 450.0,
            child: PageView(
              children: [
                imagenContainer("assets/img/guitar_one.png"),
                imagenContainer("assets/img/guitar_three.png"),
                imagenContainer("assets/img/guitar_two.png")
              ],
            ),
          ),
          Divider(),
          Container(
            child: Text(
              'Guitarra Criolla',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            numero++;
                          });
                        }),
                    Text(
                      '$numero',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            numero--;
                          });
                        }),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 20.0),
                child: Row(
                  children: [
                    _starIcon(),
                    _starIcon(),
                    _starIcon(),
                    _starIcon(),
                    _halfStar(),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

Icon _halfStar() => Icon(Icons.star_border, color: Colors.yellow[700]);
Icon _starIcon() => Icon(Icons.star, color: Colors.yellow[700]);
Widget imagenContainer(String directorio) {
    return Container(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Image.asset(directorio));
  }
}
