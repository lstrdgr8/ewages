import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonWidget extends StatelessWidget {
  late var btnText ="";
  late var onClick;
  late var color;

  ButtonWidget({required this.btnText, this.onClick, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onClick,
        style: ButtonStyle(
          backgroundColor: null != color ? MaterialStateProperty.all<Color>(color) : MaterialStateProperty.all<Color>(Colors.blueAccent),
        ),
        child: Text(
          btnText,
          style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: "Poppins"),
        ),
      ),
    );
  }
}