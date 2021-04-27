import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppHeader extends StatelessWidget {
  var text = "Login";

  AppHeader(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blue, Colors.blueAccent],
              end: Alignment.topRight,
              begin: Alignment.bottomRight),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100))),
      child: Stack(
        children: <Widget>[
          Positioned(
              bottom: 20,
              right: 20,
              child: Text(
                text,
                style: TextStyle(color: Colors.white,fontSize: 20),
              )),
          Center(
            child: Image.asset("assets/icons/ewages-logo.png", width: MediaQuery.of(context).size.height * 0.4),
          ),
        ],
      ),
    );
  }
}