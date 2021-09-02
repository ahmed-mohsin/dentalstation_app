// To parse this JSON data, do
//
//     final productFullData = productFullDataFromJson(jsonString);

import 'dart:convert';

ProductFullData productFullDataFromJson(String str) => ProductFullData.fromJson(json.decode(str));

String productFullDataToJson(ProductFullData data) => json.encode(data.toJson());

class ProductFullData {
  ProductFullData({
    this.key,
    this.data,
    this.msg,
    this.code,
  });

  String key;
  Data data;
  String msg;
  int code;

  factory ProductFullData.fromJson(Map<String, dynamic> json) => ProductFullData(
    key: json["key"] == null ? null : json["key"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    msg: json["msg"] == null ? null : json["msg"],
    code: json["code"] == null ? null : json["code"],
  );

  Map<String, dynamic> toJson() => {
    "key": key == null ? null : key,
    "data": data == null ? null : data.toJson(),
    "msg": msg == null ? null : msg,
    "code": code == null ? null : code,
  };
}

class Data {
  Data({
    this.productId,
    this.voucherProducts,
  });

  ProductId productId;
  List<VoucherProduct> voucherProducts;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    productId: json["product_id"] == null ? null : ProductId.fromJson(json["product_id"]),
    voucherProducts: json["voucherProducts"] == null ? null : List<VoucherProduct>.from(json["voucherProducts"].map((x) => VoucherProduct.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId == null ? null : productId.toJson(),
    "voucherProducts": voucherProducts == null ? null : List<dynamic>.from(voucherProducts.map((x) => x.toJson())),
  };
}

class ProductId {
  ProductId({
    this.id,
    this.image,
    this.name,
  });

  int id;
  String image;
  String name;

  factory ProductId.fromJson(Map<String, dynamic> json) => ProductId(
    id: json["id"] == null ? null : json["id"],
    image: json["image"] == null ? null : json["image"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "image": image == null ? null : image,
    "name": name == null ? null : name,
  };
}

class VoucherProduct {
  VoucherProduct({
    this.id,
    this.sellPrice,
    this.priceAfterOffer,
    this.discountPercentage,
    this.features,
  });

  int id;
  String sellPrice;
  String priceAfterOffer;
  double discountPercentage;
  String features;

  factory VoucherProduct.fromJson(Map<String, dynamic> json) => VoucherProduct(
    id: json["id"] == null ? null : json["id"],
    sellPrice: json["sell_price"] == null ? null : json["sell_price"],
    priceAfterOffer: json["price_after_offer"] == null ? null : json["price_after_offer"],
    discountPercentage: json["discount_percentage"] == null ? null : json["discount_percentage"].toDouble(),
    features: json["features"] == null ? null : json["features"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "sell_price": sellPrice == null ? null : sellPrice,
    "price_after_offer": priceAfterOffer == null ? null : priceAfterOffer,
    "discount_percentage": discountPercentage == null ? null : discountPercentage,
    "features": features == null ? null : features,
  };
}
