import 'package:assets_img/src/providers/db_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assets_img/src/widgets/LogIn/button.dart';
import 'package:assets_img/src/widgets/LogIn/headerWidget.dart';
import 'Constant.dart';
import 'package:toast/toast.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool vstate = true;
  bool fState = false;
  String _username = "";
  String _password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Header(),
            _body(),
          ],
        ),
      ),
    );
  }

  //TextInput User
  Widget _user() {
    return TextField(
      autofocus: fState,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelStyle: TextStyle(color: kMoradoColor),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kMoradoColor),
          borderRadius: BorderRadius.circular(15.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kMoradoColor),
          borderRadius: BorderRadius.circular(15.0),
        ),
        hintText: 'ejemplo@gmail.com',
        labelText: 'Email',
        icon: Icon(Icons.account_circle, color: kMoradoColor),
      ),
      onChanged: (value) {
        _username = value;
      },
    );
  }

  //TextInput Password
  Widget _pass() {
    return TextField(
      cursorColor: Color(0xff6C63FF),
      decoration: InputDecoration(
          labelStyle: TextStyle(color: Color(0xff6C63FF)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff6C63FF)),
            borderRadius: BorderRadius.circular(15.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff6C63FF)),
            borderRadius: BorderRadius.circular(15.0),
          ),
          hintText: 'Password',
          labelText: 'Password',
          icon: Icon(
            Icons.vpn_key,
            color: Color(0xff6C63FF),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                vstate = !vstate;
              });
            },
            icon: vstate
                ? Icon(Icons.visibility_off, color: Color(0xff6C63FF))
                : Icon(Icons.visibility, color: Color(0xff6C63FF)),
          )),
      obscureText: vstate,
      onChanged: (value) {
        _password = value;
      },
    );
  }

  //Body Of App
  Widget _body() {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            color: kblanco,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, offset: Offset(0, 2), blurRadius: 2.0)
            ]),
        padding:
            EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0, bottom: 30.0),
        margin:
            EdgeInsets.only(top: 155.0, left: 35.0, right: 35.0, bottom: 10.0),
        child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
            child: Column(
              children: [
                Image.asset('assets/img/login.png', fit: BoxFit.cover),
                SizedBox(height: 20.0),
                Text('Welcome to the Comunity',
                    style: ksubtittle, textAlign: TextAlign.center),
                kseparacion,
                _user(),
                kseparacion,
                _pass(),
                kseparacion,
                SignInButtonWidget(
                    kcolor: kMoradoColor,
                    ktext: 'INGRESAR',
                    kstyle: ktextbtnSingIn,
                    presionar: () {
                      // if (_username.isEmpty || _password.isEmpty) {
                      //   Toast.show("Complete todos los campos", context,
                      //       duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                      // } else if (_username == "magin@luna.com" &&
                      //     _password == "123456") {
                      //   Navigator.pushNamed(context, 'home');
                      // } else {
                      //   showDialog(
                      //       context: context, builder: (_) => _alertDialog());
                      // }
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('You are now?', style: TextStyle(fontFamily: 'Lato')),
                    FlatButton(
                      textColor: kMoradoColor,
                      onPressed: () {
                        Navigator.pushNamed(context, 'signUp');
                      },
                      child: Text(
                        "SignUp",
                        style: TextStyle(fontFamily: 'Lato'),
                      ),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }

  CupertinoAlertDialog _alertDialog() {
    return CupertinoAlertDialog(
      insetAnimationCurve: Curves.elasticIn,
      title: Text('Estimado Usuario'),
      content: Text('Tu usuario o contraseña son incorrectos...!'),
      actions: [
        CupertinoDialogAction(
          child: Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }

  CupertinoAlertDialog _alertDialog2(String email) {
    return CupertinoAlertDialog(
      insetAnimationCurve: Curves.elasticIn,
      title: Text('$email'),
      content: Text('OK...!'),
      actions: [
        CupertinoDialogAction(
          child: Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
