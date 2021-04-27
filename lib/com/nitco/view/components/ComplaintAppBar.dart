import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ComplaintAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.blueAccent,
      flexibleSpace: SafeArea(
        child: Container(
          padding: EdgeInsets.only(right: 16),
          child: Row(
            children: <Widget>[
              IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back,color: Colors.white,),
              ),
              SizedBox(width: 2,),
              CircleAvatar(
                backgroundImage: AssetImage('assets/icons/profile_default.png'),
                maxRadius: 20,
              ),
              SizedBox(width: 12,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("System Admin",style: TextStyle(color: Colors.white, fontSize: 16 ,fontWeight: FontWeight.w600),),
                    SizedBox(height: 6,),
                    Text("Online",style: TextStyle(color: Colors.white, fontSize: 13),),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(
            'assets/icons/ewages-icon.png',
            fit: BoxFit.contain,
            height: 32,
          ),
        ],
      ),
    );
  }
}