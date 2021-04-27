import 'dart:convert';

import 'package:e_wages/com/nitco/model/NotificationObj.dart';
import 'package:e_wages/com/nitco/model/PayslipList.dart';
import 'package:flutter/services.dart';

class DummyJsonService {

  List<PayslipList> payslipList = List.empty();

  List<NotificationObj> notificationList = List.empty();

  Future<List<PayslipList>> loadPayslip(String path) async {
    try {
      String data = await rootBundle.loadString(path);
      print(data);
      var value = jsonDecode(data)["payslipList"] as List;
      payslipList = value.map((data) => PayslipList.fromJson(data)).toList();
      print(value);
    } catch (e) {
      print(e);
    }
    return payslipList;
  }

  Future<List<NotificationObj>> loadNotification(String path) async {
    try {
      String data = await rootBundle.loadString(path);
      print(data);
      var value = jsonDecode(data)["notificationList"] as List;
      notificationList = value.map((data) => NotificationObj.fromJson(data)).toList();
      print(value);
    } catch (e) {
      print(e);
    }
    return notificationList;
  }
}