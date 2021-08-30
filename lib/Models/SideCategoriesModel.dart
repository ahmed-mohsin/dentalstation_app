// To parse this JSON data, do
//
//     final sideCategories = sideCategoriesFromJson(jsonString);

import 'dart:convert';

SideCategories sideCategoriesFromJson(String str) => SideCategories.fromJson(json.decode(str));

String sideCategoriesToJson(SideCategories data) => json.encode(data.toJson());

class SideCategories {
  SideCategories({
    this.key,
    this.data,
    this.msg,
    this.code,
  });

  String key;
  List<Datum> data;
  String msg;
  int code;

  factory SideCategories.fromJson(Map<String, dynamic> json) => SideCategories(
    key: json["key"] == null ? null : json["key"],
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
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

class Datum {
  Datum({
    this.mainCategoryId,
    this.mainCategoryName,
    this.primaryCategory,
  });

  int mainCategoryId;
  String mainCategoryName;
  List<AryCategory> primaryCategory;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    mainCategoryId: json["main_category_id"] == null ? null : json["main_category_id"],
    mainCategoryName: json["main_category_name"] == null ? null : json["main_category_name"],
    primaryCategory: json["primary_category"] == null ? null : List<AryCategory>.from(json["primary_category"].map((x) => AryCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "main_category_id": mainCategoryId == null ? null : mainCategoryId,
    "main_category_name": mainCategoryName == null ? null : mainCategoryName,
    "primary_category": primaryCategory == null ? null : List<dynamic>.from(primaryCategory.map((x) => x.toJson())),
  };
}

class AryCategory {
  AryCategory({
    this.id,
    this.image,
    this.name,
    this.secondaryCategory,
  });

  int id;
  String image;
  String name;
  List<AryCategory> secondaryCategory;

  factory AryCategory.fromJson(Map<String, dynamic> json) => AryCategory(
    id: json["id"] == null ? null : json["id"],
    image: json["image"] == null ? null : json["image"],
    name: json["name"] == null ? null : json["name"],
    secondaryCategory: json["secondary_category"] == null ? null : List<AryCategory>.from(json["secondary_category"].map((x) => AryCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "image": image == null ? null : image,
    "name": name == null ? null : name,
    "secondary_category": secondaryCategory == null ? null : List<dynamic>.from(secondaryCategory.map((x) => x.toJson())),
  };
}
