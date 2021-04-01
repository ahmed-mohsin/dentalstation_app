import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:clippy_flutter/paralellogram.dart';
import 'package:dentalstation_app/Designs/Decorations/hex.dart';
import 'package:dentalstation_app/Designs/NavBarScreens/Categories/singleSubCategeroyScreen.dart';
import 'package:flutter/material.dart';

import '../../../productsjson.dart';

class Deals extends StatelessWidget {
  var colorList = [
    Colors.amber.shade400,
    Colors.red.shade400,
    Colors.teal.shade400,
    darkTeal
  ];
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            DealsSlider(),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 8,
              scrollDirection: Axis.vertical,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: Colors.grey[300],
                        )),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => SingleSubCatScreen(
                                    catList[index + 1]['name'].toString())));
                      },
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: CachedNetworkImage(
                              imageUrl: productList[index + 1]['image'],
                              //placeholder: (context, url) => CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                              fit: BoxFit.fill,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Parallelogram(
                                  cutLength: 10.0,
                                  edge: Edge.RIGHT,
                                  child: Container(
                                    height: 30,
                                    width: 130,
                                    color: colorList[
                                        Random().nextInt(colorList.length)],
                                    child: Center(
                                        child: Text(
                                      'Up To 50 % OFF',
                                      style:
                                          TextStyle(fontWeight: FontWeight.w500),
                                    )),
                                  )),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 40,
                              color: Colors.black87,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                catList[index + 1]['name'].toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                    fontSize: 18),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DealsSlider extends StatefulWidget {

  const DealsSlider({
    Key key,
  }) : super(key: key);

  @override
  _DealsSliderState createState() => _DealsSliderState();
}

class _DealsSliderState extends State<DealsSlider> {
  var colorList = [
    Colors.amber.shade400,
    Colors.red.shade400,
    Colors.teal.shade400,
    darkTeal
  ];
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          SizedBox(height: 9,),
          CarouselSlider(
            items: images.map((url) {

              return InkWell(onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => SingleSubCatScreen(
                            catList[3]['name'].toString())));
              },
                child: CachedNetworkImage(
                  imageUrl: url,width: MediaQuery.of(context).size.width*.8,
                  //placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) =>
                      Icon(Icons.error),
                  fit: BoxFit.fill,
                ),
              );
            }).toList(),
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images.map((url) {
              int index = images.indexOf(url);
              return Container(
                width: 10.0,
                height: 10.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                      ? colorList[
                  Random().nextInt(colorList.length)]
                      : Color.fromRGBO(0, 0, 0, 0.4),
                ),
              );
            }).toList(),
          ),
        ]
    );

  }
}
