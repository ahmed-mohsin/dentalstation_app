import 'dart:convert';

import 'package:dentalstation_app/Models/ProductModel.dart';
import 'package:dentalstation_app/State/stateManger.dart';
import 'package:dentalstation_app/constants/constants.dart';
import 'package:dentalstation_app/productsjson.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:status_alert/status_alert.dart';

class Cart extends Product {
  int itemQuantity;

  Cart({id, name, price, oldPrice, image,  this.itemQuantity})
      : super(
            id: id, name: name, price: price, oldPrice: oldPrice, image: image);

  factory Cart.fromJson(Map<String, dynamic> json) {
    final product = Product.fromJson(json);
    final itemQuantity = json["itemQuantity"];
    return Cart(
        id: product.id,
        name: product.name,
        price: product.price,
        oldPrice: product.oldPrice,
        image: product.image,
        itemQuantity: itemQuantity);
  }
  Map<String,dynamic>toJson(){
    final Map<String,dynamic> data=Map<String,dynamic>();
    data['id']=this.id;
    data['name']=this.name;
    data['price']=this.price;
    data['oldPrice']=this.oldPrice;
    data['image']=this.image;
    data['itemQuantity']=this.itemQuantity;
    return data;
  }
}


class CartList extends StateNotifier<List<Cart>>{

  CartList(List<Cart> state) : super(state??[]);

  void addAll(List<Cart> carts){
    state.addAll(carts);
  }

  void add(Cart cart){
    state=[
      ...state,
      cart
    ];

  }

  void edit(Cart cart,int itemQuantity){
    state = [
      for(final cartItem in state)
        if(cartItem.id==cart.id)
          Cart(
              id: cart.id,
              name: cart.name,
              price: cart.price,
              image: cart.image,
              itemQuantity: cartItem.itemQuantity + itemQuantity
          )
        else cartItem,
    ];

  }

  void remove(Cart removeItem){
    state=state.where((cart) => cart.id !=removeItem.id).toList();
  }
  void removeAll(){
    state=[];
  }
  double sumCart(){
    double result=0;
    for(final cartItem in state)
      result+=(cartItem.itemQuantity*cartItem.price);
    return result;
  }
}

Future addToCart(BuildContext context, FlutterSecureStorage storage,itemQuantity,index) async {
  Cart cartItem = new Cart(
    id: productList[index]['id'],
    image: productList[index]['image'],
    itemQuantity: itemQuantity,
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
}

bool isExisitInCart(List<Cart> state, Cart cartItem) {
  bool found = false;
  state.forEach((element) {
    if (element.id == cartItem.id) found = true;
  });
  return found;
}