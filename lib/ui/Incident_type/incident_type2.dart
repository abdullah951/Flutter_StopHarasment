import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/constants/colors.dart';
import 'package:flutter_app/constants/strings.dart';
import 'package:flutter_app/constants/urls.dart';
import 'package:flutter_app/model/GetCategory.dart';

import 'package:flutter_app/routes.dart';
import 'package:flutter_app/service/webservice.dart';
import 'package:flutter_app/widgets/app_bar.dart';
import 'package:flutter_app/widgets/app_bar_cross.dart';
import 'package:flutter_app/widgets/incident_type_item.dart';
import 'package:flutter_app/widgets/incident_type_item_divider.dart';
import 'package:flutter_app/widgets/incident_type_list.dart';
import 'package:http/http.dart' as http;

import 'incident_type3.dart';

class IncidentType2Screen extends StatefulWidget {
  final String names;
  IncidentType2Screen(this.names);


  @override
  _IncidentType2ScreenState createState() => _IncidentType2ScreenState(names);
}

class _IncidentType2ScreenState extends State<IncidentType2Screen> {
  String names;

  _IncidentType2ScreenState(this.names);


  List<GetCategory> _newsArticles = List<GetCategory>();



  @override
  void initState() {
    super.initState();

    _populateNewsArticles();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarCross().setAppBar(context, Strings.incident_type_hint, goback, cross),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: MyIncidentTypeList().setMyIncidentTypeList(context, _newsArticles, action),

      ),
    );
  }

  goback() {
    Navigator.pop(context);
  }

  cross() {
    Navigator.popUntil(context, ModalRoute.withName(Routes.report_incident1));
  }
  void _populateNewsArticles() {
    String url=Urls.GetCategory+"?"+GetParameters.Screen+"="+Screens.GetSubCategoryScreen+"&"+GetParameters.Id+"="+names;
    print(url);

    Webservice().load(GetCategory.all(url)).then((newsArticles) => {
      setState(() => {
        _newsArticles = newsArticles
      })
    });

  }

  action(int index) {
    print(_newsArticles[index].name +" get title is");
    Navigator.push(context,MaterialPageRoute(
      builder: (context) => IncidentType3Screen(_newsArticles[index].id.toString()),
    ),
    );
  }
}
