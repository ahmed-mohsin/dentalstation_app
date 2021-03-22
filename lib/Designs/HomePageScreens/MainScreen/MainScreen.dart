import 'dart:convert';

import 'package:dentalstation_app/Models/Cart.dart';
import 'package:dentalstation_app/State/stateManger.dart';
import 'package:dentalstation_app/productsjson.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:line_icons/line_icons.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final storage = FlutterSecureStorage();

  String cartKey  ='cartKey';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
      String cartSave = await  storage.read(key: cartKey);
      if(cartSave != null && cartSave.isEmpty){
        final listCart = json.decode(cartSave) as List <dynamic>;
        final listCartParsed = listCart.map((e) => Cart.fromJson(e)).toList() ;
        if(listCartParsed !=null && listCartParsed.length>0)
          context.read(cartListProvider).state =listCartParsed ;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // final orientation = MediaQuery.of(context).orientation;
    return Container(
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
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return new Card(
                  elevation: 9,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Image.network(
                                  productList[index]['url'],
                                  height: 75,
                                  width: 100,
                                  fit: BoxFit.fill,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(
                                    productList[index]['name'],overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(color: Colors.black),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(
                                    productList[index]['title'],
                                    maxLines: 1,
                                    style: TextStyle(color: Colors.grey),overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        productList[index]['price'].toString(),
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        productList[index]['oldPrice']
                                            .toString(),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                          oldPrice: productList[index]
                                              ['oldPrice'],
                                          price: productList[index]['price'],
                                        );
                                        var cartInstance =
                                            context.read(cartListProvider);
                                        if (isExisitInCart(
                                            cartInstance.state, cartItem))
                                          context
                                              .read(cartListProvider)
                                              .edit(cartItem, 1);
                                        else {
                                          context
                                              .read(cartListProvider)
                                              .add(cartItem);
                                          var string = json.encode(context
                                              .read(cartListProvider)
                                              .state);
                                          await storage.write(key:cartKey,value:string);
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
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  bool isExisitInCart(List<Cart> state, Cart cartItem) {
    bool found = false ;
    state.forEach((element) {
      if(element.id == cartItem.id)
        found = true ;
    });
    return  found ;
  }
}
/*new GridTile(
                  footer: new Text(
                    productList[index]['title'],
                    style: TextStyle(color: Colors.grey),
                  ),
                  child: SizedBox(
                      height: 30,width: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: new Image.network(
                          productList[index]['url'],
                          height: 30,
                          //fit: BoxFit.fitHeight,
                        ),
                      )),
                  header: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      productList[index]['name'],
                      style: TextStyle(color: Colors.black),
                    ),
                  ), //just for testing, will fill with image later
                )*/
