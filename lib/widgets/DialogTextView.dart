import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants/colors.dart';
import 'package:flutter_app/constants/strings.dart';
class DialogTextView {


  setTextInput(context, String title,Function call,String type) {
    return FlatButton(
        onPressed: () => call(type),
        child:Text(title, style: TextStyle(color: Colors.black, fontSize: 17),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis, softWrap: false,)


    );;
  }
}

