
import 'dart:convert';

List<Product> productModelFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productModelToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    this.id,
    this.name,
    this.description,
    this.image,
    this.category,
    this.title,
    this.price,
    this.oldPrice,
  });

  String id;
  String name;
  String description;
  String image;
  String category;
  String title;
  int price;
  int oldPrice;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    image: json["image"],
    category: json["category"],
    title: json["title"],
    price: json["price"],
    oldPrice: json["oldPrice"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "image": image,
    "category": category,
    "title": title,
    "price": price,
    "oldPrice": oldPrice,
  };
}
