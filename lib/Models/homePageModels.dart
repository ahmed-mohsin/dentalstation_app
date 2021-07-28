// To parse this JSON data, do
//
//     final homePage = homePageFromJson(jsonString);

import 'dart:convert';

HomePage homePageFromJson(String str) => HomePage.fromJson(json.decode(str));

String homePageToJson(HomePage data) => json.encode(data.toJson());

class HomePage {
  HomePage({
    this.key,
    this.data,
    this.msg,
    this.code,
  });

  String key;
  Data data;
  String msg;
  int code;

  factory HomePage.fromJson(Map<String, dynamic> json) => HomePage(
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
    this.offers,
    this.slides,
    this.featuredCategories,
    this.serviceMostOrdered,
    this.recommended,
    this.recently,
  });

  List<dynamic> offers;
  List<Slide> slides;
  List<FeaturedCategory> featuredCategories;
  List<Recently> serviceMostOrdered;
  List<Recently> recommended;
  List<Recently> recently;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    offers: json["offers"] == null ? null : List<dynamic>.from(json["offers"].map((x) => x)),
    slides: json["slides"] == null ? null : List<Slide>.from(json["slides"].map((x) => Slide.fromJson(x))),
    featuredCategories: json["featured_categories"] == null ? null : List<FeaturedCategory>.from(json["featured_categories"].map((x) => FeaturedCategory.fromJson(x))),
    serviceMostOrdered: json["service_most_ordered"] == null ? null : List<Recently>.from(json["service_most_ordered"].map((x) => Recently.fromJson(x))),
    recommended: json["recommended"] == null ? null : List<Recently>.from(json["recommended"].map((x) => Recently.fromJson(x))),
    recently: json["recently"] == null ? null : List<Recently>.from(json["recently"].map((x) => Recently.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "offers": offers == null ? null : List<dynamic>.from(offers.map((x) => x)),
    "slides": slides == null ? null : List<dynamic>.from(slides.map((x) => x.toJson())),
    "featured_categories": featuredCategories == null ? null : List<dynamic>.from(featuredCategories.map((x) => x.toJson())),
    "service_most_ordered": serviceMostOrdered == null ? null : List<dynamic>.from(serviceMostOrdered.map((x) => x.toJson())),
    "recommended": recommended == null ? null : List<dynamic>.from(recommended.map((x) => x.toJson())),
    "recently": recently == null ? null : List<dynamic>.from(recently.map((x) => x.toJson())),
  };
}

class FeaturedCategory {
  FeaturedCategory({
    this.id,
    this.mainCategory,
    this.primaryCategory,
    this.status,
    this.isSpacial,
    this.image,
    this.nameAr,
    this.nameEn,
    this.name,
  });

  int id;
  Category mainCategory;
  Category primaryCategory;
  Status status;
  String isSpacial;
  String image;
  String nameAr;
  String nameEn;
  String name;

  factory FeaturedCategory.fromJson(Map<String, dynamic> json) => FeaturedCategory(
    id: json["id"] == null ? null : json["id"],
    mainCategory: json["mainCategory"] == null ? null : Category.fromJson(json["mainCategory"]),
    primaryCategory: json["primaryCategory"] == null ? null : Category.fromJson(json["primaryCategory"]),
    status: json["status"] == null ? null : statusValues.map[json["status"]],
    isSpacial: json["is_spacial"] == null ? null : json["is_spacial"],
    image: json["image"] == null ? null : json["image"],
    nameAr: json["name_ar"] == null ? null : json["name_ar"],
    nameEn: json["name_en"] == null ? null : json["name_en"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "mainCategory": mainCategory == null ? null : mainCategory.toJson(),
    "primaryCategory": primaryCategory == null ? null : primaryCategory.toJson(),
    "status": status == null ? null : statusValues.reverse[status],
    "is_spacial": isSpacial == null ? null : isSpacial,
    "image": image == null ? null : image,
    "name_ar": nameAr == null ? null : nameAr,
    "name_en": nameEn == null ? null : nameEn,
    "name": name == null ? null : name,
  };
}

class Category {
  Category({
    this.id,
    this.name,
    this.image,
  });

  int id;
  String name;
  String image;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    image: json["image"] == null ? null : json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "image": image == null ? null : image,
  };
}

enum Status { AVAILABLE, UNAVAILABLE }

final statusValues = EnumValues({
  "available": Status.AVAILABLE,
  "unavailable": Status.UNAVAILABLE
});

class Recently {
  Recently({
    this.id,
    this.productType,
    this.country,
    this.vendor,
    this.nameAr,
    this.nameEn,
    this.name,
    this.descriptionAr,
    this.descriptionEn,
    this.description,
    this.price,
    this.unit,
    this.status,
    this.recommendedStatus,
    this.features,
    this.secondCategoriesId,
    this.image,
    this.offerStatus,
    this.priceAfterOffer,
    this.discountAmount,
    this.discountPercentage,
    this.discountToDate,
  });

  int id;
  Country productType;
  Country country;
  Vendor vendor;
  String nameAr;
  String nameEn;
  String name;
  String descriptionAr;
  String descriptionEn;
  String description;
  String price;
  String unit;
  Status status;
  RecommendedStatus recommendedStatus;
  List<Country> features;
  List<SecondCategoriesId> secondCategoriesId;
  String image;
  OfferStatus offerStatus;
  String priceAfterOffer;
  String discountAmount;
  String discountPercentage;
  DateTime discountToDate;

  factory Recently.fromJson(Map<String, dynamic> json) => Recently(
    id: json["id"] == null ? null : json["id"],
    productType: json["product_type"] == null ? null : Country.fromJson(json["product_type"]),
    country: json["country"] == null ? null : Country.fromJson(json["country"]),
    vendor: json["vendor"] == null ? null : Vendor.fromJson(json["vendor"]),
    nameAr: json["name_ar"] == null ? null : json["name_ar"],
    nameEn: json["name_en"] == null ? null : json["name_en"],
    name: json["name"] == null ? null : json["name"],
    descriptionAr: json["description_ar"] == null ? null : json["description_ar"],
    descriptionEn: json["description_en"] == null ? null : json["description_en"],
    description: json["description"] == null ? null : json["description"],
    price: json["price"] == null ? null : json["price"],
    unit: json["unit"] == null ? null : json["unit"],
    status: json["status"] == null ? null : statusValues.map[json["status"]],
    recommendedStatus: json["recommended_status"] == null ? null : recommendedStatusValues.map[json["recommended_status"]],
    features: json["features"] == null ? null : List<Country>.from(json["features"].map((x) => Country.fromJson(x))),
    secondCategoriesId: json["second_categories_id"] == null ? null : List<SecondCategoriesId>.from(json["second_categories_id"].map((x) => SecondCategoriesId.fromJson(x))),
    image: json["image"] == null ? null : json["image"],
    offerStatus: json["offer_status"] == null ? null : offerStatusValues.map[json["offer_status"]],
    priceAfterOffer: json["price_after_offer"] == null ? null : json["price_after_offer"],
    discountAmount: json["discount_amount"] == null ? null : json["discount_amount"],
    discountPercentage: json["discount_percentage"] == null ? null : json["discount_percentage"],
    discountToDate: json["discount_to_date"] == null ? null : DateTime.parse(json["discount_to_date"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "product_type": productType == null ? null : productType.toJson(),
    "country": country == null ? null : country.toJson(),
    "vendor": vendor == null ? null : vendor.toJson(),
    "name_ar": nameAr == null ? null : nameAr,
    "name_en": nameEn == null ? null : nameEn,
    "name": name == null ? null : name,
    "description_ar": descriptionAr == null ? null : descriptionAr,
    "description_en": descriptionEn == null ? null : descriptionEn,
    "description": description == null ? null : description,
    "price": price == null ? null : price,
    "unit": unit == null ? null : unit,
    "status": status == null ? null : statusValues.reverse[status],
    "recommended_status": recommendedStatus == null ? null : recommendedStatusValues.reverse[recommendedStatus],
    "features": features == null ? null : List<dynamic>.from(features.map((x) => x.toJson())),
    "second_categories_id": secondCategoriesId == null ? null : List<dynamic>.from(secondCategoriesId.map((x) => x.toJson())),
    "image": image == null ? null : image,
    "offer_status": offerStatus == null ? null : offerStatusValues.reverse[offerStatus],
    "price_after_offer": priceAfterOffer == null ? null : priceAfterOffer,
    "discount_amount": discountAmount == null ? null : discountAmount,
    "discount_percentage": discountPercentage == null ? null : discountPercentage,
    "discount_to_date": discountToDate == null ? null : "${discountToDate.year.toString().padLeft(4, '0')}-${discountToDate.month.toString().padLeft(2, '0')}-${discountToDate.day.toString().padLeft(2, '0')}",
  };
}

class Country {
  Country({
    this.id,
    this.nameAr,
    this.nameEn,
    this.status,
    this.name,
  });

  int id;
  String nameAr;
  String nameEn;
  Status status;
  String name;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    id: json["id"] == null ? null : json["id"],
    nameAr: json["name_ar"] == null ? null : json["name_ar"],
    nameEn: json["name_en"] == null ? null : json["name_en"],
    status: json["status"] == null ? null : statusValues.map[json["status"]],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name_ar": nameAr == null ? null : nameAr,
    "name_en": nameEn == null ? null : nameEn,
    "status": status == null ? null : statusValues.reverse[status],
    "name": name == null ? null : name,
  };
}

enum OfferStatus { HAS_OFFER, HAS_NOT_OFFER }

final offerStatusValues = EnumValues({
  "has_not_offer": OfferStatus.HAS_NOT_OFFER,
  "has_offer": OfferStatus.HAS_OFFER
});

enum RecommendedStatus { RECOMMENDED, NOT_RECOMMENDED }

final recommendedStatusValues = EnumValues({
  "not_recommended": RecommendedStatus.NOT_RECOMMENDED,
  "recommended": RecommendedStatus.RECOMMENDED
});

class SecondCategoriesId {
  SecondCategoriesId({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory SecondCategoriesId.fromJson(Map<String, dynamic> json) => SecondCategoriesId(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
  };
}

class Vendor {
  Vendor({
    this.id,
    this.name,
    this.phone,
    this.address,
    this.notes,
    this.status,
  });

  int id;
  String name;
  String phone;
  String address;
  String notes;
  Status status;

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    phone: json["phone"] == null ? null : json["phone"],
    address: json["address"] == null ? null : json["address"],
    notes: json["notes"] == null ? null : json["notes"],
    status: json["status"] == null ? null : statusValues.map[json["status"]],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "phone": phone == null ? null : phone,
    "address": address == null ? null : address,
    "notes": notes == null ? null : notes,
    "status": status == null ? null : statusValues.reverse[status],
  };
}

class Slide {
  Slide({
    this.id,
    this.image,
    this.status,
    this.titleAr,
    this.titleEn,
  });

  int id;
  String image;
  Status status;
  String titleAr;
  String titleEn;

  factory Slide.fromJson(Map<String, dynamic> json) => Slide(
    id: json["id"] == null ? null : json["id"],
    image: json["image"] == null ? null : json["image"],
    status: json["status"] == null ? null : statusValues.map[json["status"]],
    titleAr: json["title_ar"] == null ? null : json["title_ar"],
    titleEn: json["title_en"] == null ? null : json["title_en"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "image": image == null ? null : image,
    "status": status == null ? null : statusValues.reverse[status],
    "title_ar": titleAr == null ? null : titleAr,
    "title_en": titleEn == null ? null : titleEn,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
