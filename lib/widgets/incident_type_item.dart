import 'package:flutter/material.dart';
import 'package:flutter_app/constants/colors.dart';

class MyIncidentItem {


  setMyIncidentItem(context, String title, Function action,int items) {
    return new GestureDetector(
      onTap: () {
       action(items);
      },
      child: Container(

        width: double.maxFinite,
        color: Colors.transparent,


        padding: EdgeInsets.all(15),


        child: Row(

          children: <Widget>[
            Icon(Icons.comment, color: Colorss.blue_background,),
            SizedBox(width: 25,),
            Text(title, style: TextStyle(
              color: Colorss.blue_background,
              fontSize: 18,

            ),),

          ],
        ),


      ),
    );
  }
}