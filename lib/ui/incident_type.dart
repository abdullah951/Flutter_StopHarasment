import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/constants/colors.dart';
import 'package:flutter_app/widgets/app_bar.dart';

class IncidentTypeScreen extends StatefulWidget {
  @override
  _IncidentTypeScreenState createState() => _IncidentTypeScreenState();
}

class _IncidentTypeScreenState extends State<IncidentTypeScreen> {
  final europeanCountries = ['Albania', 'Andorra', 'Armenia', 'Austria',
    'Azerbaijan', 'Belarus', 'Belgium', 'Bosnia and Herzegovina', 'Bulgaria',
    'Croatia', 'Cyprus', 'Czech Republic', 'Denmark', 'Estonia', 'Finland',
    'France', 'Georgia', 'Germany', 'Greece', 'Hungary', 'Iceland', 'Ireland',
    'Italy', 'Kazakhstan', 'Kosovo', 'Latvia', 'Liechtenstein', 'Lithuania',
    'Luxembourg', 'Macedonia', 'Malta', 'Moldova', 'Monaco', 'Montenegro',
    'Netherlands', 'Norway', 'Poland', 'Portugal', 'Romania', 'Russia',
    'San Marino', 'Serbia', 'Slovakia', 'Slovenia', 'Spain', 'Sweden',
    'Switzerland', 'Turkey', 'Ukraine', 'United Kingdom', 'Vatican City'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar().setAppBar(context, 'Incident type', goback),
     body: Container(
       margin: EdgeInsets.symmetric(horizontal: 30,vertical: 20),


        child: ListView.separated(
          itemCount: europeanCountries.length,


          itemBuilder: (context, index) {

            return GestureDetector(
              onTap: (){
                print(europeanCountries[index]+'');
                //goback();
              },
              child: Container(
                width: double.maxFinite,
                color: Colors.transparent,

                padding: EdgeInsets.all(15),


                child: Row(

                  children: <Widget>[
                    Icon(Icons.comment,color: Colorss.blue_background,),
                    SizedBox(width: 25,),
                    Text(europeanCountries[index],style: TextStyle(
                      color: Colorss.blue_background,

                    ),),



                  ],
                ),


              ),
            );
          }, separatorBuilder: (BuildContext context, int index) {
         return  Container(
            height: .5,
            width: MediaQuery.of(context).size.width*0.5,
            color: Colors.grey,
          );
        },

        ),
      ),
    );
  }

  goback() {
    Navigator.pop(context);
  }
}
