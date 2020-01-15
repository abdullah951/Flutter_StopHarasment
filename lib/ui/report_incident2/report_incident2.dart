import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants/dimens.dart';
import 'package:flutter_app/constants/strings.dart';
import 'package:flutter_app/widgets/app_bar.dart';
import 'package:flutter_app/widgets/button_submit.dart';
import 'package:flutter_app/widgets/text_field.dart';
import 'package:flutter_app/widgets/text_title.dart';

class ReportIncidentScreen2 extends StatefulWidget {
  @override
  _ReportIncidentScreen2State createState() => _ReportIncidentScreen2State();
}

class _ReportIncidentScreen2State extends State<ReportIncidentScreen2> {
  bool _switchValue=false;
  TextEditingController myController=TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: MyAppBar().setAppBar(context, Strings.appBar2),
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
                        });
                      },
                      ),
                    ],
                  ),
                  SizedBox(height: Dimens.vertical_margin,),



                  MyTextTitle().setTextInput(context, CupertinoIcons.person_solid, Strings.coordinates),
                  SizedBox(height: Dimens.vertical_margin,),

                  MyTextField().setTextField(context, myController,Strings.name_hint),
                  SizedBox(height: Dimens.vertical_padding,),
                  MyTextField().setTextField(context, myController,Strings.email_hint),
                  SizedBox(height: Dimens.vertical_padding,),
                  MyTextField().setTextField(context, myController,Strings.phone_hint),

                  SizedBox(height: Dimens.vertical_margin,),



                  MySubmitButton().setButton(context, 'Submit',onSubmit),





                ],
              ),
            ),
          ],
        )
    );
  }

  onSubmit() {
  }
}