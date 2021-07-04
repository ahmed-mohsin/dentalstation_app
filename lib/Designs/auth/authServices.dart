import 'dart:convert';
import 'dart:io';

import 'package:dentalstation_app/Designs/Decorations/hex.dart';
import 'package:dentalstation_app/Designs/HomePage/HomePageScreen.dart';
import 'package:dentalstation_app/Designs/auth/PinCodeVerificationScreen.dart';
import 'package:dentalstation_app/constants/baseUrl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:animated_dialog_box/animated_dialog_box.dart';

registerNewUserService(
    context, phone, userName, userMail, passWord, confirmedPassword) async {
  String serviceUrl = baseUrl + 'client_sign_up';
  EasyLoading.show(status: 'loading...');
  HttpClient httpClient = new HttpClient();
  HttpClientRequest request = await httpClient.postUrl(Uri.parse(serviceUrl));
  request.headers.set('content-type', 'application/json');
  request.add(utf8.encode(json.encode({
    'phone': phone,
    'name': userName,
    'lang': 'ar',
    'email': userMail,
    'password': passWord,
    'password_confirmation': confirmedPassword,
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
            builder: (context) => PinCodeVerificationScreen(
                resMap['data']['user_phone'],)));
  }
}

activateNewUserService(context, phone, code) async {
  String serviceUrl = baseUrl + 'user_activation';
  EasyLoading.show(status: 'loading...');
  HttpClient httpClient = new HttpClient();
  HttpClientRequest request = await httpClient.postUrl(Uri.parse(serviceUrl));
  request.headers.set('content-type', 'application/json');
  request.add(utf8.encode(json.encode({
    'phone': phone,
    'active_code': code,
    'device_id': 'arfddffddffdf',
    'device_type': 'android',
  })));
  HttpClientResponse response = await request.close();
  String reply = await response.transform(utf8.decoder).join();
  print(reply);
  httpClient.close();
  Map<String, dynamic> resMap = json.decode(reply);
  print(resMap['code'].toString());
  print(resMap['msg'].toString());
  if (resMap['code'] == 401) {
    EasyLoading.showToast('حدث خطأ اثناء التفعيل تأكد من كود التفعيل',toastPosition: EasyLoadingToastPosition.bottom);
  }
  if (resMap['code'] == 200) {
    /*{"key":"success","data":{"user_phone":"1021888173","code":"1234"},"msg":"","code":200}*/
    EasyLoading.showSuccess('تمت عملية تفعيل التسجيل بنجاح');
    print(resMap['data']['name']);
    EasyLoading.showSuccess('تم تفعيل الحساب بنجاح');
    print(resMap['data']['name']);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }
}

resendSMSService(context, phone) async {
  String serviceUrl = baseUrl + 'resend_code';
  EasyLoading.show(status: 'loading...');
  HttpClient httpClient = new HttpClient();
  HttpClientRequest request = await httpClient.postUrl(Uri.parse(serviceUrl));
  request.headers.set('content-type', 'application/json');
  request.add(utf8.encode(json.encode({
    'phone': phone,
    'type': "activation",
  })));
  HttpClientResponse response = await request.close();
  String reply = await response.transform(utf8.decoder).join();
  print(reply);
  httpClient.close();
  Map<String, dynamic> resMap = json.decode(reply);
  print(resMap['msg'].toString());
  if (resMap['code'] == 401) {
    EasyLoading.dismiss();
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
    EasyLoading.dismiss();

    Scaffold.of(context).showSnackBar(SnackBar(
        backgroundColor: darkTeal,
        content: Directionality(
            textDirection: TextDirection.rtl,
            child: Text(
              'تم ارسال رقم التفعيل في رسالة لرقم موبايلك',
              style: TextStyle(color: Colors.white),
            ))));
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PinCodeVerificationScreen(
                phone)));
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }
}
loginService(context, phone, passWord) async {
  String serviceUrl = baseUrl + 'sign_in';
  EasyLoading.show(status: 'loading...');
  HttpClient httpClient = new HttpClient();
  HttpClientRequest request = await httpClient.postUrl(Uri.parse(serviceUrl));
  request.headers.set('content-type', 'application/json');
  request.add(utf8.encode(json.encode({
    'phone': phone,
    'password': passWord,
    'device_id': 'arfddffddffdf',
    'device_type': 'android',
  })));
  HttpClientResponse response = await request.close();
  String reply = await response.transform(utf8.decoder).join();
  print(reply);
  httpClient.close();
  Map<String, dynamic> resMap = json.decode(reply);
  print(resMap['code'].toString());
  print(resMap['msg'].toString());
  print(response.statusCode);
  if (resMap['key'] == 'success') {
    /*{"key":"success","data":{"user_phone":"1021888173","code":"1234"},"msg":"","code":200}*/
    EasyLoading.showSuccess('تم تسجيل الدخول بنجاح');
    print(resMap['data']['name']);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }
  if (resMap['key'] == 'needActive') {
    EasyLoading.dismiss();
    // Scaffold.of(context).showSnackBar(SnackBar(
    //     backgroundColor: darkTeal,
    //     content: Directionality(
    //         textDirection: TextDirection.rtl,
    //         child: Text(
    //           resMap['msg'].toString(),
    //           style: TextStyle(color: Colors.white),
    //         ))));
    await animated_dialog_box.showInOutDailog(
        title: Center(child: Text("حساب لم يتم تفعيله",style: TextStyle(color: darkTeal,fontFamily: 'CeraRound'),)),
        // IF YOU WANT TO ADD
        context: context,
        firstButton: MaterialButton(
          // FIRST BUTTON IS REQUIRED
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          color: Colors.white,
          child: Text('لاحقا'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        secondButton: MaterialButton(
          // OPTIONAL BUTTON
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          color: darkTeal,
          child: Text(
            'تفعيل الآن',
            style: TextStyle(color: Colors.white,fontFamily: 'CeraRound'),
          ),
          onPressed: () {
            resendSMSService(context, phone);
          },
        ),
        icon: Icon(
          Icons.info_outline,
          color: Colors.transparent,
          size: 0,
        ),
        // IF YOU WANT TO ADD ICON
        yourWidget: Container(
          child: Text(
            'هل تريد تفعيل الحساب عن طريق رسالة ستصلك علي هاتفك الآن ؟',textDirection: TextDirection.rtl,
            style: TextStyle(fontFamily: 'CeraRound', color: Colors.black),
          ),
        ));
  }
  if (resMap['key'] == 'fail' ||
      resMap['key'] == 'blocked' ||
      resMap['key'] == 'exit' ||
      resMap['key'] == 'needAdminActivation') {
    EasyLoading.showError('فشلت عملية تسجيل الدخول');
    Scaffold.of(context).showSnackBar(SnackBar(
        backgroundColor: darkTeal,
        content: Directionality(
            textDirection: TextDirection.rtl,
            child: Text(
              resMap['msg'].toString(),
              style: TextStyle(color: Colors.white),
            ))));
  }
}
