import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants/colors.dart';
import 'package:flutter_app/constants/strings.dart';
class MyTextTitle {


  setTextInput(context,IconData icon,String title) {
    return Container(

      child: new Row(
        children: <Widget>[
          Icon(icon, color: Colorss.blue_background),
          SizedBox(width: 10,),
          Text(title, style: TextStyle(color: Colorss.blue_background,fontSize: 15),)
        ],
      ),
    );;
  }
}

