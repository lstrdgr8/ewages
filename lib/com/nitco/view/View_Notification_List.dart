import 'package:badges/badges.dart';
import 'package:e_wages/com/nitco/constants/Constants.dart';
import 'package:e_wages/com/nitco/model/NotificationObj.dart';
import 'package:e_wages/com/nitco/view/View_Complaint_List.dart';
import 'package:e_wages/com/nitco/view/components/GenericScaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'View_Payslip_List.dart';
import 'components/MainAppBar.dart';

// ignore: camel_case_types, must_be_immutable
class View_Notification_List extends StatefulWidget {

  List<NotificationObj> listNotification;

  View_Notification_List({required this.listNotification});

  @override
  _View_Notification_List createState() => new _View_Notification_List(listNotification: listNotification);
}

// ignore: camel_case_types
class _View_Notification_List extends State<View_Notification_List> {

  List<NotificationObj> listNotification;

  _View_Notification_List({required this.listNotification});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GenericScaffold(mainAppBar: MainAppBar(title: 'Notification',),
    mainBody: getBody(),);
  }

  Widget getBody() {
    return Container(
      child: Scrollbar(
        isAlwaysShown: true,
        showTrackOnHover: true,
        child: ListView.builder(
          itemCount: listNotification.length,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                Card(
                  child: ListTile(
                    leading: _getNotificationType(listNotification[index].notificationType),
                    title: Text(
                      listNotification[index].title + ' : ' + listNotification[index].message,
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14.0,
                          fontWeight: !listNotification[index].read ? FontWeight.bold : FontWeight.normal
                      ),
                    ),
                    subtitle: Text(
                      listNotification[index].datetime,
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 10.0
                      ),
                    ),
                    trailing: _getBadge(listNotification[index].read),
                    onTap: () {
                      if (listNotification[index].notificationType.contains(Constants.MSGTYPE_COMPLAIN)) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => View_Complaint_List()));
                      } else if (listNotification[index].notificationType.contains(Constants.MSGTYPE_PAYSLIP)) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => View_Payslip_List()));
                      }
                    },
                  ),
                ),
              ],
            );
          },
        ),
      )
    );
  }

  _getBadge(bool read) { // <<<<< Note this change for the return type
    if(!read){
      return Badge(child: Icon(Icons.keyboard_arrow_right, color: Colors.blueAccent, size: 30.0));
    }
    else{
      return Icon(Icons.keyboard_arrow_right, color: Colors.blueAccent, size: 30.0);
    }
  }

  _getNotificationType(String msgType) {
    if (msgType.contains(Constants.MSGTYPE_COMPLAIN)) {
      return Icon(Icons.message_outlined, color: Colors.redAccent.shade100, size: 30.0);
    } else if (msgType.contains(Constants.MSGTYPE_PAYSLIP)) {
      return Icon(Icons.receipt_long_outlined, color: Colors.orangeAccent.shade100 , size: 30.0);
    } else if (msgType.contains(Constants.MSGTYPE_SALARY)) {
      return Icon(Icons.account_balance_outlined, color: Colors.greenAccent.shade100 , size: 30.0);
    }
  }

}