import 'package:e_wages/com/nitco/util/WidgetUtility.dart';
import 'package:e_wages/com/nitco/view/View_Home.dart';
import 'package:e_wages/com/nitco/view/View_Registration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/ButtonWidget.dart';

// ignore: camel_case_types
class View_Login extends StatefulWidget {
  @override
  _View_Login createState() => new _View_Login();
}

// ignore: camel_case_types
class _View_Login extends State<View_Login> {

  TextEditingController _mobileController = new TextEditingController();

  TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(
                  image: AssetImage(
                      'assets/icons/login_reg_screen.png'
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
                top: 40.0,
                left: 50.0,
                child: Container(
                height: MediaQuery.of(context).size.height * .30,
                width: MediaQuery.of(context).size.width * .50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/icons/ewages-logo.png'
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                top: 230.0,
                left: 50.0,
                child: Container(
                  height: MediaQuery.of(context).size.height * .30,
                  width: MediaQuery.of(context).size.width * .50,
                  child: Text(
                    "Proceed with your",
                    style: TextStyle(
                        fontSize: 12.0,
                        fontFamily: "Poppins",
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                )
            ),
            Positioned(
                top: 250.0,
                left: 50.0,
                child: Container(
                  height: MediaQuery.of(context).size.height * .40,
                  width: MediaQuery.of(context).size.width * .50,
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 28.0,
                        fontFamily: "Poppins",
                        color: Color(0xff13668D),
                        fontWeight: FontWeight.bold
                    ),
                  ),
                )
            ),
            Positioned(
              top: 300.0,
              left: 40.0,
              right: 40.0,
              child: Container(
                height: MediaQuery.of(context).size.height * .40,
                width: MediaQuery.of(context).size.width * .50,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: TextFormField(
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                          fontSize: 14.0,
                        ),
                        keyboardType: TextInputType.number,
                        controller: _mobileController,
                        obscureText: false,
                        autofocus: true,
                        decoration: InputDecoration(
                          contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                          hintText: "Mobile Number",
                          prefixIcon: Icon(Icons.phone),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(
                              color: Color(0xff13668D),
                            ),
                          ),
                        ),
                      ),
                    ),
                    WidgetUtility.divider(height: 10.0),
                    Container(
                      child: TextFormField(
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                          fontSize: 14.0,
                        ),
                        keyboardType: TextInputType.text,
                        controller: _passwordController,
                        obscureText: true,
                        autofocus: true,
                        decoration: InputDecoration(
                          contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                          hintText: "Password",
                          prefixIcon: Icon(Icons.vpn_key),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(
                              color: Color(0xff13668D),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 420.0,
              right: 40.0,
              child: Container(
                child: InkWell(
                  onTap: () {
                    print("Forgot Password Screen ...");
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: "Poppins",
                      color: Color(0xff13668D),
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 470.0,
              right: 40.0,
              left: 40.0,
              child: Container(
                child: ButtonWidget(
                  btnText: 'Login',
                  color: Color(0xff13668D),
                  onClick: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => View_Home()));
                  },
                ),
              ),
            ),
            Positioned(
              top: 520.0,
              left: 185.0,
              child: Container(
                child: InkWell(
                  onTap: () {
                    print("Registration Screen ... ");
                  },
                  child: Text(
                    "Or",
                    style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: "Poppins",
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 550.0,
              left: 125.0,
              child: Container(
                child: InkWell(
                  onTap: () {
                    print("Registration Screen ... ");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                View_Registration()));
                  },
                  child: Text(
                    "Register new account",
                    style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: "Poppins",
                        color: Color(0xff13668D),
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}