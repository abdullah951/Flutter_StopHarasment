
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants/colors.dart';
import 'package:flutter_app/constants/strings.dart';
import 'package:flutter_app/constants/dimens.dart' ;
import 'package:flutter_app/widgets/app_bar.dart';
import 'package:flutter_app/widgets/button_submit.dart';
import 'package:flutter_app/widgets/text_field.dart';
import 'package:flutter_app/widgets/text_field_inactive.dart';
import 'package:flutter_app/widgets/text_field_large.dart';
import 'package:flutter_app/widgets/text_title.dart';

import '../../routes.dart';

class ReportIncidentScreen1 extends StatefulWidget {

  @override
  _ReportIncidentScreen1State createState() => _ReportIncidentScreen1State();
}

class _ReportIncidentScreen1State extends State<ReportIncidentScreen1> {
  final myController = TextEditingController();
  final AddressController = TextEditingController();
  final CommentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: MyAppBar().setAppBar(context, Strings.appBar1,GoBack),
      body: ListView(

        children: <Widget>[


        Container(
          margin: EdgeInsets.symmetric(vertical: Dimens.vertical_margin,horizontal: Dimens.horizontal_padding),
          child: Column(
            children: <Widget>[
              MyTextTitle().setTextInput(context, CupertinoIcons.photo_camera_solid, Strings.picture_of_the_incident),
              SizedBox(height: Dimens.vertical_padding,),
              Row(
                children: <Widget>[
                  Expanded(
                    child: SizedBox(
                      width: 20,
                      height: 100.0,
                      child: new ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return _circularImageWidget();
                        },
                      ),
                    ),
                  ),
                  _circularImageWidget()
                ],
              ),
              SizedBox(height: Dimens.vertical_margin,),
              MyTextTitle().setTextInput(context, CupertinoIcons.location_solid, Strings.address),
              SizedBox(height: Dimens.vertical_padding,),
              Row(
               children: <Widget>[
                 Expanded(


                  child : MyTextField().setTextField(context, AddressController,Strings.address_hint),
                   flex: 4,
                 ),
                 SizedBox(width: Dimens.vertical_padding_small,),

                 Expanded(


                   child : MyTextField().setTextField(context, myController,Strings.street_hint),
                   flex: 1,
                 ),
               ],
              ),
              SizedBox(height: Dimens.vertical_padding,),
              MyTextFieldInActive().setTextField(context,Strings.address_hint),
              SizedBox(height: Dimens.vertical_padding,),
              MySubmitButton().setButton(context, 'Map',onSubmit),



              SizedBox(height: Dimens.vertical_margin,),
              MyTextTitle().setTextInput(context, Icons.assignment_late, Strings.incident_type),
              SizedBox(height: Dimens.vertical_padding,),
              MyTextField().setTextField(context, myController,Strings.incident_type_hint),

              SizedBox(height: Dimens.vertical_margin,),
              MyTextTitle().setTextInput(context, Icons.mode_comment, Strings.comment),
              SizedBox(height: Dimens.vertical_padding,),
              MyTextFieldLarge().setTextField(context, CommentController, Strings.comment_hint),
              SizedBox(height: Dimens.vertical_padding,),
              MySubmitButton().setButton(context, 'Submit',onSubmit),

            ],
          ),
        ),
        ],
      )
    );
  }

  Widget _circularImageWidget() {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
            width: 4,
            color: Colorss.add_btn_bg
        ),
        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/ic_add.png')
        ),
      ),
    );
  }


 void onSubmit() {
   Navigator.pushNamed(context, Routes.report_incident2);

  }
  void GoBack() {
    Navigator.of(context).pop(true);
  }
}
