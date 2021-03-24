import 'dart:convert';
import 'package:dentalstation_app/Models/Cart.dart';
import 'package:dentalstation_app/State/stateManger.dart';
import 'package:dentalstation_app/constants/constants.dart';
import 'package:dentalstation_app/productsjson.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:line_icons/line_icons.dart';

class itemCard extends StatelessWidget {
  int index;

  itemCard(this.index);

  @override
  Widget build(BuildContext context) {
    final storage = FlutterSecureStorage();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 315,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: Colors.grey[300],
            )),
        width: MediaQuery.of(context).size.width * .4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.network(
                    productList[index]['image'],
                    height: 165,
                    width: MediaQuery.of(context).size.width * .3,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.redAccent),
                  width: 64,
                  height: 24,
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Text(
                      '${(productList[index]['price']/productList[index]['oldPrice']*100).round()}% OFF',
                      style: TextStyle(color: Colors.white,fontFamily: 'Poppins',fontSize: 14),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 4, bottom: 2),
                    child: Text(
                      productList[index]['name'],
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Poppins'),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, top: 2, bottom: 2),
                  child: Text(
                    productList[index]['oldPrice'].toString() + ' EGP',
                    style: TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, top: 2, bottom: 2),
                  child: Text(
                    productList[index]['price'].toString() + ' EGP',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Container(
              height: 18,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        iconSize: 25,
                        icon: Icon(
                          LineIcons.addToShoppingCart,
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
                        iconSize: 25,
                        icon: Icon(
                          LineIcons.heart,
                          color: Colors.black87,
                        ),
                        onPressed: null),
                    IconButton(
                        iconSize: 25,
                        icon: Icon(
                          LineIcons.shareSquare,
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
