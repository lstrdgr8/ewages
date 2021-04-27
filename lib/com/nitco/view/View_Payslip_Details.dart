import 'package:e_wages/com/nitco/model/PayslipList.dart';
import 'package:e_wages/com/nitco/util/WidgetUtility.dart';
import 'package:e_wages/com/nitco/view/View_Payslip_Report.dart';
import 'package:e_wages/com/nitco/view/components/MainAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types, must_be_immutable
class View_Payslip_Details extends StatefulWidget {

  PayslipList payslipDetails;

  View_Payslip_Details({required this.payslipDetails});

  @override
  _View_Payslip_Details createState() => new _View_Payslip_Details(payslipDetails: payslipDetails);
}

// ignore: camel_case_types
class _View_Payslip_Details extends State<View_Payslip_Details> {

  PayslipList payslipDetails;

  _View_Payslip_Details({required this.payslipDetails});

  @override
  Widget build(BuildContext context) {
    print(payslipDetails);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: MainAppBar(title: "Payslip Details"),
      ),
      body: populateBody(payslipDetails),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Generate PDF if correct
          if(payslipDetails.isConfirmed) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => View_Payslip_Report(payslipDetails: payslipDetails)));
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Successfully verified Payslip. Generating report ..')));
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => View_Payslip_Report(payslipDetails: payslipDetails)));
          }
        },
        label: Text(payslipDetails.isConfirmed ? 'Export to PDF' : 'Salary Received?',
          style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold
          ),),
        icon: Icon(payslipDetails.isConfirmed ? Icons.receipt_long_outlined : Icons.info),
        backgroundColor: payslipDetails.isConfirmed ? Color(0xff4284A3) : Colors.redAccent.shade100,
      ),
    );
  }

  Widget populateBody(PayslipList details) {
    return SingleChildScrollView(
      child: 	Column(
        children: <Widget>[
          WidgetUtility.divider(height: 20.0, width: 10.0),
          Card(
            elevation: 5.0,
            shadowColor: Colors.grey,
            margin: EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: SizedBox(
                            child: Text(
                              details.title,
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontFamily: "Poppins",
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: SizedBox(
                            child: Text(
                              "Month and Year",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 16.0
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                ),
                Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: SizedBox(
                            child: Text(
                              details.netSalary.toString(),
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontFamily: "Poppins",
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: SizedBox(
                            child: Text(
                              "Net Salary",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 16.0
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                ),
              ],
            ),
          ),
          WidgetUtility.divider(height: 20.0, width: 20.0),
          Card(
            elevation: 5.0,
            shadowColor: Colors.grey,
            margin: EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Container(
                  color: Color(0xff4284A3),
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                          child: SizedBox(
                            child: Text(
                              "Earnings",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Basic Salary
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                        child: SizedBox(
                          child: Text(
                            "Basic Salary",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                        child: SizedBox(
                          child: Text(
                            details.basicSalary.toString(),
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // Claims
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                        child: SizedBox(
                          child: Text(
                            "Claims",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                        child: SizedBox(
                          child: Text(
                            details.claims.toString(),
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // Allowances
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                        child: SizedBox(
                          child: Text(
                            "Allowances",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                        child: SizedBox(
                          child: Text(
                            details.allowances.toString(),
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // Gross Pay
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                        child: SizedBox(
                          child: Text(
                            "Gross Pay",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                        child: SizedBox(
                          child: Text(
                            details.grossSalary.toString(),
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                WidgetUtility.divider(height: 20.0, width: 20.0),
                Container(
                  color: Color(0xff4284A3),
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                          child: SizedBox(
                            child: Text(
                              "Tax",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                        child: SizedBox(
                          child: Text(
                            "Income Tax",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                        child: SizedBox(
                          child: Text(
                            details.incomeTax.toString(),
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                        child: SizedBox(
                          child: Text(
                            "EPF",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                        child: SizedBox(
                          child: Text(
                            details.epf.toString(),
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                        child: SizedBox(
                          child: Text(
                            "SOCSO",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                        child: SizedBox(
                          child: Text(
                            details.socso.toString(),
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                        child: SizedBox(
                          child: Text(
                            "EIS",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                        child: SizedBox(
                          child: Text(
                            details.eis.toString(),
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                        child: SizedBox(
                          child: Text(
                            "LOP",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                        child: SizedBox(
                          child: Text(
                            details.lop.toString(),
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                        child: SizedBox(
                          child: Text(
                            "Other",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                        child: SizedBox(
                          child: Text(
                            details.other.toString(),
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          WidgetUtility.divider(height: 20.0, width: 20.0),
        ],
      ),
    );
  }
}