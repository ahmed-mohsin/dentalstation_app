import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dentalstation_app/productsjson.dart';
import 'package:flutter/material.dart';

class TopBrand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 130,
      child: ListView.builder(physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: brandList.length,
          itemBuilder: (c, index) {
            return Padding(
              padding: const EdgeInsets.all(7.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    children: [
                      Text(
                        brandList[index]['name'].toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontSize: 15),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: CachedNetworkImage(
                            imageUrl: brandList[index]['image'],
                            //placeholder: (context, url) => CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                            height: 60,
                            fit: BoxFit.fill,
                          )),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
