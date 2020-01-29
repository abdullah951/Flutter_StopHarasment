import 'package:flutter/material.dart';
import 'package:flutter_app/ui/Incident_type/incident_type.dart';
import 'package:flutter_app/ui/Incident_type/incident_type2.dart';
import 'package:flutter_app/ui/map/map.dart';
import 'package:flutter_app/ui/report_incident1/report_incident1.dart';
import 'package:flutter_app/ui/report_incident2/report_incident2.dart';

import 'ui/home/home.dart';
import 'ui/splash/splash.dart';

class Routes {

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String map = '/map';
  static const String report_incident1 = '/report_incident1';
  static const String report_incident2 = '/report_incident2';
  static const String incident_type = '/incident_type';
  static const String incident_type2 = '/incident_type2';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    home: (BuildContext context) => HomeScreen(),
    map: (BuildContext context) => MapScreen(),
    report_incident1: (BuildContext context) => ReportIncidentScreen1(),

    incident_type: (BuildContext context) => IncidentTypeScreen(),

  };

}



