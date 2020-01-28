import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';


class dioupload{



void showProgress(received, total) {
  if (total != -1) {
    print((received / total * 100).toStringAsFixed(0) + "%");
  }
}

Future<FormData> FormData1() async {
  print("called");

  return FormData.fromMap({
    "name": "wendux",
    "age": 25,
    "id":"119567",
    "file":
    await MultipartFile.fromFile("assets/images/ic_add_circle.png", filename: "ic_add.png"),
//    "files": [
//      await MultipartFile.fromFile("./example/upload.txt",
//          filename: "upload.txt"),
//      MultipartFile.fromFileSync("./example/upload.txt",
//          filename: "upload.txt"),
//    ]
  });
}

Future<FormData> FormData2() async {
  var formData = FormData();
  formData.fields..add(MapEntry("name", "wendux"))..add(MapEntry("age", "25"));

  formData.files.add(MapEntry(
    "file",
    await MultipartFile.fromFile("./example/xx.png", filename: "xx.png"),
  ));

  formData.files.addAll([
    MapEntry(
      "files[]",
      await MultipartFile.fromFile("./example/upload.txt",
          filename: "upload.txt"),
    ),
    MapEntry(
      "files[]",
      MultipartFile.fromFileSync("./example/upload.txt",
          filename: "upload.txt"),
    ),
  ]);
  return formData;
}

Future<FormData> FormData3() async {
  return FormData.fromMap({
    "file": await MultipartFile.fromFile("./example/upload.txt",
        filename: "uploadfile"),
  });
}

/// FormData will create readable "multipart/form-data" streams.
/// It can be used to submit forms and file uploads to http server.
main() async {
  var dio = Dio();
  dio.options.baseUrl = "http://192.168.10.5:8082/api/file/upload";
  dio.interceptors.add(LogInterceptor());
  //dio.interceptors.add(LogInterceptor(requestBody: true));
  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      (HttpClient client) {
    client.findProxy = (uri) {
      //proxy all request to localhost:8888
      return "PROXY localhost:8888";
    };
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
  };
  Response response;


  var formData1 = await FormData1();
  var bytes2 = await formData1.readAsBytes();


  var t = await FormData3();
  print(utf8.decode(await t.readAsBytes()));

  response = await dio.post(
    //"/upload",
    "http://localhost:3000/upload",
    data: await FormData1(),
    onSendProgress: (received, total) {
      if (total != -1) {
        print((received / total * 100).toStringAsFixed(0) + "%");
      }
    },
  );
  print(response);
}
}