
import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:io';
import 'package:path/path.dart';

class Resource<T> {
  final String url;
  T Function(Response response) parse;


  Resource({this.url,this.parse});
}

class Webservice {

  Future<T> load<T>(Resource<T> resource) async {

    final response = await http.get(resource.url);
    print(resource.url);
    if(response.statusCode == 200) {

      return resource.parse(response);
    } else {
      throw Exception('Failed to load data!');
    }
  }


}