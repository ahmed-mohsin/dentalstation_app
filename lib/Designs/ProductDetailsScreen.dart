import 'package:cached_network_image/cached_network_image.dart';
import 'package:dentalstation_app/Designs/Decorations/hex.dart';
import 'package:dentalstation_app/productsjson.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elegant_number_button/flutter_elegant_number_button.dart';
import 'package:line_icons/line_icons.dart';

class ProductDetailsScreen extends StatefulWidget {
  String productName;
  int index;

  ProductDetailsScreen(this.productName, this.index);

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
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(),
                      child: Card(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          height: MediaQuery.of(context).size.height * .35,
                          width: MediaQuery.of(context).size.width,
                          child: Hero(
                            tag: productList[widget.index]['name'],
                            child: CachedNetworkImage(
                              imageUrl: productList[widget.index]['image'],
                              //placeholder: (context, url) => CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                              width: MediaQuery.of(context).size.width * .50,
                              fit: BoxFit.fill,
                            ),
                          ),
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
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  productList[2]['name'],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 3),
                                child: Text(
                                  productList[2]['title'],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
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
                                ],
                              )
                            ],
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Container(
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Description',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              Icon(Icons.arrow_forward_ios)
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 4),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text('Brand : '),
                                Text('Waldent'),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Country of Origin : '),
                                Text('Egypt'),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Vendor : '),
                                Text('Domadent'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Container(
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Share product',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              Icon(Icons.arrow_forward_ios)
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Container(
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Ask about the product',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              Icon(Icons.arrow_forward_ios)
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 70,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: Row(
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 10),
                      //   child: Container(
                      //     width: 50,
                      //     child: IconButton(
                      //       onPressed: () {},
                      //       icon: Icon(LineIcons.whatSApp),
                      //     ),
                      //   ),
                      // ),
                      ElegantNumberButton(
                          color: Colors.deepOrange,
                          buttonSizeWidth: 30,
                          buttonSizeHeight: 30,
                          initialValue: 0,
                          minValue: 0,
                          maxValue: 100,
                          onChanged: (val) async {
                            setState(() {});
                          },
                          decimalPlaces: 0),
                      Expanded(
                          child: Padding(
                        padding:
                            const EdgeInsets.only(top: 8, bottom: 8, right: 4),
                        child: Container(
                          child: FlatButton(
                            color: Colors.deepOrange,
                            onPressed: () {
                              print('ghgh');
                            },
                            child: Container(
                              child: Text(
                                'add to cart',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ))
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
