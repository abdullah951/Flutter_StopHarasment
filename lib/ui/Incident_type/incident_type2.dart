import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/constants/colors.dart';
import 'package:flutter_app/model/NewsArticle.dart';

import 'package:flutter_app/routes.dart';
import 'package:flutter_app/service/webservice.dart';
import 'package:flutter_app/widgets/app_bar.dart';
import 'package:flutter_app/widgets/app_bar_cross.dart';
import 'package:flutter_app/widgets/incident_type_item.dart';
import 'package:flutter_app/widgets/incident_type_item_divider.dart';
import 'package:flutter_app/widgets/incident_type_list.dart';
import 'package:http/http.dart' as http;

class IncidentType2Screen extends StatefulWidget {
  final String names;
  IncidentType2Screen(this.names);


  @override
  _IncidentType2ScreenState createState() => _IncidentType2ScreenState(names);
}

class _IncidentType2ScreenState extends State<IncidentType2Screen> {
  String names;

  _IncidentType2ScreenState(this.names);


  List<NewsArticle> _newsArticles = List<NewsArticle>();



  @override
  void initState() {
    super.initState();

    _populateNewsArticles();
  }


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
      appBar: MyAppBarCross().setAppBar(context, names, goback, cross),
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

    Webservice().load(NewsArticle.all("https://jsonplaceholder.typicode.com/posts")).then((newsArticles) => {
      setState(() => {
        _newsArticles = newsArticles
      })
    });

  }

  action(int index) {
    print(_newsArticles[index].title +" get title is");
  }
}
