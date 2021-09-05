import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dentalstation_app/Designs/Decorations/ModifiedGridView.dart';
import 'package:dentalstation_app/Designs/Decorations/hex.dart';
import 'package:dentalstation_app/Designs/HomePage/HomePageScreen.dart';
import 'package:dentalstation_app/Designs/NavBarScreens/Categories/CategoriesScreen.dart';
import 'package:dentalstation_app/Designs/NavBarScreens/MainScreen/ItemCard.dart';
import 'package:dentalstation_app/Models/SecondaryCategoryProducts.dart';
import 'package:dentalstation_app/Services/SideCategoriesServices.dart';
import 'package:dentalstation_app/constants/baseUrl.dart';
import 'package:dentalstation_app/productsjson.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class SingleSubCatScreen extends StatefulWidget {
  String subCatName;

  SingleSubCatScreen(this.subCatName);

  @override
  _SingleSubCatScreenState createState() => _SingleSubCatScreenState();
}

class _SingleSubCatScreenState extends State<SingleSubCatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            //decoration: BoxDecoration(color: xx, shape: BoxShape.circle),
              child: CartLogo())
        ],
        backgroundColor: darkTeal,
        title: Text(widget.subCatName),
        centerTitle: true,
      ),
      body: Container(
        color: bac,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleSubCatProducts(),
      ),
    );
  }
}

class SingleSubCatProducts extends ConsumerWidget {


  // saveNewPassword() async {
  //   String serviceUrl = baseUrl + 'showCategory';
  //   //EasyLoading.show(status: 'loading...');
  //   HttpClient httpClient = new HttpClient();
  //   HttpClientRequest request = await httpClient.postUrl(Uri.parse(serviceUrl));
  //   request.headers.set('content-type', 'application/json');
  //   request.headers.set('Authorization',
  //       'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZGVudGFsc3RhdGlvbi5uZXRcL2FwaVwvc2lnbl9pbiIsImlhdCI6MTYzMDI1OTEwMywiZXhwIjoxMDk2MTQ1OTEwMywibmJmIjoxNjMwMjU5MTAzLCJqdGkiOiJWN3JsQ0xkUWtwRnoybXQ3Iiwic3ViIjoyLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.skLFhyAb4QysG8BafVtElLV0057e1ix-Ceyw8xSJeeg');
  //   request.add(utf8.encode(json.encode({
  //     'secondary_category_id': 6,
  //
  //   })));
  //   HttpClientResponse response = await request.close();
  //   String reply = await response.transform(utf8.decoder).join();
  //   print(reply);
  //   httpClient.close();
  //   Map<String, dynamic> resMap = json.decode(reply);
  //   print(resMap['msg'].toString());
  //   if (resMap['code'] == 401) {
  //
  //   }
  //   if (resMap['code'] == 200) {
  //     /*{"key":"success","data":{"user_phone":"1021888173","code":"1234"},"msg":"","code":200}*/
  //
  //
  //     print('ok');
  //     // Navigator.push(
  //     //     context, MaterialPageRoute(builder: (context) => MyHomePage()));
  //   }
  // }

  @override
  Widget build(BuildContext context, watch) {
    final vm = watch(getSecCategoryDataFuture);
    return FutureBuilder<SecondaryCategoryProducts>(
      future:vm.postRequest() ,
     builder: (context,snapshot){
        if (snapshot.hasData) {
          return GridView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data.data.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                height: 240.0),
            itemBuilder: (c, index) {
              return itemCard(index,product:snapshot.data.data[index] ,);
            },
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return Loader();
     },
    );
  }
}
/*snap.*/