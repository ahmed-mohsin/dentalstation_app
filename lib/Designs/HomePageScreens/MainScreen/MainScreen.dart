import 'dart:convert';
import 'package:dentalstation_app/Designs/Decorations/hex.dart';
import 'package:dentalstation_app/Models/Cart.dart';
import 'package:dentalstation_app/State/stateManger.dart';
import 'package:dentalstation_app/constants/constants.dart';
import 'package:dentalstation_app/productsjson.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:line_icons/line_icons.dart';
import 'package:dentalstation_app/State/stateManger.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final orientation = MediaQuery.of(context).orientation;
    return Container(
      color: bac,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Best Sellers',
                  style: TextStyle(color: Colors.black87),
                ),
                IconButton(
                    icon: Icon(
                      Icons.more_horiz_rounded,
                      color: Colors.black87,
                    ),
                    onPressed: () {})
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * .35,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return CartCard(index);
              },
            ),
          )
        ],
      ),
    );
  }
}

class CartCard extends StatelessWidget {
  int index;

  CartCard(this.index);

  @override
  Widget build(BuildContext context) {
    final storage = FlutterSecureStorage();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(2),
            border: Border.all(
              color: Colors.grey[300],
            )),
        width: MediaQuery.of(context).size.width * .4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.network(
                      productList[index]['image'],
                      height: MediaQuery.of(context).size.height * .2,
                      width: MediaQuery.of(context).size.width * .3,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.red),
                    width: 64,
                    height: 17,
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Text(
                        '55% OFF',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      productList[index]['name'],
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  // Container(
                  //   width: MediaQuery.of(context).size.width,
                  //   child: Text(
                  //     productList[index]['title'],
                  //     maxLines: 1,
                  //     style: TextStyle(color: Colors.grey),
                  //     overflow: TextOverflow.ellipsis,
                  //   ),
                  // ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          productList[index]['price'].toString(),
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          productList[index]['oldPrice'].toString(),
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 30,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.shopping_cart,
                          color: Colors.black87,
                        ),
                        onPressed: () async {
                          Cart cartItem = new Cart(
                            id: productList[index]['id'],
                            image: productList[index]['image'],
                            itemQuantity: 1,
                            name: productList[index]['name'],
                            oldPrice: productList[index]['oldPrice'],
                            price: productList[index]['price'],
                          );
                          var cartInstance = context.read(cartListProvider);
                          if (isExisitInCart(cartInstance.state, cartItem))
                            context.read(cartListProvider).edit(cartItem, 1);
                          else {
                            context.read(cartListProvider).add(cartItem);
                            var string = json
                                .encode(context.read(cartListProvider).state);
                            print(string);
                            await storage.write(key: cartKey, value: string);
                          }
                        }),
                    IconButton(
                        icon: Icon(
                          LineIcons.heart,
                          color: Colors.black87,
                        ),
                        onPressed: null),
                    IconButton(
                        icon: Icon(
                          LineIcons.share,
                          color: Colors.black87,
                        ),
                        onPressed: null)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  bool isExisitInCart(List<Cart> state, Cart cartItem) {
    bool found = false;
    state.forEach((element) {
      if (element.id == cartItem.id) found = true;
    });
    return found;
  }
}
