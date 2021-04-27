import 'dart:convert';

import 'package:e_wages/com/nitco/constants/Constants.dart';
import 'package:e_wages/com/nitco/constants/UrlConfig.dart';
import 'package:e_wages/com/nitco/model/PayslipList.dart';
import 'package:e_wages/com/nitco/network/GenericAPI.dart';

class PayslipService {

  List<PayslipList> payslipList = List.empty();

  GenericAPI api = new GenericAPI(Constants.urlHost + UrlConfig.uriGetPayslipsDetails);

  /// get list of payslips
  void getPayslipList() {
    api.get().then((response){
      var value = jsonDecode(response.body)["paylipList"] as List;
      payslipList = value.map((data) => PayslipList.fromJson(data)).toList();
    });
  }

  Future<List<PayslipList>> getPayslips() async {
    api = new GenericAPI(Constants.urlHost + UrlConfig.uriGetPayslips);
    api.get().then((response){
      print(response.body);
      var value = jsonDecode(response.body)["paylipList"] as List;
      payslipList = value.map((data) => PayslipList.fromJson(data)).toList();
    });
    return payslipList;
  }

  List<PayslipList> getPayslipDetails() {
    api.get().then((response){
      var value = jsonDecode(response.body)["paylipList"] as List;
      payslipList = value.map((data) => PayslipList.fromJson(data)).toList();
    });
    return payslipList;
  }

  /// method to display list of payslips in widgets
  List<PayslipList> getRecord() {
    return payslipList;
  }
}