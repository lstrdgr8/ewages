import 'package:e_wages/com/nitco/util/WidgetUtility.dart';
import 'package:e_wages/com/nitco/view/View_Login.dart';
import 'package:flutter/material.dart';

import 'components/ButtonWidget.dart';

// ignore: camel_case_types
class View_Registration extends StatefulWidget {
  @override
  _View_Registration createState() => _View_Registration();
}

// ignore: camel_case_types
class _View_Registration extends State<View_Registration> {

  TextEditingController _userNameController = new TextEditingController();

  TextEditingController _emailController = new TextEditingController();

  TextEditingController _mobileController = new TextEditingController();

  TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        extendBodyBehindAppBar: true,
        body: Container(
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
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
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
                      "Register",
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
                  height: MediaQuery.of(context).size.height * .50,
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
                          keyboardType: TextInputType.name,
                          controller: _userNameController,
                          obscureText: false,
                          autofocus: true,
                          decoration: InputDecoration(
                            contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                            hintText: "Username",
                            prefixIcon: Icon(Icons.person),
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
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          obscureText: false,
                          autofocus: true,
                          decoration: InputDecoration(
                            contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                            hintText: "Email",
                            prefixIcon: Icon(Icons.email),
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
                top: 530.0,
                right: 40.0,
                left: 40.0,
                child: Container(
                  child: ButtonWidget(
                    btnText: 'Register',
                    color: Color(0xff13668D),
                    onClick: () {

                    },
                  ),
                ),
              ),
              Positioned(
                top: 580.0,
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
                top: 610.0,
                left: 155.0,
                child: Container(
                  child: InkWell(
                    onTap: () {
                      print("Registration Screen ... ");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  View_Login()));
                    },
                    child: Text(
                      "Go to Login",
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