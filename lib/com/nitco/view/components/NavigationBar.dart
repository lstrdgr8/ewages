import 'package:e_wages/com/nitco/constants/Constants.dart';
import 'package:e_wages/com/nitco/services/FirebaseService.dart';
import 'package:e_wages/com/nitco/services/PayslipService.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NavigationBar extends StatefulWidget {

  var currentIndex;

  NavigationBar({this.currentIndex}) {
    this.currentIndex = currentIndex;
  }

  _NavigationBar createState() => new _NavigationBar(currentIndex);
}

class _NavigationBar extends State<NavigationBar> {

  var currentIndex;

  FirebaseService _firebaseService = new FirebaseService(firebaseMessaging: FirebaseMessaging.instance, topic: "all");

  PayslipService _payslipService = new PayslipService();

  _NavigationBar(int currentIndex) {
    this.currentIndex = currentIndex;
  }

  @override
  void initState() {
    super.initState();
    _firebaseService.onMessage();
  }
  
  @override
  Widget build(BuildContext context) {
    return customNavigationBar();
  }

  Widget customNavigationBar() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blue.shade500, Colors.blueAccent.shade200, Colors.blueAccent.shade100],
              begin: Alignment.bottomLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0))),
      padding: EdgeInsets.all(3),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTabSelect,
        showUnselectedLabels: true,
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        elevation: 0.0,
        unselectedItemColor: Colors.blueGrey.shade100,
        selectedItemColor: Colors.orangeAccent,
        unselectedIconTheme: IconThemeData(color: Colors.blueGrey.shade100),
        selectedIconTheme: IconThemeData(color: Colors.orangeAccent),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 20.0,),
            // ignore: deprecated_member_use
            title: Text(Constants.menuHome,
              style: TextStyle(
                fontSize: 13.0,
                fontFamily: "Poppins",
              ),),
            activeIcon: Icon(Icons.home_outlined, size: 20.0,)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance, size: 20.0,),
            // ignore: deprecated_member_use
            title: Text(Constants.menuPayslips,
              style: TextStyle(
              fontSize: 13.0,
              fontFamily: "Poppins",
            ),),
            activeIcon: Icon(Icons.account_balance_outlined, size: 20.0,)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.rate_review, size: 20.0,),
              // ignore: deprecated_member_use
              title: Text(Constants.menuComplaint,
                style: TextStyle(
                  fontSize: 13.0,
                  fontFamily: "Poppins",
                ),),
              activeIcon: Icon(Icons.rate_review_outlined, size: 20.0,)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 20.0,),
            title: Text(Constants.menuProfile,
              style: TextStyle(
              fontSize: 13.0,
              fontFamily: "Poppins",
            ),),
            activeIcon: Icon(Icons.person_outline_outlined, size: 20.0,),
          ),
        ],
      ),
    );
  }

  /// Handle tab transition
  void onTabSelect(int index) {
    print(index);
    setState(() {
      currentIndex = index;
    });
  }
}