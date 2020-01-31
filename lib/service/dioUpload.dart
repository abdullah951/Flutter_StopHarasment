import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';
import 'package:flutter_app/constants/urls.dart';
import 'package:flutter_app/main.dart';


class dioupload{
  Dio dio;
  Response response;




void showProgress(received, total) {
  if (total != -1) {
    print((received / total * 100).toStringAsFixed(0) + "%");
  }
}

Future<FormData> FormData1(List<File> file,id,comment,email,name) async {
  print(file.length);
  var files2=[];
  for(int i=0;i<file.length;i++){
   files2.add(await MultipartFile.fromFile(file[i].path, filename: file[i].toString()));
  }


  return FormData.fromMap({
    "id":id,
    "comment":comment,
    "email":email,
    "name":name,
    "files":files2

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

  Future<String> FileUpload(List<File> file,String id,String comment,String email,String name) async {
  main();
  print(file.length);
  response = await dio.post(
    //"/upload",
      Urls.fileupload,
      data: await FormData1(file,id,comment,email,name),

  onSendProgress: (received, total) {
  if (total != -1) {
  print((received / total * 100).toStringAsFixed(0) + "%");
  }
  },
  );
  print(response.data);
  return response.data['result'].toString();

}
 Future<String> AddIncident(var maps) async {
    main();

    Map<String, dynamic>   newMap = Map<String, dynamic>.from(maps);
    print(newMap);
    response = await dio.post(
      //"/upload",
      Urls.add_incident,
      data: newMap,

      onSendProgress: (received, total) {
        if (total != -1) {
          print((received / total * 100).toStringAsFixed(0) + "%");
        }
      },
    );
    print(response);

    return response.data['status']['result'].toString();

  }

/// FormData will create readable "multipart/form-data" streams.
/// It can be used to submit forms and file uploads to http server.
  main() async {

  dio = Dio();
  dio.options.baseUrl = Urls.fileupload;
  dio.interceptors.add(LogInterceptor());
  //dio.interceptors.add(LogInterceptor(requestBody: true));
  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      (HttpClient client) {

    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
  };






  //var t = await FormData3();


//  response = await dio.post(
//    //"/upload",
//    "http://192.168.100.12:8082/api/file/upload",
//    data: await FormData1(file),
//
//    onSendProgress: (received, total) {
//      if (total != -1) {
//        print((received / total * 100).toStringAsFixed(0) + "%");
//      }
//    },
//  );

}
}