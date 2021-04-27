import 'package:e_wages/com/nitco/constants/Constants.dart';
import 'package:e_wages/com/nitco/util/WidgetUtility.dart';
import 'package:e_wages/com/nitco/view/View_Home.dart';
import 'package:e_wages/com/nitco/view/components/ButtonWidget.dart';
import 'package:e_wages/com/nitco/view/components/GenericScaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types, must_be_immutable
class View_Profile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: profileView(context),
    );
  }

  Widget profileView(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.white, Colors.white70]
            )
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
            WidgetUtility.divider(height: 30.0, width: 4.0),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0,0 ,50),
                child: Stack(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 70,
                      child: ClipOval(child: Image.asset(Constants.assetProfile, height: 150.0, fit: BoxFit.fill, width: 150.0),),
                    ),
                    Positioned(bottom: 1, right: 1 ,
                        child: Container(
                          height: 40, width: 40,
                          child: Icon(Icons.add_a_photo, color: Colors.white,),
                          decoration: BoxDecoration(
                              color: Colors.redAccent.shade100,
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [Colors.white, Colors.white70]
                      )
                  ),
                  child: Column(
                    children: <Widget>[
                      SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                              child: Container(
                                color: Color(0xffD7DAF2),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Personal Information",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Poppins",
                                          fontSize: 18.0,
                                          color: Colors.white
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                              child: Container(
                                height: 40,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        readOnly: true,
                                        initialValue: "Sheldon Cooper",
                                        keyboardType: TextInputType.name,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          contentPadding: EdgeInsets.only(left: 10, bottom: 9, top: 5, right: 10),
                                          hintText: 'Full Name',
                                          prefixIcon: Icon(Icons.person_outline),
                                        ),
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.black,
                                            fontFamily: "Poppins"
                                        ),
                                      )
                                  ),
                                ), decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),border: Border.all(width: 1.0, color: Colors.blueAccent)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                              child: Container(
                                height: 40,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        readOnly: true,
                                        initialValue: "sheldonet@gmail.com",
                                        keyboardType: TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          contentPadding: EdgeInsets.only(left: 10, bottom: 9, top: 5, right: 10),
                                          hintText: 'Email',
                                          prefixIcon: Icon(Icons.email_outlined),
                                        ),
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.black,
                                            fontFamily: "Poppins"
                                        ),
                                      )
                                  ),
                                ), decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),border: Border.all(width: 1.0, color: Colors.blueAccent)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                              child: Container(
                                height: 40,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        readOnly: true,
                                        initialValue: "09178923412",
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          contentPadding: EdgeInsets.only(left: 10, bottom: 9, top: 5, right: 10),
                                          hintText: "Contact Number",
                                          prefixIcon: Icon(Icons.contact_phone_outlined),
                                        ),
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.black,
                                            fontFamily: "Poppins"
                                        ),
                                      )
                                  ),
                                ), decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),border: Border.all(width: 1.0, color: Colors.blueAccent)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                              child: Container(
                                height: 40,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: TextFormField(
                                        readOnly: true,
                                        initialValue: "Kerinchi",
                                        keyboardType: TextInputType.multiline,
                                        maxLines: 5,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          contentPadding: EdgeInsets.only(left: 10, bottom: 3, top: 3, right: 10),
                                          hintText: 'Address',
                                          prefixIcon: Icon(Icons.streetview_outlined),
                                        ),
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.black,
                                            fontFamily: "Poppins"
                                        ),
                                      )
                                  ),
                                ), decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),border: Border.all(width: 1.0, color: Colors.blueAccent)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                              child: Container(
                                color: Color(0xffD7DAF2),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Employer Information",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Poppins",
                                          fontSize: 18.0,
                                          color: Colors.white
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                              child: Container(
                                height: 40,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: TextFormField(
                                        readOnly: true,
                                        initialValue: "Nitco Solutions",
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          contentPadding: EdgeInsets.only(left: 10, bottom: 3, top: 3, right: 10),
                                          hintText: 'Company Name',
                                          prefixIcon: Icon(Icons.business),
                                        ),
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.black,
                                            fontFamily: "Poppins"
                                        ),
                                      )
                                  ),
                                ), decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),border: Border.all(width: 1.0, color: Colors.blueAccent)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                              child: Container(
                                height: 40,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: TextFormField(
                                        readOnly: true,
                                        initialValue: "01790923456",
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          contentPadding: EdgeInsets.only(left: 10, bottom: 3, top: 3, right: 10),
                                          hintText: 'Contact Number',
                                          prefixIcon: Icon(Icons.contact_phone),
                                        ),
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.black,
                                            fontFamily: "Poppins"
                                        ),
                                      )
                                  ),
                                ), decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),border: Border.all(width: 1.0, color: Colors.blueAccent)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                              child: Container(
                                height: 40,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: TextFormField(
                                        readOnly: true,
                                        initialValue: "nitcosolutions@gmail.com",
                                        keyboardType: TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          contentPadding: EdgeInsets.only(left: 10, bottom: 3, top: 3, right: 10),
                                          hintText: 'Email Address',
                                          prefixIcon: Icon(Icons.email),
                                        ),
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.black,
                                            fontFamily: "Poppins"
                                        ),
                                      )
                                  ),
                                ), decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),border: Border.all(width: 1.0, color: Colors.blueAccent)),
                              ),
                            ),
                            WidgetUtility.divider(height: 30.0),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))
            ],
          ),
        )
      ),
    );
  }
}