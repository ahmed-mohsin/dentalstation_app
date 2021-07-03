import 'dart:convert';
import 'dart:io';

import 'package:dentalstation_app/Designs/Decorations/hex.dart';
import 'package:dentalstation_app/Designs/auth/PinCodeVerificationScreen.dart';
import 'package:dentalstation_app/constants/baseUrl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

registerNewUser(context) async {
  String serviceUrl = baseUrl+'client_sign_up';
  EasyLoading.show(status: 'loading...');

  HttpClient httpClient = new HttpClient();
  HttpClientRequest request = await httpClient
      .postUrl(Uri.parse(serviceUrl));
  request.headers.set('content-type', 'application/json');
  request.add(utf8.encode(json.encode({
    'phone': '01021888174',
    'name': 'ahmed',
    'lang': 'ar',
    'email': '5ph.ahmedmohsin@gmail.com',
    'password': '1234567',
    'password_confirmation': '1234567',
    'terms_conditions': 'accept',
  })));
  HttpClientResponse response = await request.close();
  String reply = await response.transform(utf8.decoder).join();
  print(reply);
  httpClient.close();
  Map<String, dynamic> resMap = json.decode(reply);
  print(resMap['code'].toString());
  print(resMap['msg'].toString());
  if (resMap['code'] == 401) {
    EasyLoading.showError('فشلت عملية التسجيل');
    Scaffold.of(context).showSnackBar(SnackBar(
        backgroundColor: darkTeal,
        content: Directionality(
            textDirection: TextDirection.rtl,
            child: Text(
              resMap['msg'].toString(),
              style: TextStyle(color: Colors.white),
            ))));
  }
  if (resMap['code'] == 200) {
    /*{"key":"success","data":{"user_phone":"1021888173","code":"1234"},"msg":"","code":200}*/
    EasyLoading.showSuccess('تمت عملية التسجيل بنجاح');
    print(resMap['data']['user_phone']);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                PinCodeVerificationScreen(
                    resMap['data']['user_phone'],resMap['data']['code'])));
  }
}
