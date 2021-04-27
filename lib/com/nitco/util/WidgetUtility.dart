import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetUtility {

  static Widget textInput({controller, hint, icon, isPassword}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(left: 10),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }

  static SizedBox divider({height, width}) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}