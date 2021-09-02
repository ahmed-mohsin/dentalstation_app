import 'dart:convert';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dentalstation_app/Models/Cart.dart';
import 'package:dentalstation_app/Models/SecondaryCategoryProducts.dart';
import 'package:dentalstation_app/Models/SingleProductMainScreenModel.dart';
import 'package:dentalstation_app/State/stateManger.dart';
import 'package:dentalstation_app/constants/baseUrl.dart';
import 'package:dentalstation_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:line_icons/line_icons.dart';
import 'package:status_alert/status_alert.dart';
import 'package:share/share.dart';

import '../../ProductDetailsScreen.dart';

class itemCard extends StatelessWidget {
  int index;
  Product product ;
  itemCard(this.index, {this.product});

  @override
  Widget build(BuildContext context) {

    final storage = FlutterSecureStorage();
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 325,
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
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ProductDetailsScreen(
                            product.productName, index)));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Hero(tag:product.productName ,
                      child: CachedNetworkImage(
                        imageUrl: product.productImage,
                        //placeholder: (context, url) => CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        height: 95,
                        width: MediaQuery.of(context).size.width * .3,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.redAccent),
                    //height: 24,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 2, right: 2),
                      child: Text(
                        '${product.discountPercentage}% OFF',
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
                        product.productName,
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
                       'x EGP',
                      style: TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 2, bottom: 2),
                    child: Text(
                      product.sellPrice + ' EGP',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: InkWell(
                        onTap: () async {
                          await addToCart(context, storage, 1, index);
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
