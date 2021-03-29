import 'package:cached_network_image/cached_network_image.dart';
import 'package:dentalstation_app/Designs/Decorations/ModifiedGridView.dart';
import 'package:dentalstation_app/Designs/Decorations/hex.dart';
import 'package:dentalstation_app/Designs/NavBarScreens/MainScreen/ItemCard.dart';
import 'package:dentalstation_app/productsjson.dart';
import 'package:flutter/material.dart';

class SingleSubCatScreen extends StatefulWidget {
  String subCatName;

  SingleSubCatScreen(this.subCatName);

  @override
  _SingleSubCatScreenState createState() => _SingleSubCatScreenState();
}

class _SingleSubCatScreenState extends State<SingleSubCatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkTeal,
        title: Text(widget.subCatName),
        centerTitle: true,
      ),
      body: Container(color: bac,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleSubCatProducts(),
      ),
    );
  }
}

class SingleSubCatProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: productList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        height: 240.0),
      itemBuilder: (c,index){
          return itemCard(index);
      },
    );
  }
}

