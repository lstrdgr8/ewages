// ignore: import_of_legacy_library_into_null_safe
import 'package:badges/badges.dart';
import 'package:e_wages/com/nitco/model/ComplaintMessage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_wages/com/nitco/model/ComplaintForm.dart';
import 'package:intl/intl.dart';

import 'View_Complaint_New.dart';
import 'View_Complaint_View.dart';
import 'components/MainAppBar.dart';

// ignore: camel_case_types, must_be_immutable
class View_Complaint_List extends StatefulWidget {

  @override
  _View_Complaint_List createState() => new _View_Complaint_List();
}

// ignore: camel_case_types
class _View_Complaint_List extends State<View_Complaint_List>{

  static ComplaintMessage message = new ComplaintMessage("Adam", "Lester", "Lights not working", "14/04/2021 10:32am");

  List<ComplaintForm> complaintList = [
    ComplaintForm(112301203, "CMPL12345672", "14/04/2021", "Complaint on Employer", "Workplace Conditions", message, 1),
    ComplaintForm(912391,"CMPL12343029", "14/04/2021", "Complaint on System", "Unable to Submit Form", message, 1),
    ComplaintForm(12313, "CMPL95305678","15/04/2021", "Complaint on Employer", "Job Duties", message, 0),
    ComplaintForm(128381, "CMPL17849578","16/04/2021", "Complaint on Employer", "Misconduct in the Workplace", message, 0),
    ComplaintForm(1239139,"CMPL12293678", "14/06/2021", "Complaint on System", "Web Pages Failed to Load", message, 0),
    ComplaintForm(8564859, "CMPL02935675","31/09/2021", "Complaint on Employer", "Overwork", message, 1),
    ComplaintForm(8564859, "CMPL02935632","31/09/2021", "Complaint on System", "Low Pay", message, 1),
    ComplaintForm(8564859, "CMPL02935675","31/09/2021", "Complaint on Employer", "Policy Changes", message, 1),
    ComplaintForm(8564859, "CMPL029312315","31/09/2021", "Complaint on Employer", "Work Hours", message, 1),
  ];

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = new TextEditingController();
    return Scaffold(
      body: Column(
        children: <Widget>[
          _searchBox(_searchController),
          Expanded(
              child: SizedBox(
                child: Scrollbar(
                  //showTrackOnHover: true,
                  isAlwaysShown: true,
                  child: ListView.builder(
                    itemCount: complaintList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                          leading: Container(
                            padding: EdgeInsets.only(right: 12.0),
                            decoration: new BoxDecoration(
                                border: new Border(
                                    right: new BorderSide(width: 1.0, color: Colors.blueAccent.shade100))),
                            child: _unreadMessage(complaintList[index].unread),
                          ),
                          title: Text(
                            complaintList[index].cmplRefNo,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                fontFamily: "Poppins"),
                          ),
                          subtitle: Row(
                            children: <Widget>[
                              Text(complaintList[index].date + "\n" +
                                  complaintList[index].complaintType,
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 12.0
                                  )),
                            ],
                          ),
                          trailing: _getBadge(complaintList[index].unread),
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => View_Complaint_View()));
                          },
                        ),
                      );
                    },
                  ),
                )
              ),
          ),
          SizedBox(height: 75),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => View_Complaint_New()));
        },
        label: const Text('New Complaint',
          style: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.bold
          ),),
        icon: const Icon(Icons.add),
        backgroundColor: Color(0xff5993AF),
      ),
    );
  }

  _getBadge(int unread) { // <<<<< Note this change for the return type
    if(unread == 1){
      return Badge(child: Icon(Icons.keyboard_arrow_right, color: Colors.blueAccent.shade100, size: 30.0));
    }
    else{
      return Icon(Icons.keyboard_arrow_right, color: Colors.blueAccent.shade100, size: 30.0);
    }
  }

  _unreadMessage(int unread) {
    if(unread == 1){
      return Icon(Icons.label_important, color: Colors.redAccent.shade100, size: 30.0);
    }
    else{
      return Icon(Icons.assignment, color: Colors.orangeAccent.shade100, size: 30.0);
    }
  }

  _searchBox(TextEditingController controller) {
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
              // onSearchTextChanged(controller, snapshot);
            },),
          ),
        ),
      ),
    );
  }
}