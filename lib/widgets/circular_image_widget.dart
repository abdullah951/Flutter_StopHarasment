import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants/colors.dart';
import 'package:flutter_app/constants/strings.dart';
class MyCircularImage {


  setMyCircularImage(context, String title, Function click) {
    return GestureDetector(
      onLongPress: click(),
      child: Container(
        width: 70.0,

        height: 70.0,

        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              width: 2,
              color: Colorss.add_btn_bg
          ),
          image: DecorationImage(
              fit: BoxFit.fill,

              image: AssetImage('assets/images/ic_add.png')
          ),
        ),
      ),
    );
  }
}