import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants/colors.dart';
import 'package:flutter_app/constants/strings.dart';
class MySubmitButton {


  setButton(context,String title) {
    return RaisedButton(
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(8.0),
            ),
            color: Colorss.blue_background,
        textColor: Colorss.white_txt,
        padding: EdgeInsets.only(left: 30, right: 40, bottom: 15, top: 15),
        onPressed: () {

        },
        child: Center(
          child: Text(
                  title.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                  ),
                ),
        ),

    );
  }
}

