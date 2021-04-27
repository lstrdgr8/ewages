import 'dart:convert';

import 'package:e_wages/com/nitco/constants/Constants.dart';
import 'package:e_wages/com/nitco/constants/UrlConfig.dart';
import 'package:e_wages/com/nitco/model/NotificationObj.dart';
import 'package:e_wages/com/nitco/network/GenericAPI.dart';

class NotificationService {

  List<NotificationObj> notificationList = List.empty();

  GenericAPI api = new GenericAPI(Constants.urlHost + UrlConfig.uriGetNotificationList);

  Future<List<NotificationObj>> getNotificationList() async{
    api.get().then((response){
      print(response.body);
      var value = jsonDecode(response.body)["notificationList.json"] as List;
      notificationList = value.map((data) => NotificationObj.fromJson(data)).toList();
    });
    return notificationList;
  }
}