import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{
bool checkNull(String str){
  return str.isEmpty||str==""?true:false;

}
void showSnackBar(String  msgs){
  Fluttertoast.showToast(
      msg: msgs,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0
  );

}

}