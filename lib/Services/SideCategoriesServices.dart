import 'dart:convert';
import 'dart:io';

import 'package:dentalstation_app/Models/SecondaryCategoryProducts.dart';
import 'package:dentalstation_app/Models/SideCategoriesModel.dart';
import 'package:dentalstation_app/constants/baseUrl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

Future<SideCategories> fetchSideCategories() async {
  final response = await http.get(Uri.parse(baseUrl + 'sideCategories'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return SideCategories.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

final getSecCategoryDataFuture =
    ChangeNotifierProvider((ref) => GetSecondaryCategoryData());

class GetSecondaryCategoryData extends ChangeNotifier {
// List<Products> productsList=[];
  Future<SecondaryCategoryProducts> postRequest() async {
    String serviceUrl = baseUrl + 'showCategory';
    //EasyLoading.show(status: 'loading...');
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(serviceUrl));
    request.headers.set('content-type', 'application/json');
    request.headers.set('Authorization',
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZGVudGFsc3RhdGlvbi5uZXRcL2FwaVwvc2lnbl9pbiIsImlhdCI6MTYzMDI1OTEwMywiZXhwIjoxMDk2MTQ1OTEwMywibmJmIjoxNjMwMjU5MTAzLCJqdGkiOiJWN3JsQ0xkUWtwRnoybXQ3Iiwic3ViIjoyLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.skLFhyAb4QysG8BafVtElLV0057e1ix-Ceyw8xSJeeg');
    request.add(utf8.encode(json.encode({
      'secondary_category_id': 6,

    })));
    HttpClientResponse response = await request.close();
    String reply = await response.transform(utf8.decoder).join();
    print(reply);
    httpClient.close();
    Map<String, dynamic> resMap = json.decode(reply);
    print(resMap['msg'].toString());
    if (resMap['code'] == 401) {

    }
    if (resMap['code'] == 200) {
      /*{"key":"success","data":{"user_phone":"1021888173","code":"1234"},"msg":"","code":200}*/


      print('ok');
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => MyHomePage()));
    }
    return  SecondaryCategoryProducts.fromJson(json.decode(reply));
  }
}

Future<SecondaryCategoryProducts> fetchAlbum() async {
  final response = await http.post(
      Uri.parse('https://dentalstation.net/api/showCategory'),
      headers: {
        'Authorization':
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZGVudGFsc3RhdGlvbi5uZXRcL2FwaVwvc2lnbl9pbiIsImlhdCI6MTYzMDI1OTEwMywiZXhwIjoxMDk2MTQ1OTEwMywibmJmIjoxNjMwMjU5MTAzLCJqdGkiOiJWN3JsQ0xkUWtwRnoybXQ3Iiwic3ViIjoyLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.skLFhyAb4QysG8BafVtElLV0057e1ix-Ceyw8xSJeeg'
      },
      body: {
        'secondary_category_id': '6'
      });

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return SecondaryCategoryProducts.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}