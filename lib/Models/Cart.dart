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


// To parse this JSON data, do
//
//     final myCart = myCartFromJson(jsonString);


MyCart myCartFromJson(String str) => MyCart.fromJson(json.decode(str));

String myCartToJson(MyCart data) => json.encode(data.toJson());

class MyCart {
  MyCart({
    this.key,
    this.data,
    this.msg,
    this.code,
  });

  String key;
  List<MyCartData> data;
  String msg;
  int code;

  factory MyCart.fromJson(Map<String, dynamic> json) => MyCart(
    key: json["key"] == null ? null : json["key"],
    data: json["data"] == null ? null : List<MyCartData>.from(json["data"].map((x) => MyCartData.fromJson(x))),
    msg: json["msg"] == null ? null : json["msg"],
    code: json["code"] == null ? null : json["code"],
  );

  Map<String, dynamic> toJson() => {
    "key": key == null ? null : key,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
    "msg": msg == null ? null : msg,
    "code": code == null ? null : code,
  };
}

class MyCartData {
  MyCartData({
    this.id,
    this.userName,
    this.userId,
    this.address,
    this.productsTotalPrice,
    this.shippingPrice,
    this.hasCoupon,
    this.discountAmount,
    this.addValue,
    this.status,
    this.totalPrice,
    this.orderProducts,
  });

  int id;
  String userName;
  String userId;
  Address address;
  String productsTotalPrice;
  String shippingPrice;
  String hasCoupon;
  String discountAmount;
  String addValue;
  String status;
  String totalPrice;
  List<OrderProduct> orderProducts;

  factory MyCartData.fromJson(Map<String, dynamic> json) => MyCartData(
    id: json["id"] == null ? null : json["id"],
    userName: json["user_name"] == null ? null : json["user_name"],
    userId: json["user_id"] == null ? null : json["user_id"],
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
    productsTotalPrice: json["products_total_price"] == null ? null : json["products_total_price"],
    shippingPrice: json["shipping_price"] == null ? null : json["shipping_price"],
    hasCoupon: json["has_coupon"] == null ? null : json["has_coupon"],
    discountAmount: json["discount_amount"] == null ? null : json["discount_amount"],
    addValue: json["add_value"] == null ? null : json["add_value"],
    status: json["status"] == null ? null : json["status"],
    totalPrice: json["total_price"] == null ? null : json["total_price"],
    orderProducts: json["order_products"] == null ? null : List<OrderProduct>.from(json["order_products"].map((x) => OrderProduct.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "user_name": userName == null ? null : userName,
    "user_id": userId == null ? null : userId,
    "address": address == null ? null : address.toJson(),
    "products_total_price": productsTotalPrice == null ? null : productsTotalPrice,
    "shipping_price": shippingPrice == null ? null : shippingPrice,
    "has_coupon": hasCoupon == null ? null : hasCoupon,
    "discount_amount": discountAmount == null ? null : discountAmount,
    "add_value": addValue == null ? null : addValue,
    "status": status == null ? null : status,
    "total_price": totalPrice == null ? null : totalPrice,
    "order_products": orderProducts == null ? null : List<dynamic>.from(orderProducts.map((x) => x.toJson())),
  };
}

class Address {
  Address({
    this.userId,
    this.title,
    this.phone,
    this.mobile,
    this.address,
    this.lat,
    this.lng,
    this.notes,
  });

  String userId;
  String title;
  String phone;
  String mobile;
  String address;
  String lat;
  String lng;
  String notes;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    userId: json["user_id"] == null ? null : json["user_id"],
    title: json["title"] == null ? null : json["title"],
    phone: json["phone"] == null ? null : json["phone"],
    mobile: json["mobile"] == null ? null : json["mobile"],
    address: json["address"] == null ? null : json["address"],
    lat: json["lat"] == null ? null : json["lat"],
    lng: json["lng"] == null ? null : json["lng"],
    notes: json["notes"] == null ? null : json["notes"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId == null ? null : userId,
    "title": title == null ? null : title,
    "phone": phone == null ? null : phone,
    "mobile": mobile == null ? null : mobile,
    "address": address == null ? null : address,
    "lat": lat == null ? null : lat,
    "lng": lng == null ? null : lng,
    "notes": notes == null ? null : notes,
  };
}

class OrderProduct {
  OrderProduct({
    this.id,
    this.orderId,
    this.voucherProduct,
    this.quantity,
    this.singleProductPrice,
    this.quantityProductPrice,
  });

  int id;
  String orderId;
  VoucherProduct voucherProduct;
  String quantity;
  String singleProductPrice;
  String quantityProductPrice;

  factory OrderProduct.fromJson(Map<String, dynamic> json) => OrderProduct(
    id: json["id"] == null ? null : json["id"],
    orderId: json["order_id"] == null ? null : json["order_id"],
    voucherProduct: json["voucher_product"] == null ? null : VoucherProduct.fromJson(json["voucher_product"]),
    quantity: json["quantity"] == null ? null : json["quantity"],
    singleProductPrice: json["single_product_price"] == null ? null : json["single_product_price"],
    quantityProductPrice: json["quantity_product_price"] == null ? null : json["quantity_product_price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "order_id": orderId == null ? null : orderId,
    "voucher_product": voucherProduct == null ? null : voucherProduct.toJson(),
    "quantity": quantity == null ? null : quantity,
    "single_product_price": singleProductPrice == null ? null : singleProductPrice,
    "quantity_product_price": quantityProductPrice == null ? null : quantityProductPrice,
  };
}

class VoucherProduct {
  VoucherProduct({
    this.id,
    this.productId,
    this.productName,
    this.productImage,
  });

  String id;
  int productId;
  String productName;
  String productImage;

  factory VoucherProduct.fromJson(Map<String, dynamic> json) => VoucherProduct(
    id: json["id"] == null ? null : json["id"],
    productId: json["product_id"] == null ? null : json["product_id"],
    productName: json["product_name"] == null ? null : json["product_name"],
    productImage: json["product_image"] == null ? null : json["product_image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "product_id": productId == null ? null : productId,
    "product_name": productName == null ? null : productName,
    "product_image": productImage == null ? null : productImage,
  };
}
