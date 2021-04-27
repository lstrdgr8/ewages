import 'package:e_wages/com/nitco/constants/Constants.dart';
import 'package:e_wages/com/nitco/model/NotificationObj.dart';
import 'package:e_wages/com/nitco/model/PayslipList.dart';
import 'package:e_wages/com/nitco/services/DummyJsonService.dart';
import 'package:e_wages/com/nitco/util/WidgetUtility.dart';
import 'package:e_wages/com/nitco/view/View_Notification_List.dart';
import 'package:e_wages/com/nitco/view/View_Profile.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:e_wages/com/nitco/services/FirebaseService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'View_Complaint_List.dart';
import 'View_Payslip_Details.dart';
import 'View_Payslip_List.dart';
import 'components/CustomIcon.dart';

// ignore: camel_case_types
class View_Home extends StatefulWidget {

  @override
  _View_Home createState() => new _View_Home();
}

// ignore: camel_case_types
class _View_Home extends State<View_Home> {

  int count = 0;

  int _selectedTab = 0;

  var navTitle;

  FirebaseService _firebaseService = new FirebaseService(firebaseMessaging: FirebaseMessaging.instance, topic: "all");

  DummyJsonService _dummyService = new DummyJsonService();

  Future<List<NotificationObj>> records = new Future.delayed(Duration(
      seconds: 1
  ));

  Future<List<PayslipList>> payslipList = new Future.delayed(Duration(
      seconds: 1
  ));

  @override
  void initState() {
    super.initState();
    //_firebaseService.onMessage();
    records = _dummyService.loadNotification("assets/json/notificationList.json");
    payslipList = _dummyService.loadPayslip("assets/json/payslipList.json");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _homePage(context),
    );
  }

  Widget _homePage(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: _selectedTab == 0 ? true : false,
      body: populateBody(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: _selectedTab == 0 ? appbar() : menuAppBar(getTitle(_selectedTab)),
      ),
      bottomNavigationBar: customNavigationBar(),
    );
  }

  Widget _preferredSize() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: menuAppBar(getTitle("")),
    );
  }

  getPayslipList() {
    return Container(
      child: FutureBuilder<List<PayslipList>>(
        future: payslipList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * .30,
                    width: MediaQuery.of(context).size.width * .90,
                    child: Scrollbar(
                      hoverThickness: 2.0,
                      thickness: 8.0,
                      child: ListView.builder(
                        itemCount: snapshot.data!.length - 2,
                        itemBuilder: (context, index) {
                          return Column(
                            children: <Widget>[
                              Card(
                                child: ListTile(
                                  leading: Icon(Icons.receipt_long_outlined, color: Colors.orangeAccent.shade100 , size: 30.0),
                                  title: Text(
                                    snapshot.data![index].subject,
                                    style: TextStyle(
                                        fontWeight: !snapshot.data![index].isConfirmed ? FontWeight.bold : FontWeight.normal,
                                        fontSize: 12.0,
                                        fontFamily: "Poppins"
                                    ),
                                  ),
                                  subtitle: Text(
                                    snapshot.data![index].title,
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 10.0,
                                        fontFamily: "Poppins"
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => View_Payslip_Details(payslipDetails: snapshot.data![index])));
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: new InkWell(
                            child: new Text('View more ...', style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 12.0,
                              color: Colors.blueAccent.shade100,
                            ),),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => View_Payslip_List(mainAppBar:_preferredSize(),)));
                            }
                        ),
                      )
                  ),
                ],
              );
          } else {
            return Container(
              child: Center(
                child: CircularProgressIndicator(), // loading
              ),
            );
          }
        },
      ),
    );
  }

  Widget _home() {
    return Stack(
        children: <Widget>[
          Container(
            decoration:
              BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/icons/home_background.png'), fit: BoxFit.fill),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0))),
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                        height: MediaQuery.of(context).size.height * .40,
                        color: Colors.transparent,
                      ),
                    Container(
                      child: getPayslipList(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // inside upper blue color
          Container(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * .15,
                right: 30.0,
                left: 30.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                        child: ClipOval(
                          child: Image.asset(Constants.assetProfile, height: 100.0, fit: BoxFit.fill, width: 100.0),
                        ),
                        radius: 40.0,
                        backgroundColor: Colors.transparent
                    ),
                  ),
                  WidgetUtility.divider(height: 20.0, width: MediaQuery.of(context).size.height * .40),
                  Container(
                    alignment: Alignment.center,
                    height: 30,
                    child: Text(
                      "Hey User!",
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                        decorationThickness: 2.0,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 30,
                    child: Text(
                      "What would you like to do today?",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                        decorationThickness: 2.0,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                  WidgetUtility.divider(height: 20.0, width: MediaQuery.of(context).size.height * .40),
                ],
              ),
            ),
          ),
        ]
    );
  }

  customNavigationBar() {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/icons/navigator_background.png'), fit: BoxFit.fill),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0))),
      padding: EdgeInsets.all(3),
      child: BottomNavigationBar(
        currentIndex: _selectedTab,
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
              icon: Icon(Icons.home, size: 25.0,),
              // ignore: deprecated_member_use
              title: Text(Constants.menuHome,
                style: TextStyle(
                  fontSize: 13.0,
                  fontFamily: "Poppins",
                ),),
              activeIcon: Icon(Icons.home_outlined, size: 25.0,)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance, size:25.0,),
              // ignore: deprecated_member_use
              title: Text(Constants.menuPayslips,
                style: TextStyle(
                  fontSize: 13.0,
                  fontFamily: "Poppins",
                ),),
              activeIcon: Icon(Icons.account_balance_outlined, size: 25.0,)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.rate_review, size: 25.0,),
              // ignore: deprecated_member_use
              title: Text(Constants.menuComplaint,
                style: TextStyle(
                  fontSize: 13.0,
                  fontFamily: "Poppins",
                ),),
              activeIcon: Icon(Icons.rate_review_outlined, size: 25.0,)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 25.0,),
            title: Text(Constants.menuProfile,
              style: TextStyle(
                fontSize: 13.0,
                fontFamily: "Poppins",
              ),),
            activeIcon: Icon(Icons.person_outline_outlined, size: 25.0,),
          ),
        ],
      ),
    );
  }

  // App Bar for Home Screen
  appbar() {
    return FutureBuilder<List<NotificationObj>>(
      future: records,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    height: 100,
                    width: 40,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/icons/ewages-icon-white.png'),
                            fit: BoxFit.scaleDown))),
                WidgetUtility.divider(width: 10.0),
                Container(
                    height: 300,
                    width: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/icons/ewages-text-white.png'),
                            fit: BoxFit.scaleDown))),
              ],
            ),
            actions: [
              CustomIcon(
                text: '',
                iconData: unreadMessages(snapshot) > 0 ? Icons.notification_important_outlined : Icons.notifications,
                notificationCount: unreadMessages(snapshot),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => View_Notification_List(listNotification: snapshot.data!)));
                },
              ),
            ],
          );
        } else {
          return CircularProgressIndicator(); // loading
        }
      },
    );
  }

  menuAppBar(String title) {
    return AppBar(
      elevation: 6.0,
      automaticallyImplyLeading: false,
      title: Container(
        color: Colors.transparent,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/icons/ewages-icon-white.png',
              fit: BoxFit.contain,
              height: 32,
            ),
            SizedBox(
              width: 9.0,
            ),
            Text(
              title,
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Handle tab transition
  void onTabSelect(int index) {
    print(index);
    setState(() {
      _selectedTab = index;
    });
  }

  /// Populate body based on menu tabs
  Widget populateBody() {
    if (_selectedTab == 1) {
      return View_Payslip_List();
    } else if (_selectedTab == 2) {
      return View_Complaint_List();
    } else if (_selectedTab == 3) {
      return View_Profile();
    } else {
      return _home();
    }
  }

  /// Get title of Menu
  String getTitle (navTitle) {
    if (null != navTitle) {
      if (_selectedTab == 1) {
        navTitle = "My Payslips";
      } else if (_selectedTab == 2) {
        navTitle = "My Complaint";
      } else if (_selectedTab == 3) {
        navTitle = "My Profile";
      }
    } else {
      navTitle = "My Payslips";
    }

    return navTitle;
  }

  /// Get unread messages
  int unreadMessages(AsyncSnapshot<List<NotificationObj>> snapshot) {
    int count = 0;
    for(var i = 0; i < snapshot.data!.length ; i ++) {
      if(!snapshot.data![i].read) {
        count++;
      }
    }
    return count;
  }
}

