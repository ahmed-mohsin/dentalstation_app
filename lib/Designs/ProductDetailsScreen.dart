import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dentalstation_app/Designs/Decorations/hex.dart';
import 'package:dentalstation_app/Designs/NavBarScreens/Categories/CategoriesScreen.dart';
import 'package:dentalstation_app/Models/SingleProductMainScreenModel.dart';
import 'package:dentalstation_app/constants/baseUrl.dart';
import 'package:dentalstation_app/productsjson.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:line_icons/line_icon.dart';

// import 'package:flutter_elegant_number_button/flutter_elegant_number_button.dart';
import 'package:line_icons/line_icons.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import 'elegentNumber.dart';

class ProductDetailsScreen extends StatefulWidget {
  String productName;
  int index;

  ProductDetailsScreen(this.productName, this.index);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  // int q;
  bool loading;

  Future<ProductFullData> getProductFullData() async {
    String serviceUrl = baseUrl + 'showProducts';
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(serviceUrl));
    request.headers.set('content-type', 'application/json');
    request.headers.set('Authorization',
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZGVudGFsc3RhdGlvbi5uZXRcL2FwaVwvc2lnbl9pbiIsImlhdCI6MTYzMDI1OTEwMywiZXhwIjoxMDk2MTQ1OTEwMywibmJmIjoxNjMwMjU5MTAzLCJqdGkiOiJWN3JsQ0xkUWtwRnoybXQ3Iiwic3ViIjoyLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.skLFhyAb4QysG8BafVtElLV0057e1ix-Ceyw8xSJeeg');
    request.add(utf8.encode(json.encode({
      'product_id': 5,
    })));
    HttpClientResponse response = await request.close();
    String reply = await response.transform(utf8.decoder).join();
    print(reply);
    httpClient.close();
    Map<String, dynamic> resMap = json.decode(reply);
    print(resMap['msg'].toString());
    if (resMap['code'] == 401) {}
    if (resMap['code'] == 200) {
      /*{"key":"success","data":{"user_phone":"1021888173","code":"1234"},"msg":"","code":200}*/
      setState(() {
        loading = false;
      });
      print('ok');
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => MyHomePage()));
    }
    return ProductFullData.fromJson(json.decode(reply));
  }

  Future<ProductFullData> futureProductData;

  @override
  void initState() {
    super.initState();
    loading = true;
    futureProductData = getProductFullData();
    //getProductFullData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkTeal,
        centerTitle: true,
        title: Text(
          'Details',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: bac,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    loading == true
                        ? LinearProgressIndicator(
                            minHeight: 6,
                            color: darkTeal,
                            backgroundColor: bac,
                          )
                        : Container(),
                    Padding(
                      padding: const EdgeInsets.only(),
                      child: Card(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          height: MediaQuery.of(context).size.height * .35,
                          width: MediaQuery.of(context).size.width,
                          child: Hero(
                            tag: productList[widget.index]['name'],
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  top: 8,
                                  right: 8,
                                  child: Icon(
                                    LineIcons.heart,
                                    color: Colors.grey,
                                  ),
                                ),
                                CachedNetworkImage(
                                  imageUrl: productList[widget.index]['image'],
                                  //placeholder: (context, url) => CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                  width:
                                      MediaQuery.of(context).size.width * .50,
                                  fit: BoxFit.fill,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                productList[2]['name'],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 3),
                              child: Text(
                                productList[2]['title'],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    FutureBuilder<ProductFullData>(
                      future: futureProductData,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount:
                                    snapshot.data.data.voucherProducts.length,
                                itemBuilder: (cx, index) {
                                  return Variations(
                                      snapshot.data.data.voucherProducts[index]
                                          .features,
                                      snapshot.data.data.voucherProducts[index]
                                          .sellPrice,
                                      snapshot.data.data.voucherProducts[index]
                                          .priceAfterOffer,
                                      snapshot.data.data.voucherProducts[index]
                                          .discountPercentage,
                                      snapshot
                                          .data.data.voucherProducts[index].id
                                          .toString());
                                },
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Container(
                                  color: Colors.white,
                                  width: MediaQuery.of(context).size.width,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Description',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Icon(Icons.arrow_forward_ios)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 4),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text('Brand : '),
                                          Text('Waldent'),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('Country of Origin : '),
                                          Text('Egypt'),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('Vendor : '),
                                          Text('Domadent'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else if (snapshot.hasError) {
                          return Text(
                              'Connection error Please Check Your internet Connection');
                        }

                        // By default, show a loading spinner.
                        return Container();
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Container(
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Share product',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              Icon(Icons.arrow_forward_ios)
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Container(
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Ask about the product',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              Icon(Icons.arrow_forward_ios)
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 70,
                    )
                  ],
                ),
              ),
            ),
            // Positioned(
            //     bottom: 0,
            //     child: Container(
            //       color: Colors.white,
            //       width: MediaQuery.of(context).size.width,
            //       height: 60,
            //       child: Row(
            //         children: [
            //           // Padding(
            //           //   padding: const EdgeInsets.symmetric(horizontal: 10),
            //           //   child: Container(
            //           //     width: 50,
            //           //     child: IconButton(
            //           //       onPressed: () {},
            //           //       icon: Icon(LineIcons.whatSApp),
            //           //     ),
            //           //   ),
            //           // ),
            //           // ElegantNumberButton(
            //           //     color: Colors.deepOrange,
            //           //     buttonSizeWidth: 30,
            //           //     buttonSizeHeight: 30,
            //           //     initialValue: 0,
            //           //     minValue: 0,
            //           //     maxValue: 100,
            //           //     onChanged: (val) async {
            //           //       setState(() {});
            //           //     },
            //           //     decimalPlaces: 0),
            //           IconButton(
            //               iconSize: 25,
            //               icon: Icon(
            //                 LineIcons.heart,
            //                 color: Colors.black87,
            //               ),
            //               onPressed: () {
            //                 // Navigator.push(
            //                 //     context,
            //                 //     MaterialPageRoute(
            //                 //         builder: (_) => SwipeFeedPage()));
            //               }),
            //           // Expanded(
            //           //     child: Padding(
            //           //   padding:
            //           //       const EdgeInsets.only(top: 8, bottom: 8, right: 4),
            //           //   child: Container(
            //           //     child: FlatButton(
            //           //       color: Colors.deepOrange,
            //           //       onPressed: () {
            //           //
            //           //       },
            //           //       child: Container(
            //           //         child: Text(
            //           //           'add to cart',
            //           //           style: TextStyle(color: Colors.white),
            //           //         ),
            //           //       ),
            //           //     ),
            //           //   ),
            //           // ))
            //         ],
            //       ),
            //     )),
          ],
        ),
      ),
    );
  }
}

class Variations extends StatefulWidget {
  String features, firstPrice, secPrice, vId;
  var discountValue;

  Variations(this.features, this.firstPrice, this.secPrice, this.discountValue,
      this.vId);

  @override
  _VariationsState createState() => _VariationsState();
}

class _VariationsState extends State<Variations> {
  final RoundedLoadingButtonController _btnController2 =
      RoundedLoadingButtonController();
  int quantity;

  @override
  void initState() {
    super.initState();
    quantity = 0;
  }

  void _doSomething(
      RoundedLoadingButtonController controller, String vID, quantity) async {
    String serviceUrl = baseUrl + 'addToCart';
    HttpClient httpClient = new HttpClient();
    if (quantity > 0) {
      print('tosh');
      HttpClientRequest request =
          await httpClient.postUrl(Uri.parse(serviceUrl));
      request.headers.set('content-type', 'application/json');
      request.headers.set('Authorization',
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZGVudGFsc3RhdGlvbi5uZXRcL2FwaVwvc2lnbl9pbiIsImlhdCI6MTYzMDI1OTEwMywiZXhwIjoxMDk2MTQ1OTEwMywibmJmIjoxNjMwMjU5MTAzLCJqdGkiOiJWN3JsQ0xkUWtwRnoybXQ3Iiwic3ViIjoyLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.skLFhyAb4QysG8BafVtElLV0057e1ix-Ceyw8xSJeeg');
      request.add(utf8.encode(
          json.encode({'voucher_product_id': vID, 'quantity': quantity})));
      HttpClientResponse response = await request.close();
      String reply = await response.transform(utf8.decoder).join();
      print(reply);
      httpClient.close();
      Map<String, dynamic> resMap = json.decode(reply);
      print(resMap['msg'].toString());
      print(resMap['code']);
      if (resMap['code'] == 401) {
        controller.error();
      }
      if (resMap['code'] == 200) {
        /*{"key":"success","data":{"user_phone":"1021888173","code":"1234"},"msg":"","code":200}*/

        controller.success();
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => MyHomePage()));
      }
      // Timer(Duration(seconds: 3), () {
      //   controller.success();
      // });
    } else {
      controller.reset();
      EasyLoading.showToast('اختر كمية صحيحة اكبر من 0',
          toastPosition: EasyLoadingToastPosition.bottom);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: darkTeal),
              borderRadius: BorderRadius.circular(5)),
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.features),
                Row(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${widget.firstPrice}  EGP',
                          style: TextStyle(
                              color: darkTeal,
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            '${widget.secPrice}  EGP',
                            style: TextStyle(
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough),
                          ),
                        ),
                        // Spacer(),
                        Container(
                          decoration:
                              BoxDecoration(color: darkTeal.withAlpha(40)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${(widget.discountValue.round())} % OFF',
                              style: TextStyle(
                                  color: darkTeal,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins',
                                  fontSize: 14),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          ElegantNumberButton(
                              step: 1,
                              color: Colors.deepOrange,
                              buttonSizeWidth: 30,
                              buttonSizeHeight: 40,
                              initialValue: quantity,
                              minValue: 0,
                              maxValue: 100,
                              textStyle: TextStyle(
                                  color: darkTeal,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700),
                              onChanged: (val) async {
                                setState(() {
                                  quantity = val;
                                });
                                print(quantity);
                              },
                              decimalPlaces: 0),
                          RoundedLoadingButton(
                            height: 40,
                            width: 92,
                            color: Colors.deepOrange,
                            successColor: Colors.deepOrange,
                            controller: _btnController2,
                            onPressed: () => _doSomething(
                                _btnController2, widget.vId, quantity),
                            valueColor: Colors.white,
                            borderRadius: 10,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 6, right: 6),
                              child: Text('Add To Cart',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
