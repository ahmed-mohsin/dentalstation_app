
import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  ProductModel({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.title,
    this.price,
    this.oldPrice,
  });

  String id;
  String name;
  String description;
  String url;
  String category;
  String title;
  int price;
  int oldPrice;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    url: json["url"],
    category: json["category"],
    title: json["title"],
    price: json["price"],
    oldPrice: json["oldPrice"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "url": url,
    "category": category,
    "title": title,
    "price": price,
    "oldPrice": oldPrice,
  };
}
