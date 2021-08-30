import 'dart:convert';

import 'package:dentalstation_app/Models/SideCategoriesModel.dart';
import 'package:dentalstation_app/constants/baseUrl.dart';
import 'package:http/http.dart' as http;

Future<SideCategories> fetchSideCategories() async {
  final response = await http.get(Uri.parse(baseUrl + 'sideCategories'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return SideCategories.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
