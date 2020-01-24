import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/constants/colors.dart';
import 'package:flutter_app/constants/strings.dart';
import 'package:flutter_app/constants/urls.dart';
import 'package:flutter_app/model/CheckCategory.dart';
import 'package:flutter_app/model/GetCategory.dart';
import 'package:flutter_app/routes.dart';
import 'package:flutter_app/service/webservice.dart';
import 'package:flutter_app/ui/Incident_type/incident_type2.dart';
import 'package:flutter_app/widgets/app_bar.dart';
import 'package:flutter_app/widgets/app_bar_cross.dart';
import 'package:flutter_app/widgets/incident_type_list.dart';

class IncidentTypeScreen extends StatefulWidget {
  @override
  _IncidentTypeScreenState createState() => _IncidentTypeScreenState();
}

class _IncidentTypeScreenState extends State<IncidentTypeScreen> {
  List<GetCategory> _newsArticles = List<GetCategory>();
  var checkCategory;



  @override
  void initState() {
    super.initState();

    _populateNewsArticles();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarCross().setAppBar(context,Strings.incident_type_hint, goback, cross),
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
    String url=Urls.GetCategory+"?"+GetParameters.Screen+"="+Screens.GetCategoryScreen+"&"+GetParameters.Id+"=0";
    print(url);

    Webservice().load(GetCategory.all(url)).then((newsArticles) => {
      setState(() => {
        _newsArticles = newsArticles
      })
    });

  }

  action(int index)  {
    print(_newsArticles[index].id.toString() +" get id is");
    String url= Urls.GetCategory+"?"+GetParameters.Screen+"="+Screens.CheckCategoryScreen+"&"+GetParameters.Id+"="+_newsArticles[index].id.toString();
   Webservice().load(CheckCategory.checks(url)).then((checks) async {
     if(checks.status){
      checkCategory   = await   Navigator
           .push(context,MaterialPageRoute(
         builder: (context) => IncidentType2Screen(_newsArticles[index].id.toString()),
       ), );
      checkCategory!=null?Navigator.pop(context,checkCategory):print("d");
     }else{
       Navigator.pop(context,checks);
     }

    });
//    Webservice().load( Resource(
//        url:Urls.GetCategory+"?"+GetParameters.Screen+"="+Screens.CheckCategoryScreen+"&"+GetParameters.Id+"="+_newsArticles[index].id.toString() ,
//        parse: (response) {
//          final result = json.decode(response.body);
//          print(result['status']['result'][0]);
//
//
//
//          bool status = result['status']['result'][0]['status']!=0?true:false;
//
//
//
//          return status;
//        }
//    )).then((data) =>{
//
//    if(data){
//      Navigator
//    .push(context,MaterialPageRoute(
//    builder: (context) => IncidentType2Screen(_newsArticles[index].id.toString()),
//    ), )
//  }else{
//      Navigator.pop(context,{})
//    }
//
//    });

  }

}
