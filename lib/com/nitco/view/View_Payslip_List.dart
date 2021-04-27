import 'package:badges/badges.dart';
import 'package:e_wages/com/nitco/model/PayslipList.dart';
import 'package:e_wages/com/nitco/services/DummyJsonService.dart';
import 'package:e_wages/com/nitco/services/PayslipService.dart';
import 'package:e_wages/com/nitco/view/View_Payslip_Details.dart';
import 'package:e_wages/com/nitco/view/components/GenericScaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types, must_be_immutable
class View_Payslip_List extends StatefulWidget {

  var mainAppBar;

  View_Payslip_List({this.mainAppBar});

  @override
  _View_Payslips createState() => new _View_Payslips();

}

// ignore: camel_case_types
class _View_Payslips extends State<View_Payslip_List> {

  var mainAppBar;

  _View_Payslips({this.mainAppBar});

  Future<List<PayslipList>> records = new Future.delayed(Duration(
    seconds: 1
  ));

  List<PayslipList> payslips = List.empty();

  DummyJsonService _dummyService = new DummyJsonService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: mainAppBar != null ? false : true,
        extendBodyBehindAppBar: mainAppBar != null  ? false : true,
        body: getPayslipList(),
        appBar: mainAppBar != null ? mainAppBar : null,
    );
  }

  @override
  void initState() {
    super.initState();
    print("getting records ...");
    records = _dummyService.loadPayslip("assets/json/payslipList.json");
  }

  Widget getPayslipList() {
    TextEditingController controller = new TextEditingController();
    return Scrollbar(
      isAlwaysShown: true,
      showTrackOnHover: true,
      child: FutureBuilder<List<PayslipList>>(
        future: records,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == null || snapshot.data!.isEmpty) {
              return Center(
                child: CircularProgressIndicator(), // loading
              );
            } else {
              return Column(
                children: <Widget>[
                  _searchBox(controller, snapshot),
                  Expanded(
                    child: controller.text.isEmpty && payslips.length == 0 ?
                    ListView.builder(
                      itemCount: snapshot.data!.length,
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
                                      fontSize: 14.0,
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
                                trailing: _getBadge(snapshot.data![index].isConfirmed),
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
                    ) : ListView.builder(
                      itemCount: payslips.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: <Widget>[
                            Card(
                              child: ListTile(
                                leading: Icon(Icons.receipt_long_outlined, color: Colors.orangeAccent.shade100 , size: 30.0),
                                title: Text(
                                  payslips[index].subject,
                                  style: TextStyle(
                                      fontWeight: !snapshot.data![index].isConfirmed ? FontWeight.bold : FontWeight.normal,
                                      fontSize: 14.0,
                                      fontFamily: "Poppins"
                                  ),
                                ),
                                subtitle: Text(
                                  payslips[index].title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 10.0,
                                      fontFamily: "Poppins"
                                  ),
                                ),
                                trailing: _getBadge(snapshot.data![index].isConfirmed),
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
                  )
                ],
              );
            }
          } else {
            return CircularProgressIndicator(); // loading
          }
        },
      ),
    );
  }

  // Payslip Search Box
  _searchBox(TextEditingController controller, AsyncSnapshot snapshot) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(1.0),
        child: Card(
          elevation: 2.0,
          shadowColor: Colors.blueAccent.shade100,
          child: ListTile(
            leading: Icon(Icons.search, color: Colors.blueAccent.shade100,),
            title: TextField(
              controller: controller,
              decoration: InputDecoration(
                  hintText: 'Search', border: InputBorder.none),
              // onChanged: onSearchTextChanged(controller, snapshot),
            ),
            trailing: IconButton(icon: Icon(Icons.cancel, color: Colors.redAccent.shade100,), onPressed: () {
              controller.clear();
              onSearchTextChanged(controller, snapshot);
            },),
          ),
        ),
      ),
    );
  }

  onSearchTextChanged(TextEditingController controller, AsyncSnapshot snapshot) async {
    payslips.clear();
    if (controller.text.isEmpty) {
      setState(() {});
    }
    snapshot.data.forEach((payslipDetails) {
      if (payslipDetails.title.contains(controller.text) || payslipDetails.subject.contains(controller.text))
        payslips.add(payslipDetails);
    });
    setState(() {});
    // return payslips;
  }

  _getBadge(bool read) {
    if(!read){
      return Badge(child: Icon(Icons.keyboard_arrow_right, color: Colors.blueAccent, size: 30.0));
    }
    else{
      return Icon(Icons.keyboard_arrow_right, color: Colors.blueAccent, size: 30.0);
    }
  }
}