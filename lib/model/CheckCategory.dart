import 'dart:convert';

import 'package:flutter_app/constants/urls.dart';
import 'package:flutter_app/service/webservice.dart';

class CheckCategory {

  final String name;
  final int id;
  final bool status;


  CheckCategory({this.status,this.name,this.id});


  factory CheckCategory.fromJson(Map<String, dynamic> json) {
    return CheckCategory(
        name: json['str'],
        id: json['item_id'],
        status: json[GetParameters.Status]!=0?true:false
    );
  }


 static Resource<CheckCategory>  checks(String url) {

    return Resource(
        url: url,
        parse: (response) {
          final result = json.decode(response.body);
          print(result);


          Map<String, dynamic> maps = result['status']['result'][0];

          return  CheckCategory.fromJson(maps);
        }
    );



  }

}