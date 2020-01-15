import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants/colors.dart';
import 'package:flutter_app/constants/strings.dart';
class MyTextFieldInActive {


  setTextField(context, TextEditingController myController) {
    return new TextFormField(

      enabled: false,
      textAlign: TextAlign.center,


      style: new TextStyle(
          fontSize: 15.0,



      ),

      controller: myController,
      decoration: InputDecoration(
       enabled: false,
        hintText: Strings.address_hint,

        fillColor:  Colors.grey[300],
          filled: true,

          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[300], width: 0,),
            borderRadius: new BorderRadius.circular(4.0),


          ),

          ),




      );

  }
}

