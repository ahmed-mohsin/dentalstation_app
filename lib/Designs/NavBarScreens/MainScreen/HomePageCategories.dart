import 'package:cached_network_image/cached_network_image.dart';
import 'package:dentalstation_app/productsjson.dart';
import 'package:flutter/material.dart';

class HomePageCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: ListView(physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(
            width: 2,
          ),
          Container(
            width: 170,
            height: 200,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: Colors.grey[300],
                )),
            child: Column(
              children: [
                Text(
                  catList[0]['name'].toString(),
                  style: TextStyle(color: Colors.black,fontFamily: 'Poppins',fontSize: 15),
                ),
                CachedNetworkImage(
                  imageUrl: catList[0]['image'],
                  //placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  height: 165,
                  fit: BoxFit.fill,
                )
              ],
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 8,
            scrollDirection: Axis.horizontal,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  width: 170,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: Colors.grey[300],
                      )),child: Column(children: [
                  Text(
                    catList[index+1]['name'].toString(),
                    style: TextStyle(color: Colors.black,fontFamily: 'Poppins',fontSize: 10),
                  ),
                  CachedNetworkImage(
                    imageUrl: productList[index+1]['image'],
                    //placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    height: 70,
                    fit: BoxFit.fill,
                  )
                ],),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}