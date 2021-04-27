import 'package:e_wages/com/nitco/model/MasterDataDto.dart';
import 'package:e_wages/com/nitco/util/WidgetUtility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'View_Complaint_List.dart';
import 'View_Home.dart';
import 'components/ButtonWidget.dart';
import 'components/MainAppBar.dart';

// ignore: camel_case_types
class View_Complaint_New extends StatefulWidget {

  @override
  _View_Complaint_New createState() => new _View_Complaint_New();

}

// ignore: camel_case_types
class _View_Complaint_New extends State<View_Complaint_New>{
  final _formKey = GlobalKey<FormState>();

  bool visibilityTag = false;

  List<MasterDataDto> complaintSubject = [
    MasterDataDto(12, "CMPSUB", "Complaint on Employer", "COMPLAINT_SUBJECT", true),
    MasterDataDto(13, "CMPSUB", "Complaint on System", "COMPLAINT_SUBJECT", true),
  ];

  List<MasterDataDto> complaintTypeList = [
    MasterDataDto(1, "CMPTYPE", "Low Pay and Pay Disputes", "COMPLAINT_TYPE", true),
    MasterDataDto(2, "CMPTYPE", "Lack of Vacation/Sick Leave", "COMPLAINT_TYPE", true),
    MasterDataDto(3, "CMPTYPE", "Misconduct in the Workplace", "COMPLAINT_TYPE", true),
    MasterDataDto(4, "CMPTYPE", "Workplace Conditions", "COMPLAINT_TYPE", true),
    MasterDataDto(5, "CMPTYPE", "Overwork", "COMPLAINT_TYPE", true),
    MasterDataDto(6, "CMPTYPE", "Work Hours", "COMPLAINT_TYPE", true),
    MasterDataDto(7, "CMPTYPE", "Job Duties", "COMPLAINT_TYPE", true),
    MasterDataDto(8, "CMPTYPE", "Policy Changes", "COMPLAINT_TYPE", true),
    MasterDataDto(9, "CMPTYPE", "Web Pages Failed to Load", "COMPLAINT_TYPE", true),
    MasterDataDto(10, "CMPTYPE", "Unable to Submit Form","COMPLAINT_TYPE", true),
    MasterDataDto(11, "CMPTYPE", "Others", "COMPLAINT_TYPE", true),
  ];

  List<DropdownMenuItem<MasterDataDto>>? _dropdownTypeItems;
  MasterDataDto? _selectedType;

  List<DropdownMenuItem<MasterDataDto>>? _dropdownSubjectItems;
  MasterDataDto? _selectedSubject;

  void initState() {
    super.initState();
    _dropdownTypeItems = buildDropDownMenuItems(complaintTypeList);
    _selectedType = _dropdownTypeItems![0].value!;

    _dropdownSubjectItems = buildDropDownMenuItems(complaintSubject);
    _selectedSubject = _dropdownSubjectItems![0].value!;
  }

  List<DropdownMenuItem<MasterDataDto>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<MasterDataDto>> items = [];
    for (MasterDataDto listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.mstrDtDesc),
          value: listItem,
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: new Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: MainAppBar(title: "Add Complaint"),
        ),
        body: Card(
          elevation: 2.0,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(3, 25, 0, 4),
                child: ListTile(
                  leading: const Icon(Icons.assignment, color: Colors.orangeAccent),
                  title: Text(
                    "EMPLOYEE COMPLAINT FORM",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins"
                    ),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 25, 0, 4),
                child: ListTile(
                  title: Text("Type of Complaint",
                    style: TextStyle(
                        color: Colors.grey ,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold
                    ),),
                  subtitle: DropdownButton<MasterDataDto>(
                      isExpanded:true,
                      value: _selectedType,
                      items: _dropdownTypeItems,
                      onChanged: (value) {
                        setState(() {
                          _selectedType = value!;
                          if(_selectedType!.mstrDtDesc == "Others"){
                            visibilityTag = true;
                          }
                          else{
                            visibilityTag = false;
                          }
                        });
                      }),
                ),
              ),
              visibilityTag ? new ListTile(
                subtitle: _textInput(),
              ): new Container(),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                child: ListTile(
                  title: _textInputMultiLine(hint: "Complaint Message ..."),
                ),
              ),
              WidgetUtility.divider(height: 10.0),
              Container(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Important: Please fill out the complaint message. We will review your request "
                      "and follow up with you as soon as possible",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 12.0,
                      color: Colors.redAccent.shade100
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomSheet: new Container(
          margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
          child: ButtonWidget(
            onClick: () {
              // Validate returns true if the form is valid, or false otherwise.
              if (_formKey.currentState!.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Complaint Submitted')));
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => View_Complaint_List()));
              }
            },
            btnText: "SUBMIT",
            color: Color(0xff13668D),
          ),
        ),
      ),
    );
  }

  Widget _textInputMultiLine({hint}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),border: Border.all(width: 1.0, color: Colors.grey),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(left: 10),
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        maxLines: 5,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
        ),
        // The validator receives the text that the user has entered.
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field is required';
          }
          return null;
        },
      ),
    );
  }

  Widget _textInput() {
    return Align(
      child: Container(
        margin: EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),border: Border.all(width: 1.0, color: Colors.grey),
          color: Colors.white,
        ),
        child: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 10, bottom: 9, top: 5, right: 10),
            hintText: 'Please State Other Complaints',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }
            return null;
          },
        ),
      ),
    );
  }
}