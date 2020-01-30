import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Utils/utils.dart';

import 'package:flutter_app/constants/colors.dart';
import 'package:flutter_app/constants/dimens.dart';
import 'package:flutter_app/constants/strings.dart';
import 'package:flutter_app/model/CheckCategory.dart';
import 'package:flutter_app/service/dioUpload.dart';
import 'package:flutter_app/widgets/app_bar.dart';
import 'package:flutter_app/widgets/button_submit.dart';
import 'package:flutter_app/widgets/text_field.dart';
import 'package:flutter_app/widgets/text_field_inactive.dart';
import 'package:flutter_app/widgets/text_title.dart';

class ReportIncidentScreen2 extends StatefulWidget {
  Map<String, dynamic> maps;
  ReportIncidentScreen2(this.maps);




  @override
  _ReportIncidentScreen2State createState() => _ReportIncidentScreen2State(maps);
}

class _ReportIncidentScreen2State extends State<ReportIncidentScreen2> {
  Map<String, dynamic> maps;

  _ReportIncidentScreen2State(this.maps);
  

  bool _switchValue=false;
  bool _visibilityValue=false;
  TextEditingController myController=TextEditingController();
  @override
  void initState() {
    super.initState();
    var check=maps['item'];

    printed(check.toString());
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        
        appBar: MyAppBar().setAppBar(context, Strings.appBar2,GoBack),
        body: ListView(

          children: <Widget>[


            Container(
              margin: EdgeInsets.symmetric(vertical: Dimens.vertical_margin,horizontal: Dimens.horizontal_padding),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MyTextTitle().setTextInput(context, CupertinoIcons.person_solid, Strings.stay_anonymous),
                      CupertinoSwitch(value: _switchValue, onChanged: (bool value) {
                        setState(() {
                          _switchValue = value;
                          _visibilityValue=value;
                        });
                      },
                      activeColor: Colorss.blue_background,
                      ),
                    ],
                  ),
                  SizedBox(height: Dimens.vertical_margin,),
                  Visibility(
                    visible: !_visibilityValue,
                    child: Column(
                      children: <Widget>[










                        MyTextTitle().setTextInput(context, CupertinoIcons.person_solid, Strings.coordinates),
                        SizedBox(height: Dimens.vertical_margin,),

                        MyTextField().setTextField(context, myController,Strings.name_hint),
                        SizedBox(height: Dimens.vertical_padding,),
                        MyTextField().setTextField(context, myController,Strings.email_hint),
                        SizedBox(height: Dimens.vertical_padding,),
                        MyTextField().setTextField(context, myController,Strings.phone_hint),

                      ],
                    ),
                  ),
                  Visibility(
                    visible: _visibilityValue,
                    child: Column(
                      children: <Widget>[








                        MyTextFieldInActive().setTextField(context, Strings.stay_anonymous_warning),
                        SizedBox(height: Dimens.vertical_margin,),

                        MyTextTitle().setTextInput(context, CupertinoIcons.person_solid, Strings.coordinates),
                        SizedBox(height: Dimens.vertical_margin,),

                        MyTextFieldInActive().setTextField(context,''),
                        SizedBox(height: Dimens.vertical_padding,),
                        MyTextFieldInActive().setTextField(context, ''),
                        SizedBox(height: Dimens.vertical_padding,),
                        MyTextFieldInActive().setTextField(context, ''),

                      ],
                    ),
                  ),

                  SizedBox(height: Dimens.vertical_margin,),



                  MySubmitButton().setButton(context, 'Submit',onSubmit),





                ],
              ),
            ),
          ],
        )
    );
  }

  Future onSubmit() async {


   maps.putIfAbsent('type', () => {"by":"Anonymous","name":"kashif","email":"kashif.zahid18@gmail.com","type":"human","number":"03350542182"});
   List<File> img=maps['images'];
   String comment=maps['comment'];
   maps.remove('images');


     String s = await dioupload().AddIncident(maps);


   String d = await dioupload().FileUpload(img,s,comment);
   print(d);
   d=="1"?Navigator.of(context).pop(true):Utils().showSnackBar("Incident Not reported");

  }
  void printed(String maps){
    print(maps);
  }

  void GoBack() {

  }
}