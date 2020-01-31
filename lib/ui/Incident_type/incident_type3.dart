import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/constants/colors.dart';
import 'package:flutter_app/constants/strings.dart';
import 'package:flutter_app/constants/urls.dart';
import 'package:flutter_app/localization/app_localizations.dart';
import 'package:flutter_app/model/CheckCategory.dart';
import 'package:flutter_app/model/GetCategory.dart';

import 'package:flutter_app/routes.dart';
import 'package:flutter_app/service/webservice.dart';
import 'package:flutter_app/widgets/app_bar.dart';
import 'package:flutter_app/widgets/app_bar_cross.dart';
import 'package:flutter_app/widgets/incident_type_item.dart';
import 'package:flutter_app/widgets/incident_type_item_divider.dart';
import 'package:flutter_app/widgets/incident_type_list.dart';
import 'package:http/http.dart' as http;

class IncidentType3Screen extends StatefulWidget {
  final String names;
  IncidentType3Screen(this.names);


  @override
  _IncidentType3ScreenState createState() => _IncidentType3ScreenState(names);
}

class _IncidentType3ScreenState extends State<IncidentType3Screen> {
  String names;

  _IncidentType3ScreenState(this.names);


  List<GetCategory> _newsArticles = List<GetCategory>();



  @override
  void initState() {
    super.initState();

    _populateNewsArticles();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarCross().setAppBar(context,buildTranslate(context, 'incident_type_hint'), goback, cross),
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
    String url=Urls.GetCategory+"?"+GetParameters.Screen+"="+Screens.GetItemScreen+"&"+GetParameters.Id+"="+names;
    print(url);

    Webservice().load(GetCategory.all(url)).then((newsArticles) => {
      setState(() => {
        _newsArticles = newsArticles
      })
    });

  }

  action(int index) {
    print(_newsArticles[index].id.toString() +" get id is");
    String url= Urls.GetCategory+"?"+GetParameters.Screen+"="+Screens.CheckItemScreen+"&"+GetParameters.Id+"="+_newsArticles[index].id.toString();

    Webservice().load(CheckCategory.checks(url)).then((checks)  {
      Navigator.pop(context,checks);


    });
   }
}
