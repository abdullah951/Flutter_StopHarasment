
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Utils/utils.dart';
import 'package:flutter_app/constants/colors.dart';

import 'package:flutter_app/constants/dimens.dart' ;
import 'package:flutter_app/localization/app_localizations.dart';
import 'package:flutter_app/model/CheckCategory.dart';
import 'package:flutter_app/model/MapData.dart';
import 'package:flutter_app/service/dioUpload.dart';
import 'package:flutter_app/ui/report_incident2/report_incident2.dart';
import 'package:flutter_app/widgets/app_bar.dart';
import 'package:flutter_app/widgets/button_submit.dart';
import 'package:flutter_app/widgets/circular_image_widget.dart';
import 'package:flutter_app/widgets/text_field.dart';
import 'package:flutter_app/widgets/text_field_inactive.dart';
import 'package:flutter_app/widgets/text_field_inactive_simple.dart';
import 'package:flutter_app/widgets/text_field_large.dart';
import 'package:flutter_app/widgets/text_title.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../routes.dart';

class ReportIncidentScreen1 extends StatefulWidget {

  @override
  _ReportIncidentScreen1State createState() => _ReportIncidentScreen1State();
}

class _ReportIncidentScreen1State extends State<ReportIncidentScreen1> {
  final myController = TextEditingController();
  final AddressController = TextEditingController();
  final StreetController = TextEditingController();
  final CommentController = TextEditingController();
  final IncidentController = TextEditingController();

  MapDatas resultMap;
  var Maps;
  CheckCategory IncidentType;

  File _image;
  List<File> _imageFiles = List<File>();

  var userMap;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      image != null ? _imageFiles.add(image) : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: MyAppBar().setAppBar(context, buildTranslate(context, 'appBar1'), GoBack),
        body: ListView(

          children: <Widget>[


            Container(
              margin: EdgeInsets.symmetric(vertical: Dimens.vertical_margin,
                  horizontal: Dimens.horizontal_padding),
              child: Column(
                children: <Widget>[
                  MyTextTitle().setTextInput(
                      context, CupertinoIcons.photo_camera_solid,
                      buildTranslate(context, 'picture_of_the_incident')),
                  SizedBox(height: Dimens.vertical_padding,),
                  Container(
                    height: 100,

                    child: ListView(

                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        new ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: _imageFiles.length == null
                              ? 0
                              : _imageFiles.length,
                          itemBuilder: (BuildContext ctxt, int index) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),

                              child: _imageFiles.length == null
                                  ? null
                                  : new CircleAvatar(
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
                            backgroundImage: AssetImage(
                                'assets/images/ic_add.png'),
                            backgroundColor: Colorss.add_btn_bg,


                          ),
                        )

                      ],
                    ),
                  ),

                  SizedBox(height: Dimens.vertical_margin,),
                  MyTextTitle().setTextInput(
                      context, CupertinoIcons.location_solid, buildTranslate(context, 'address')),
                  SizedBox(height: Dimens.vertical_padding,),
                  Row(
                    children: <Widget>[
                      Expanded(


                        child: MyTextField().setTextField(
                            context, AddressController, buildTranslate(context, 'address_hint')),
                        flex: 4,
                      ),
                      SizedBox(width: Dimens.vertical_padding_small,),

                      Expanded(


                        child: MyTextField().setTextField(
                            context, StreetController, buildTranslate(context, 'street_hint')),
                        flex: 1,
                      ),
                    ],
                  ),
                  SizedBox(height: Dimens.vertical_padding,),
                  MyTextFieldInActive().setTextField(
                      context, buildTranslate(context, 'address_hint')),
                  SizedBox(height: Dimens.vertical_padding,),
                  MySubmitButton().setButton(context, 'Map', onMap),


                  SizedBox(height: Dimens.vertical_margin,),
                  MyTextTitle().setTextInput(context, Icons.assignment_late,
                      buildTranslate(context, 'incident_type')),
                  SizedBox(height: Dimens.vertical_padding,),
                  GestureDetector(
                    onTap: onType,
                    child: AbsorbPointer(

                      child: MyTextFieldInActiveSimple().setTextField(
                          context, IncidentController,
                          buildTranslate(context, 'incident_type_hint')),
                    ),
                  ),


                  SizedBox(height: Dimens.vertical_margin,),
                  MyTextTitle().setTextInput(
                      context, Icons.mode_comment, buildTranslate(context, 'comment')),
                  SizedBox(height: Dimens.vertical_padding,),
                  MyTextFieldLarge().setTextField(
                      context, CommentController, buildTranslate(context, 'comment_hint')),
                  SizedBox(height: Dimens.vertical_padding,),
                  MySubmitButton().setButton(context, buildTranslate(context, 'submit'), onSubmit),

                ],
              ),
            ),
          ],
        )
    );
  }

  Future<void> onMap() async {
    userMap = await Navigator.of(context).pushNamed(Routes.map);
     Maps = MapDatas.fromJson(userMap);
    // Map<String, dynamic>  map=json.decode(userMap);
    AddressController.text =Maps.throughput;
    StreetController.text = Maps.featurename;
    print("maps is    " + userMap.toString());
//    print('We sent the verification link to ${userMap.throughput}.');
  }

  Future<void> onType() async {
    print("called");

    var checkCategory = await Navigator.of(context).pushNamed(
        Routes.incident_type);

    IncidentType = checkCategory;
    IncidentController.text = IncidentType.name;

    print("maps is    " + IncidentType.toString());
//    print('We sent the verification link to ${userMap.throughput}.');
  }


  Future<void> onSubmit() async {
    // _imageFiles.clear();
    if(_imageFiles.length==null||_imageFiles.length==0){
      Utils().showSnackBar(buildTranslate(context, 'NoImages'));
    }else
    if(Utils().checkNull(StreetController.text)){
      Utils().showSnackBar(buildTranslate(context, 'NoLocation'));
    }else if(Utils().checkNull(IncidentController.text)){
      Utils().showSnackBar(buildTranslate(context, 'NoIncidentType'));
    }else if(Utils().checkNull(CommentController.text)){
      Utils().showSnackBar(buildTranslate(context, 'NoComment'));
    }else{
      Navigator
          .push(context,MaterialPageRoute(
        builder: (context) => ReportIncidentScreen2({"address":userMap,"screen":"AddIncidentReport","images":_imageFiles,"item":{"id":IncidentType.id,"name":IncidentType.name},"comment":CommentController.text,"status":"1"}),
      ), );
    }



//    Navigator.pushNamed(context, Routes.report_incident2);


  // dioupload().AddIncident({"adress":newMap,"comment":CommentController.text});
    //getImage();
   // dioupload().FileUpload(_imageFiles);

  }

  void GoBack() {
    Navigator.of(context).pop(true);
  }

  click() {
    // getImage();

  }



}