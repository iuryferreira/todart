import 'package:flutter/material.dart';

const FULLWIDTH = double.infinity;

class Background extends StatelessWidget {
  final Widget child;
  const Background({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: FULLWIDTH,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            right: 0,
            child: Opacity(
              opacity: 0.67,
              child: Image.asset(
                "assets/images/signup_top.png",
                width: size.width * 0.35,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Opacity(
              opacity: 0.67,
              child: Image.asset(
                "assets/images/signup_bottom.png",
                width: size.width * 0.3,
              ),
            ),
          ),
          child
        ],
      ),
    );
  }
}
