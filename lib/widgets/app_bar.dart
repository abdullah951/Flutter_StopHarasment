import 'package:flutter/material.dart';
import 'package:flutter_app/constants/colors.dart';
import 'package:flutter_app/constants/strings.dart';
class MyAppBar {


  setAppBar(context, String title, Function goback) {
    return new AppBar(
      backgroundColor: Colorss.blue_background,
      centerTitle: true,
      title: new Text(title, style: TextStyle(color: Colorss.white),),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colorss.white,
          semanticLabel: 'back',
        ),
        onPressed: () {
          goback();
        },
      ),

    );
  }
}

