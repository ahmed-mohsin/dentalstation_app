import 'dart:convert';
import 'dart:io';

import 'package:dentalstation_app/Designs/Cart/CHECKOUT.dart';
import 'package:dentalstation_app/Designs/Decorations/hex.dart';
import 'package:dentalstation_app/Designs/NavBarScreens/Categories/CategoriesScreen.dart';
import 'package:dentalstation_app/Models/Cart.dart';
import 'package:dentalstation_app/State/stateManger.dart';
import 'package:dentalstation_app/constants/baseUrl.dart';
import 'package:dentalstation_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elegant_number_button/flutter_elegant_number_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final storage = FlutterSecureStorage();
  bool loading;

  Future<MyCart> getProductFullData() async {
    String serviceUrl = baseUrl + 'myCart';
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.getUrl(Uri.parse(serviceUrl));
    request.headers.set('content-type', 'application/json');
    request.headers.set('Authorization',
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZGVudGFsc3RhdGlvbi5uZXRcL2FwaVwvc2lnbl9pbiIsImlhdCI6MTYzMDI1OTEwMywiZXhwIjoxMDk2MTQ1OTEwMywibmJmIjoxNjMwMjU5MTAzLCJqdGkiOiJWN3JsQ0xkUWtwRnoybXQ3Iiwic3ViIjoyLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.skLFhyAb4QysG8BafVtElLV0057e1ix-Ceyw8xSJeeg');
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
    return MyCart.fromJson(json.decode(reply));
  }

  Future<MyCart> futureProductData;

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
        title: Text('My Cart'),
      ),
      body: loading == true
          ? Loader()
          : Container(
              height: MediaQuery.of(context).size.height,
              child: FutureBuilder<MyCart>(
                future: futureProductData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return snapshot.data.data.length == 0
                        ? Text('empty cart')
                        : Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                loading == true
                                    ? LinearProgressIndicator(
                                        minHeight: 6,
                                        color: darkTeal,
                                        backgroundColor: bac,
                                      )
                                    : Container(),
                                ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: snapshot
                                            .data.data[0].orderProducts.length,
                                        itemBuilder: (cx, i) {
                                          return CartElementWidget(snapshot
                                              .data.data[0].orderProducts[i]);
                                        }),
                                Divider(
                                  thickness: 3,
                                ),
                                SizedBox(
                                  height: 120,
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            //height: 250,
                            color: Colors.yellow,
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text('Sub Total'),
                                      Spacer(),
                                      Text(
                                        snapshot.data.data[0].productsTotalPrice
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('Shipping coast'),
                                      Spacer(),
                                      Text(
                                        snapshot.data.data[0].shippingPrice ==
                                                ''
                                            ? 'free shipping'
                                            : snapshot
                                                .data.data[0].shippingPrice,
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('Total'),
                                      Spacer(),
                                      Text(
                                        snapshot.data.data[0].totalPrice
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (c) {
                                          return CHECKOUT(snapshot.data.data[0].id.toString());
                                        }));
                                      },
                                      child: Container(
                                        height: 50,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            color: darkTeal,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(
                                            child: Text(
                                          'CHECKOUT',
                                          style: TextStyle(color: Colors.white),
                                        )),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
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
            ),
    );
  }
}

/**/
class CartElementWidget extends StatefulWidget {
  OrderProduct product;

  CartElementWidget(this.product);

  @override
  _CartElementWidgetState createState() => _CartElementWidgetState();
}

class _CartElementWidgetState extends State<CartElementWidget> {
  int q;

  @override
  void initState() {
    super.initState();
    q = int.parse(widget.product.quantity);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  widget.product.voucherProduct.productImage,
                  height: 70,
                  width: 70,
                  fit: BoxFit.fill,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.voucherProduct.productName,
                    overflow: TextOverflow.fade,
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    'Product Features',
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                        fontSize: 12),
                  ),
                ],
              ),
              Spacer(),
              Column(
                children: [
                  q != int.parse(widget.product.quantity)
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.product.quantity,
                            style:
                                TextStyle(color: Colors.orange, fontSize: 12),
                          ),
                        )
                      : Container(),
                  ElegantNumberButton(
                      step: 1,
                      initialValue: q,
                      minValue: 0,
                      color: darkTeal,
                      maxValue: 10000000,
                      onChanged: (val) async {
                        setState(() {
                          q = val;
                        });
                        print(q);
                      },
                      decimalPlaces: 0),
                  q != int.parse(widget.product.quantity)
                      ? Container(
                          decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Update Quantity",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ))
                      : Container()
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
