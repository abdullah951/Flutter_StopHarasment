import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter_app/service/webservice.dart';

class MapDatas {

  final String locality, throughput, featurename;
  var lat, lng;

  MapDatas(this.locality, this.throughput, this.featurename, this.lat, this.lng);

  MapDatas.fromJson(Map<String, dynamic> json)
      : locality = json['locality'],
        throughput = json['throughput'],
        featurename = json['featurename'],
        lat = json['lat'],
        lng = json['lng'];

  Map<String, dynamic> toJson() =>
      {
        'locality': locality,
        'throughput': throughput,
        'featurename': featurename,
        'lat': lat,
        'lng': lng
      };

}