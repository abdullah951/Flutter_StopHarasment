import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants/colors.dart';
import 'package:flutter_app/constants/strings.dart';
class SimpleTextView {


  setTextInput(context, String title) {
    return Container(

      child: new Row(
        children: <Widget>[
          Text(title, style: TextStyle(color: Colors.black, fontSize: 17),textAlign: TextAlign.center,)
        ],
      ),
    );;
  }
}

