import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todart_app/screens/components/have_account_check.dart';
import 'package:todart_app/screens/components/rounded_button.dart';
import 'package:todart_app/screens/components/rounded_input_field.dart';
import 'package:todart_app/screens/components/rounded_password_field.dart';
import 'package:todart_app/screens/signup/signup.dart';

import 'background.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: ListView(
        padding: EdgeInsets.all(20),
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 60),
            child: Text(
              "LOGIN",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white),
            ),
          ),
          SizedBox(height: size.height * 0.03),
          SvgPicture.asset("assets/vectors/login.svg",
              height: size.height * 0.30),
          SizedBox(height: size.height * 0.03),
          RoundedInputField(
            hintText: "Digite o nome de usuário",
          ),
          SizedBox(height: size.height * 0.002),
          RoundedPasswordField(),
          SizedBox(height: size.height * 0.002),
          RoundedButton(
            text: "ENTRAR",
            press: () {},
          ),
          SizedBox(height: size.height * 0.03),
          HaveAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Signup();
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
