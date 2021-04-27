import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MainAppBar extends StatelessWidget {

  var title;

  MainAppBar({this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xff2A7598), Color(0xff4284A3)],
              begin: Alignment.bottomLeft,
              end: Alignment.bottomRight),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
              title,
              style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold,
              fontSize: 17.0
            ),
          ),
          SizedBox(
            width: 9.0,
          ),
          Image.asset(
            'assets/icons/ewages-icon-white.png',
            fit: BoxFit.contain,
            height: 32,
          ),
        ],
      ),
    );
  }
}