import 'package:assets_img/src/pages/Constant.dart';
import 'package:assets_img/src/providers/db_provider.dart';
import 'package:assets_img/src/widgets/LogIn/button.dart';
import 'package:assets_img/src/widgets/SignUp/headerWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toast/toast.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String texto = 'Register your data and be part of WeDevs';
  Widget espacio = SizedBox(height: 20.0);
  bool vstate = true;
  bool vstate2 = true;

  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPass = TextEditingController();
  TextEditingController _controllerConfirmPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        ListView(
          children: [
            Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 100.0),
                padding: EdgeInsets.only(top: 20.0),
                child: Column(
                  children: [
                    Text(texto, style: ksubtittle, textAlign: TextAlign.center),
                    espacio,
                    _inputName(),
                    espacio,
                    _inputEmail(),
                    espacio,
                    _inputPass(),
                    espacio,
                    _inputConfirmPass(),
                    espacio,
                    Container(
                        height: 150.0,
                        child: SvgPicture.asset('assets/img/na.svg')),
                    SignInButtonWidget(
                      kcolor: Color(0XFF6C63FF),
                      ktext: 'Register',
                      kstyle: ktextbtnSingIn,
                      presionar: () async {
                        final resp = await DBProvider.db.createNewUser(
                          UserModel(
                            name: _controllerName.text.trim(),
                            email: _controllerEmail.text.trim(),
                            pass: _controllerConfirmPass.text.trim(),
                          ),
                        );
                        resp != -1
                            ? Navigator.pushNamed(context, '/')
                            : Toast.show("Este correo ya existe", context);
                      },
                    ),
                  ],
                ))
          ],
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20.0),
          width: double.infinity,
          child: HeaderSU(),
        ),
      ],
    ));
  }

  Widget _inputName() {
    return TextField(
      controller: _controllerName,
      keyboardType: TextInputType.emailAddress,
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
        hintText: 'Juanito Perez',
        labelText: 'Nombre Completo',
        icon: Icon(Icons.account_circle, color: Color(0xff6C63FF)),
      ),
    );
  }

  Widget _inputEmail() {
    return TextField(
      controller: _controllerEmail,
      keyboardType: TextInputType.emailAddress,
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
        hintText: 'ejemplo@gmail.com',
        labelText: 'Email',
        icon: Icon(Icons.email, color: Color(0xff6C63FF)),
      ),
    );
  }

  Widget _inputPass() {
    return TextField(
      controller: _controllerPass,
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
          labelText: 'Contraseña',
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
    );
  }

  Widget _inputConfirmPass() {
    Color kColor = Color(0xff6C63FF);
    return TextField(
      controller: _controllerConfirmPass,
      cursorColor: kColor,
      decoration: InputDecoration(
          labelStyle: TextStyle(color: kColor),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kColor),
            borderRadius: BorderRadius.circular(15.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kColor),
            borderRadius: BorderRadius.circular(15.0),
          ),
          labelText: 'Confirmar contraseña',
          icon: Icon(
            Icons.vpn_key,
            color: kColor,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                vstate2 = !vstate2;
              });
            },
            icon: vstate2
                ? Icon(Icons.visibility_off, color: Color(0xff6C63FF))
                : Icon(Icons.visibility, color: Color(0xff6C63FF)),
          )),
      obscureText: vstate2,
    );
  }
}
