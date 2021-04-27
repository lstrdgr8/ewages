import 'package:e_wages/com/nitco/view/View_Login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:splashscreen/splashscreen.dart';

// ignore: camel_case_types
class View_Splash extends StatefulWidget {

  _View_Splash createState() => new _View_Splash();
}

// ignore: camel_case_types
class _View_Splash extends State<View_Splash> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: new SplashScreen(
          seconds: 4,
          imageBackground: AssetImage(
              'assets/icons/splash_background.png',
          ),
          navigateAfterSeconds: new View_Login(),
          backgroundColor: Colors.transparent,
          loaderColor: Color(0xffE3252B),
          photoSize: 30.0,
          image: new Image.asset(
            'assets/icons/ewages-icon.png',
            alignment: Alignment.bottomRight),
        ),
      ),
      theme: Theme.of(context).copyWith(
        primaryColor: Color(0xff13668D),
      ),
    );
  }
}