import 'package:e_wages/com/nitco/model/ComplaintMessage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'components/ComplaintAppBar.dart';

// ignore: camel_case_types
class View_Complaint_View extends StatefulWidget {
  @override
  _View_Complaint_View createState() => new _View_Complaint_View();
}

// ignore: camel_case_types
class _View_Complaint_View extends State<View_Complaint_View>{

  ScrollController _scrollController = new ScrollController();
  final inputController = TextEditingController();

  List<ComplaintMessage> messages = [
    ComplaintMessage("Adam", "System", "Hi , i cant submit my form", "14/04/2021 10:32am"),
    ComplaintMessage("Adam", "System", "Please fix Asap", "14/04/2021 10:32am"),
    ComplaintMessage("System", "Adam", "Alright , fixing it", "15/04/2021 10:32am"),
    ComplaintMessage("Adam", "System", "All good now", "16/04/2021 10:32am"),
  ];

  void sendMessage(){
    String message = inputController.text;
    if(message.isNotEmpty){
      DateTime now = DateTime.now();
      String formattedDate = DateFormat("dd/MM/yyyy hh:mm aa").format(now);
      setState(() {
        messages.add(new ComplaintMessage("Adam", "System", message, formattedDate));
      });
      inputController.clear();
      //scroll listview to bottom
      _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: const Duration(milliseconds: 100), curve: Curves.linear);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: ComplaintAppBar(),
      ),
      body: SafeArea(
        child: ListView.builder(
            controller: _scrollController,
            itemCount: messages.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 10,bottom: 60),
            itemBuilder: (context, index){
              return Column (
                children: [
                  Container(
                    padding:
                        EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                    child: Align(
                      alignment: (messages[index].from != "Adam" ? Alignment.topLeft : Alignment.topRight),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: (messages[index].from != "Adam" ? Colors.grey.shade200 : Colors.blue[200]),
                        ),
                        padding: EdgeInsets.all(16),
                        child: Text( messages[index].text, style: TextStyle(fontSize: 15),),
                      ),
                    ),
                  ),
                  Align(
                      alignment: (messages[index].from != "Adam" ? Alignment.topLeft : Alignment.topRight),
                      child: Container (
                        child : Text(messages[index].dateTime, style: TextStyle(fontSize: 10, color: Colors.grey)),
                        padding: EdgeInsets.only(left: 16 , right : 16 , bottom : 5),
                      ),
                  ),
                ],
              );
            },
        ),
      ),
      bottomSheet: new Container(
        padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
        height: 60,
        width: double.infinity,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            SizedBox(width: 15,),
            Expanded(
              child: TextField(
                controller: inputController,
                textInputAction: TextInputAction.send,
                decoration: InputDecoration(
                    hintText: "Write message...",
                    hintStyle: TextStyle(color: Colors.black54),
                    border: InputBorder.none
                ),
                onSubmitted: (text){
                  sendMessage();
                },
              ),
            ),
            SizedBox(width: 15,),
            FloatingActionButton(
              onPressed: (){
                sendMessage();
                // close keyboard
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Icon(Icons.send,color: Colors.white,size: 18,),
              backgroundColor: Colors.blue,
              elevation: 0,
            ),
           ],
          ),
        ),
    );
  }
}