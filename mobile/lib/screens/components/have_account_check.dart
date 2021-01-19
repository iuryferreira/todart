import 'package:flutter/material.dart';

class HaveAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;

  const HaveAccountCheck({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Não tem conta? " : "Já tem conta? ",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Cadastre-se" : "Realize seu login",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        )
      ],
    );
  }
}
