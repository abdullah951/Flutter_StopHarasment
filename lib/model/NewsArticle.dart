import 'dart:convert';

import 'package:flutter_app/service/webservice.dart';

class NewsArticle {

  final String title;
  final String descrption;
  final String urlToImage;



  NewsArticle({this.title, this.descrption, this.urlToImage});

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
        title: json['title'],
        descrption: json['body'],
        urlToImage: json['id'].toString() ?? 'jbv'
    );
  }


 static Resource<List<NewsArticle>>  all(String url) {

    return Resource(
        url: url,
        parse: (response) {
          final result = json.decode(response.body);

          Iterable list = result;

          return list.map((model) => NewsArticle.fromJson(model)).toList();
        }
    );

  }

}