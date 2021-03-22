import 'package:dentalstation_app/State/stateManger.dart';
import 'package:flutter/material.dart';
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
      appBar: AppBar(
        title: Text('cart'),
      ),
      body: Consumer(
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
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(items[i].itemQuantity.toString()),
                              ),
                              Text(items[i].name),
                              Spacer(),
                              Text(items[i].price.toString()),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
              Divider(),
              Row(
                children: [
                  Text('Sub Total'),
                  Spacer(),
                  Text(
                    '${context.read(cartListProvider).sumCart()}',
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.bold),
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
                        color: Colors.black54, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  Text('Shipping coast'),
                  Spacer(),
                  Text(
                    '${context.read(cartListProvider).sumCart()+35}',
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
