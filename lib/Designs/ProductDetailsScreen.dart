import 'package:cached_network_image/cached_network_image.dart';
import 'package:dentalstation_app/Designs/Decorations/hex.dart';
import 'package:dentalstation_app/productsjson.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class ProductDetailsScreen extends StatefulWidget {
  String productName;

  ProductDetailsScreen(this.productName);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkTeal,
        centerTitle: true,
        title: Text(
          'Details',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: bac,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        height: MediaQuery.of(context).size.height * .35,
                        width: MediaQuery.of(context).size.width,
                        child: CachedNetworkImage(
                          imageUrl: productList[2]['image'],
                          //placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                          width: MediaQuery.of(context).size.width * .50,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(productList[2]['name']),
                              Text(productList[2]['title']),
                              Row(
                                children: [
                                  Text('Brand : '),
                                  Text('Waldent'),
                                ],
                              ),
                              Text(
                                productList[2]['price'].toString() + ' EGP',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Text(
                                    productList[2]['oldPrice'].toString() +
                                        ' EGP',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        decoration: TextDecoration.lineThrough),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: darkTeal.withAlpha(40)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '${((productList[2]['oldPrice'] - productList[2]['price']) / productList[2]['oldPrice'] * 100).round()}% OFF',
                                          style: TextStyle(
                                              color: darkTeal,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Poppins',
                                              fontSize: 14),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  IconButton(
                                      iconSize: 25,
                                      icon: Icon(
                                        LineIcons.heart,
                                        color: Colors.black87,
                                      ),
                                      onPressed: () {
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (_) => SwipeFeedPage()));
                                      }),
                                  IconButton(
                                      iconSize: 25,
                                      icon: Icon(
                                        LineIcons.shareSquare,
                                        color: Colors.black87,
                                      ),
                                      onPressed: null)
                                ],
                              )
                            ],
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Container(
                        color: Colors.white,
                        height: 300,
                        width: 50,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  color: Colors.orange,
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                )),
          ],
        ),
      ),
    );
  }
}
