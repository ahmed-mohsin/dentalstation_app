import 'dart:convert';

import 'package:dentalstation_app/Designs/CHECKOUT.dart';
import 'package:dentalstation_app/Designs/Decorations/hex.dart';
import 'package:dentalstation_app/State/stateManger.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: darkTeal,
        title: Text('cart'),
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              height: 150,color: Colors.white,
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
                          '${context.read(cartListProvider).sumCart()}',
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
                          '${context.read(cartListProvider).sumCart() + 35}',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: InkWell(onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (c){
                              return CHECKOUT();
                            }));
                          },
                            child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: darkTeal,
                      child: Center(child: Text('CHECKOUT',style: TextStyle(color: Colors.white),)),
                    ),
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            child: Consumer(
              builder: (b, watch, v) {
                var items = watch(cartListProvider.state);
                return Column(
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: items.length,
                        itemBuilder: (cx, i) {
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
                                        items[i].image,
                                        height: 70,
                                        width: 70,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          items[i].name,
                                          overflow: TextOverflow.fade,
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        ElegantNumberButton(
                                            initialValue: items[i].itemQuantity,
                                            minValue: 0,color: darkTeal,
                                            maxValue: 100,
                                            onChanged: (val) async {
                                              items[i].itemQuantity = val;
                                              var s = json.encode(items);
                                              print(s);
                                              await storage.write(
                                                  key: cartKey,
                                                  value: json.encode(items));
                                              setState(() {});
                                            },
                                            decimalPlaces: 0),
                                      ],
                                    ),
                                    Spacer(),
                                    Text(items[i].price.toString()),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                    Divider(
                      thickness: 3,
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
