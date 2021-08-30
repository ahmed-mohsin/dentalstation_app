// To parse this JSON data, do
//
//     final secondaryCategoryProducts = secondaryCategoryProductsFromJson(jsonString);

import 'dart:convert';

SecondaryCategoryProducts secondaryCategoryProductsFromJson(String str) => SecondaryCategoryProducts.fromJson(json.decode(str));

String secondaryCategoryProductsToJson(SecondaryCategoryProducts data) => json.encode(data.toJson());

class SecondaryCategoryProducts {
  SecondaryCategoryProducts({
    this.key,
    this.data,
    this.msg,
    this.code,
  });

  String key;
  List<Product> data;
  String msg;
  int code;

  factory SecondaryCategoryProducts.fromJson(Map<String, dynamic> json) => SecondaryCategoryProducts(
    key: json["key"] == null ? null : json["key"],
    data: json["data"] == null ? null : List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
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

class Product {
  Product({
    this.id,
    this.productName,
    this.productId,
    this.productImage,
    this.vendorId,
    this.quantity,
    this.purchasePrice,
    this.sellPrice,
    this.expireDate,
    this.offerStatus,
    this.discountStartData,
    this.discountEndData,
    this.priceAfterOffer,
    this.discountPercentage,
  });

  int id;
  String productName;
  int productId;
  String productImage;
  int vendorId;
  String quantity;
  String purchasePrice;
  String sellPrice;
  DateTime expireDate;
  String offerStatus;
  DateTime discountStartData;
  String discountEndData;
  String priceAfterOffer;
  int discountPercentage;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"] == null ? null : json["id"],
    productName: json["product_name"] == null ? null : json["product_name"],
    productId: json["product_id"] == null ? null : json["product_id"],
    productImage: json["product_image"] == null ? null : json["product_image"],
    vendorId: json["vendor_id"] == null ? null : json["vendor_id"],
    quantity: json["quantity"] == null ? null : json["quantity"],
    purchasePrice: json["purchase_price"] == null ? null : json["purchase_price"],
    sellPrice: json["sell_price"] == null ? null : json["sell_price"],
    expireDate: json["expire_date"] == null ? null : DateTime.parse(json["expire_date"]),
    offerStatus: json["offer_status"] == null ? null : json["offer_status"],
    discountStartData: json["discount_start_data"] == null ? null : DateTime.parse(json["discount_start_data"]),
    discountEndData: json["discount_end_data"] == null ? null : json["discount_end_data"],
    priceAfterOffer: json["price_after_offer"] == null ? null : json["price_after_offer"],
    discountPercentage: json["discount_percentage"] == null ? null : json["discount_percentage"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "product_name": productName == null ? null : productName,
    "product_id": productId == null ? null : productId,
    "product_image": productImage == null ? null : productImage,
    "vendor_id": vendorId == null ? null : vendorId,
    "quantity": quantity == null ? null : quantity,
    "purchase_price": purchasePrice == null ? null : purchasePrice,
    "sell_price": sellPrice == null ? null : sellPrice,
    "expire_date": expireDate == null ? null : "${expireDate.year.toString().padLeft(4, '0')}-${expireDate.month.toString().padLeft(2, '0')}-${expireDate.day.toString().padLeft(2, '0')}",
    "offer_status": offerStatus == null ? null : offerStatus,
    "discount_start_data": discountStartData == null ? null : "${discountStartData.year.toString().padLeft(4, '0')}-${discountStartData.month.toString().padLeft(2, '0')}-${discountStartData.day.toString().padLeft(2, '0')}",
    "discount_end_data": discountEndData == null ? null : discountEndData,
    "price_after_offer": priceAfterOffer == null ? null : priceAfterOffer,
    "discount_percentage": discountPercentage == null ? null : discountPercentage,
  };
}
