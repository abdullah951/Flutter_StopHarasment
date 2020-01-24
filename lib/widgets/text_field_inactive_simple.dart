import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants/colors.dart';
import 'package:flutter_app/constants/strings.dart';
class MyTextFieldInActiveSimple {


  setTextField(context, TextEditingController myController,String label) {
    return new TextFormField(
      enabled: false,




      style: new TextStyle(
          fontSize: 15.0,


      ),

      controller: myController,
      validator: (value) {
        if (value.isEmpty) {
          print('Please enter some text');
          return 'Please enter some text';
        }
        print('Please');
        return null;
      },



      decoration: InputDecoration(

          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[300], width: 1.2,),
            borderRadius: new BorderRadius.circular(4.0),


          ),
          labelText: label,
          ),




      );

  }
}

