import 'package:flutter/material.dart';
//usage example
//systemNavigationBarColor: HexColor('#E03757'),
class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
Color xx = HexColor('#E03757');
//#1C5983
Color darkTeal = HexColor('#1C5983');