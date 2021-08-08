// To parse this JSON data, do
//
//     final cities = citiesFromJson(jsonString);

import 'dart:convert';

List<Cities> citiesFromJson(String str) => List<Cities>.from(json.decode(str).map((x) => Cities.fromJson(x)));

String citiesToJson(List<Cities> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cities {
  Cities({
    this.type,
    this.version,
    this.comment,
    this.name,
    this.database,
    this.data,
  });

  String type;
  String version;
  String comment;
  String name;
  String database;
  List<Datum> data;

  factory Cities.fromJson(Map<String, dynamic> json) => Cities(
    type: json["type"] == null ? null : json["type"],
    version: json["version"] == null ? null : json["version"],
    comment: json["comment"] == null ? null : json["comment"],
    name: json["name"] == null ? null : json["name"],
    database: json["database"] == null ? null : json["database"],
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "type": type == null ? null : type,
    "version": version == null ? null : version,
    "comment": comment == null ? null : comment,
    "name": name == null ? null : name,
    "database": database == null ? null : database,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.governorateNameAr,
    this.governorateNameEn,
    this.cities,
  });

  String id;
  String governorateNameAr;
  String governorateNameEn;
  List<City> cities;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] == null ? null : json["id"],
    governorateNameAr: json["governorate_name_ar"] == null ? null : json["governorate_name_ar"],
    governorateNameEn: json["governorate_name_en"] == null ? null : json["governorate_name_en"],
    cities: json["cities"] == null ? null : List<City>.from(json["cities"].map((x) => City.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "governorate_name_ar": governorateNameAr == null ? null : governorateNameAr,
    "governorate_name_en": governorateNameEn == null ? null : governorateNameEn,
    "cities": cities == null ? null : List<dynamic>.from(cities.map((x) => x.toJson())),
  };
}

class City {
  City({
    this.id,
    this.governorateId,
    this.cityNameAr,
    this.cityNameEn,
  });

  String id;
  String governorateId;
  String cityNameAr;
  String cityNameEn;

  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json["id"] == null ? null : json["id"],
    governorateId: json["governorate_id"] == null ? null : json["governorate_id"],
    cityNameAr: json["city_name_ar"] == null ? null : json["city_name_ar"],
    cityNameEn: json["city_name_en"] == null ? null : json["city_name_en"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "governorate_id": governorateId == null ? null : governorateId,
    "city_name_ar": cityNameAr == null ? null : cityNameAr,
    "city_name_en": cityNameEn == null ? null : cityNameEn,
  };
}
