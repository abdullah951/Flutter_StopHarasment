import 'package:flutter/material.dart';
import 'package:flutter_app/constants/colors.dart';
import 'package:flutter_app/constants/strings.dart';
class MyTextField {


  setTextField(context, TextEditingController myController) {
    return new TextFormField(
      style: new TextStyle(
          fontSize: 15.0,


      ),

      controller: myController,
      decoration: InputDecoration(

          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[300], width: 1.2,),
            borderRadius: new BorderRadius.circular(4.0),


          ),
          labelText: 'Enter your name',
          ),




      );

  }
}

