import 'dart:convert';
import 'dart:io';

import 'package:dentalstation_app/Designs/Congratulation.dart';
import 'package:dentalstation_app/Designs/Decorations/hex.dart';
import 'package:dentalstation_app/Designs/NavBarScreens/Categories/CategoriesScreen.dart';
import 'package:dentalstation_app/Models/Cart.dart';
import 'package:dentalstation_app/Models/MyAddresses.dart';
import 'package:dentalstation_app/constants/baseUrl.dart';
import 'package:flutter/material.dart';

class CHECKOUT extends StatefulWidget {
  @override
  _CHECKOUTState createState() => _CHECKOUTState();
}

class _CHECKOUTState extends State<CHECKOUT> {
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
        centerTitle: true,
        backgroundColor: darkTeal,
        title: Text(
          'ORDER SUMMARY',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: loading == true
          ? Loader()
          : Container(
              height: MediaQuery.of(context).size.height,
              child: FutureBuilder<MyCart>(
                future: futureProductData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.grey[300],
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Delivery options',
                                    style: TextStyle(
                                        color: darkTeal,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 2, right: 2),
                                  child: Card(child: AddressOptions()),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Shipment Items',
                                    style: TextStyle(
                                        color: darkTeal,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 2, right: 2),
                                  child: Card(
                                      child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ListTile(
                                          trailing: Text('Qty: 3'),
                                          title: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 4),
                                            child: Text('Product name'),
                                          ),
                                          leading: FlutterLogo(),
                                          subtitle: Text('25'),
                                        ),
                                        Divider(),
                                        ListTile(
                                          trailing: Text('Qty: 1'),
                                          title: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 4),
                                            child:
                                                Text('Product namesghg hghg'),
                                          ),
                                          leading: FlutterLogo(),
                                          subtitle: Text('25'),
                                        ),
                                        Divider(),
                                        ListTile(
                                          trailing: Text('Qty: 2'),
                                          title: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 4),
                                            child: Text('Product name'),
                                          ),
                                          leading: FlutterLogo(),
                                          subtitle: Text('25'),
                                        ),
                                        Divider(),
                                        ListTile(
                                          trailing: Text('Qty: 2'),
                                          title: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 4),
                                            child: Text('Product name'),
                                          ),
                                          leading: FlutterLogo(),
                                          subtitle: Text('25'),
                                        ),
                                        Divider(),
                                        ListTile(
                                          trailing: Text('Qty: 2'),
                                          title: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 4),
                                            child: Text('Product name'),
                                          ),
                                          leading: FlutterLogo(),
                                          subtitle: Text('25'),
                                        )
                                      ],
                                    ),
                                  )),
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.only(left: 2, right: 2),
                                //   child: Card(
                                //       child: Container(
                                //         width: MediaQuery.of(context).size.width,
                                //         child: Column(
                                //           mainAxisAlignment: MainAxisAlignment.start,
                                //           crossAxisAlignment: CrossAxisAlignment.start,
                                //           children: [
                                //             Padding(
                                //               padding: const EdgeInsets.all(8.0),
                                //               child: Row(
                                //                 children: [
                                //                   Text('Get A Coupon ?'),
                                //                   Padding(
                                //                     padding:
                                //                     const EdgeInsets.only(left: 4, right: 4),
                                //                     child: Text(
                                //                       'Enter Here',
                                //                       style: TextStyle(color: darkTeal),
                                //                     ),
                                //                   ),
                                //                 ],
                                //               ),
                                //             )
                                //           ],
                                //         ),
                                //       )),
                                // ),
                                Container(
                                  color: Colors.white,
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
                                              '20',
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
                                              '35',
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
                                              '5655',
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: 0,
                            child: InkWell(
                              onTap: () async {
                                String serviceUrl = baseUrl + 'checkoutOrder';
                                HttpClient httpClient = new HttpClient();
                                HttpClientRequest request = await httpClient
                                    .postUrl(Uri.parse(serviceUrl));
                                request.add(utf8.encode(json.encode({
                                  'order_id': "1",
                                  'address_id': '1',
                                })));
                                //request.headers.set('content-type', 'application/json');
                                request.headers.set('Authorization',
                                    'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZGVudGFsc3RhdGlvbi5uZXRcL2FwaVwvc2lnbl9pbiIsImlhdCI6MTYzMDI1OTEwMywiZXhwIjoxMDk2MTQ1OTEwMywibmJmIjoxNjMwMjU5MTAzLCJqdGkiOiJWN3JsQ0xkUWtwRnoybXQ3Iiwic3ViIjoyLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.skLFhyAb4QysG8BafVtElLV0057e1ix-Ceyw8xSJeeg');
                                HttpClientResponse response =
                                    await request.close();
                                String reply = await response
                                    .transform(utf8.decoder)
                                    .join();
                                print(reply);
                                httpClient.close();
                                Map<String, dynamic> resMap =
                                    json.decode(reply);
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
                                // Navigator.push(context, MaterialPageRoute(builder: (cx){
                                //   return Congratulation();
                                // }));
                              },
                              child: Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width,
                                color: darkTeal,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                      child: Text(
                                    'Place Order',
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ),
                              ),
                            )),
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
class AddressOptions extends StatefulWidget {
  @override
  AddressOptionsState createState() {
    return AddressOptionsState();
  }
}

class AddressOptionsState extends State<AddressOptions> {
  int value;
  bool loading;

  Future<MyAddress> getAllAddress() async {
    String serviceUrl = baseUrl + 'allAddress';
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
    return MyAddress.fromJson(json.decode(reply));
  }

  Future<MyAddress> futureAddressesData;

  @override
  void initState() {
    super.initState();
    //loading = true;
    futureAddressesData = getAllAddress();
    //getProductFullData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MyAddress>(
      future: futureAddressesData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return snapshot.data.data.length == 0 ? Padding(
            padding: const EdgeInsets.only(left: 2, right: 2),
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: 70,
                child: Center(child: Text('Add New Address First'))),
          ):ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return RadioListTile(
                value: index,
                groupValue: value,
                onChanged: (ind) => setState(() => value = ind),
                title: Text(snapshot.data.data[index].title),
              );
            },
            itemCount: snapshot.data.data.length,
          );
        } else if (snapshot.hasError) {
          return Text('Connection error Please Check Your internet Connection');
        }

        // By default, show a loading spinner.
        return Padding(
          padding: const EdgeInsets.only(left: 2, right: 2),
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: 70,
              child: Center(child: CircularProgressIndicator())),
        );
      },
    );
  }
}

/**/
