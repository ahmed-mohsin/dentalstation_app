import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dentalstation_app/Models/Cart.dart';
import 'package:dentalstation_app/State/stateManger.dart';
import 'package:dentalstation_app/constants/constants.dart';
import 'package:dentalstation_app/productsjson.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:line_icons/line_icons.dart';
import 'package:status_alert/status_alert.dart';
import 'package:share/share.dart';

class itemCard extends StatelessWidget {
  int index;

  itemCard(this.index);

  @override
  Widget build(BuildContext context) {
    final storage = FlutterSecureStorage();

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 315,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: Colors.grey[300],
            )),
        width: MediaQuery.of(context).size.width * .45,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CachedNetworkImage(
                    imageUrl: productList[index]['image'],
                    //placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    height: 165,
                    width: MediaQuery.of(context).size.width * .3,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.redAccent),
                  //height: 24,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 2, right: 2),
                    child: Text(
                      '${(productList[index]['price'] / productList[index]['oldPrice'] * 100).round()}% OFF',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 14),
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
                    Container(
                      child: InkWell(
                        onTap: () async {
                          Cart cartItem = new Cart(
                            id: productList[index]['id'],
                            image: productList[index]['image'],
                            itemQuantity: 1,
                            name: productList[index]['name'],
                            oldPrice: productList[index]['oldPrice'],
                            price: productList[index]['price'],
                          );
                          var cartInstance = context.read(cartListProvider);
                          if (isExisitInCart(cartInstance.state, cartItem)) {
                            print('the item in the cart');
                            context.read(cartListProvider).edit(cartItem, 1);
                            StatusAlert.show(
                              context,
                              duration: Duration(seconds: 2),
                              title: 'ok',
                              subtitle: 'Item Already in your Cart',
                              configuration:
                                  IconConfiguration(icon: Icons.done),
                            );
                          } else {
                            print('new item added to cart');
                            context.read(cartListProvider).add(cartItem);
                            var string = json
                                .encode(context.read(cartListProvider).state);
                            print(string);
                            await storage.write(key: cartKey, value: string);
                            StatusAlert.show(
                              context,
                              duration: Duration(seconds: 2),
                              title: 'ok',
                              subtitle: 'Item successfully added to your cart',
                              configuration:
                                  IconConfiguration(icon: Icons.done),
                            );
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(
                            LineIcons.addToShoppingCart,
                            color: Colors.black87,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                        iconSize: 25,
                        icon: Icon(
                          LineIcons.heart,
                          color: Colors.black87,
                        ),
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (_) => SwipeFeedPage()));
                        }),
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

  _onShare(BuildContext context, text, subject) async {
    final RenderBox box = context.findRenderObject() as RenderBox;
    await Share.share(text,
        subject: subject,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }
}
