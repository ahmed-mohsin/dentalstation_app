// To parse this JSON data, do
//
//     final myAddress = myAddressFromJson(jsonString);

import 'dart:convert';

MyAddress myAddressFromJson(String str) => MyAddress.fromJson(json.decode(str));

String myAddressToJson(MyAddress data) => json.encode(data.toJson());

class MyAddress {
  MyAddress({
    this.key,
    this.data,
    this.msg,
    this.code,
  });

  String key;
  List<Datum> data;
  String msg;
  int code;

  factory MyAddress.fromJson(Map<String, dynamic> json) => MyAddress(
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
    this.id,
    this.userId,
    this.title,
    this.phone,
    this.mobile,
    this.address,
    this.lat,
    this.lng,
    this.notes,
  });

  int id;
  String userId;
  String title;
  String phone;
  String mobile;
  String address;
  String lat;
  String lng;
  String notes;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] == null ? null : json["id"],
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
    "id": id == null ? null : id,
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
