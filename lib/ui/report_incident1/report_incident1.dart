
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants/colors.dart';
import 'package:flutter_app/constants/strings.dart';
import 'package:flutter_app/constants/dimens.dart' ;
import 'package:flutter_app/widgets/app_bar.dart';
import 'package:flutter_app/widgets/button_submit.dart';
import 'package:flutter_app/widgets/circular_image_widget.dart';
import 'package:flutter_app/widgets/text_field.dart';
import 'package:flutter_app/widgets/text_field_inactive.dart';
import 'package:flutter_app/widgets/text_field_large.dart';
import 'package:flutter_app/widgets/text_title.dart';
import 'package:image_picker/image_picker.dart';

import '../../routes.dart';

class ReportIncidentScreen1 extends StatefulWidget {

  @override
  _ReportIncidentScreen1State createState() => _ReportIncidentScreen1State();
}

class _ReportIncidentScreen1State extends State<ReportIncidentScreen1> {
  final myController = TextEditingController();
  final AddressController = TextEditingController();
  final CommentController = TextEditingController();

  File _image;
  List<File> _imageFiles=List<File>();

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      image!=null?_imageFiles.add(image):null;


    });

  }
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
              Container(
                height: 100,

                child: ListView(

                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    new ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: _imageFiles.length == null ? 0 : _imageFiles.length ,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          
                          child: _imageFiles.length == null
                              ? null
                              :  new  CircleAvatar(
                            radius: 50,


                            backgroundImage: FileImage(_imageFiles[index]),
                          ),
                        );
                      },
                    ),
                    GestureDetector(
                      onTap: getImage,
                      child: CircleAvatar(

                        radius: 50,
                        backgroundImage:  AssetImage('assets/images/ic_add.png'),
                        backgroundColor: Colorss.add_btn_bg,




                      ),
                    )

                  ],
                ),
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
              MySubmitButton().setButton(context, 'Map',onMap),



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

  void onMap(){
    Navigator.pushNamed(context, Routes.map);
  }


 void onSubmit() {
  // _imageFiles.clear();
  Navigator.pushNamed(context, Routes.incident_type);
   //getImage();

  }
  void GoBack() {
    Navigator.of(context).pop(true);
  }

  click() {
   // getImage();
  }
}
