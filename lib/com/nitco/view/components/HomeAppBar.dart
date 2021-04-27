import 'package:e_wages/com/nitco/model/NotificationObj.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../View_Notification_List.dart';
import 'CustomIcon.dart';

// ignore: must_be_immutable
class HomeAppBar extends StatefulWidget {

  int size;

  List<NotificationObj> listNotification;

  HomeAppBar({required this.size, required this.listNotification});

  @override
  _HomeAppBar createState() => new _HomeAppBar(size: size, listNotification: listNotification);
}

class _HomeAppBar extends State<HomeAppBar> {

  int size;

  List<NotificationObj> listNotification;

  _HomeAppBar({required this.size, required this.listNotification});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Colors.blue,
                Colors.blueAccent,
              ]),
        ),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      title: Container(
          height: 400,
          width: 150,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/icons/ewages-logo.png'),
                  fit: BoxFit.scaleDown))),
      actions: [
        CustomIcon(
          text: '',
          iconData: size > 0 ? Icons.notification_important_outlined : Icons.notifications,
          notificationCount: size,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => View_Notification_List(listNotification: listNotification,)));
          },
        ),
      ],
    );
  }
}