import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Utils/utils.dart';

import 'package:flutter_app/constants/colors.dart';
import 'package:flutter_app/constants/dimens.dart';
import 'package:flutter_app/localization/app_localizations.dart';

import 'package:flutter_app/model/CheckCategory.dart';
import 'package:flutter_app/service/dioUpload.dart';
import 'package:flutter_app/widgets/app_bar.dart';
import 'package:flutter_app/widgets/button_submit.dart';
import 'package:flutter_app/widgets/text_field.dart';
import 'package:flutter_app/widgets/text_field_inactive.dart';
import 'package:flutter_app/widgets/text_title.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

import '../../routes.dart';

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
  String id="";
  TextEditingController NameController=TextEditingController();
  TextEditingController EmailController=TextEditingController();
  TextEditingController PhoneController=TextEditingController();
  @override
  void initState() {
    super.initState();
    var check=maps['item'];

    printed(check.toString());
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        
        appBar: MyAppBar().setAppBar(context, buildTranslate(context, 'appBar2'),GoBack),
        body: ListView(

          children: <Widget>[


            Container(
              margin: EdgeInsets.symmetric(vertical: Dimens.vertical_margin,horizontal: Dimens.horizontal_padding),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MyTextTitle().setTextInput(context, CupertinoIcons.person_solid, buildTranslate(context, 'stay_anonymous')),
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
                    visible: !_switchValue,
                    child: Column(
                      children: <Widget>[










                        MyTextTitle().setTextInput(context, CupertinoIcons.person_solid, buildTranslate(context, 'coordinates')),
                        SizedBox(height: Dimens.vertical_margin,),

                        MyTextField().setTextField(context, NameController,buildTranslate(context, 'name_hint')),
                        SizedBox(height: Dimens.vertical_padding,),
                        MyTextField().setTextField(context, EmailController,buildTranslate(context, 'email_hint')),
                        SizedBox(height: Dimens.vertical_padding,),
                        MyTextField().setTextField(context, PhoneController,buildTranslate(context, 'phone_hint')),

                      ],
                    ),
                  ),
                  Visibility(
                    visible: _switchValue,
                    child: Column(
                      children: <Widget>[








                        MyTextFieldInActive().setTextField(context, buildTranslate(context, 'stay_anonymous_warning')),
                        SizedBox(height: Dimens.vertical_margin,),

                        MyTextTitle().setTextInput(context, CupertinoIcons.person_solid, buildTranslate(context, 'coordinates')),
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



                  MySubmitButton().setButton(context, buildTranslate(context, 'submit'),onSubmit),





                ],
              ),
            ),
          ],
        )
    );
  }

  Future onSubmit() async {
    print(!_switchValue);
    List<File> img=await maps['images'];
    print(img.length);
    String comment=maps['comment'];
    maps.remove('images');
   String name=!_switchValue?NameController.text:"";
   String email=!_switchValue?EmailController.text:"";
   String phone=!_switchValue?PhoneController.text:"";
   String type=!_switchValue?"User":"Anonymous";
    maps.putIfAbsent('type', () => {"by":type,"name":name,"email":email,"type":"human","number":phone});
   if(!_switchValue){
     if(Utils().checkNull(name)){
       Utils().showSnackBar(buildTranslate(context, 'NoName'));
     }else  if(Utils().checkNull(email)){
       Utils().showSnackBar(buildTranslate(context, 'NoEmail'));
     }else{
       EasyLoading.show(status: buildTranslate(context, 'Register_Complaint'));
      id= await dioupload().AddIncident(maps);
     }
   }
   else{
     id= await dioupload().AddIncident(maps);
   }






    // await maps.remove('type');


   String d = await dioupload().FileUpload(img,id,comment,email,name);
   print(d);
   GoBack();

  }
  void printed(String maps){
    print(maps);
  }

  void GoBack() {
    EasyLoading.dismiss();
    Navigator.pop(context,"yes");
 // Navigator.popUntil(context, ModalRoute.withName(Routes.home));
   // Navigator.popUntil(context, ModalRoute.withName(Routes.report_incident1));
  }
}