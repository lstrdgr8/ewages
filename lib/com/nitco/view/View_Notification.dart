import 'package:e_wages/com/nitco/services/FirebaseService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types, must_be_immutable
class View_Notification extends StatelessWidget {

  String notification = "this is sample notificationList.json";

  FirebaseService firebaseService;

  String topic;

  View_Notification({required this.firebaseService, required this.topic});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      child: new Text(firebaseService.notificationAlert),
    );
  }
}