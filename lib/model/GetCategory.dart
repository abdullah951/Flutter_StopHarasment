import 'dart:convert';

import 'package:flutter_app/constants/urls.dart';
import 'package:flutter_app/service/webservice.dart';

class GetCategory {

  final String name;
  final int id;





  GetCategory({this.name, this.id});

  factory GetCategory.fromJson(Map<String, dynamic> json) {
    return GetCategory(
        name: json[GetParameters.Name],
        id: json[GetParameters.Id]
    );
  }


 static Resource<List<GetCategory>>  all(String url) {

    return Resource(
        url: url,
        parse: (response) {
          final result = json.decode(response.body);
          print(result);


          Iterable list = result['status']['result'];

          return list.map((model) => GetCategory.fromJson(model)).toList();
        }
    );



  }

}