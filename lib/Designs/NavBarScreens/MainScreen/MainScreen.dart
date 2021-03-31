import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dentalstation_app/Designs/Decorations/hex.dart';
import 'package:dentalstation_app/Designs/NavBarScreens/MainScreen/HomePageCategories.dart';
import 'package:dentalstation_app/Designs/NavBarScreens/MainScreen/ItemCard.dart';
import 'package:dentalstation_app/Designs/NavBarScreens/MainScreen/TopBrands.dart';
import 'package:dentalstation_app/Designs/NavBarScreens/MainScreen/swipper.dart';
import 'package:dentalstation_app/Designs/ProductDetailsScreen.dart';

import 'package:dentalstation_app/productsjson.dart';
import 'package:flutter/material.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bac,
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: MediaQuery
          .of(context)
          .size
          .height,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            CarouselSlider.builder(
              itemCount: images.length,
              options: CarouselOptions(
                height: 150,
                autoPlay: true,
                aspectRatio: 1.0,
                enlargeCenterPage: false,
              ),
              itemBuilder: (context, index, realIdx) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                      child: CachedNetworkImage(
                          imageUrl: images[index],
                          fit: BoxFit.fill,
                          height: 150,
                          width: MediaQuery.of(context).size.width)),
                );
              },
            ),
            Container(color: Colors.amber,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'WOW Offers',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Poppins', fontWeight: FontWeight
                              .w700,
                              fontSize: 14),
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.more_horiz_rounded,
                              color: darkTeal,
                            ),
                            onPressed: () {})
                      ],
                    ),
                  ),
                  SwipperSection(),
                  Container(height: 10,)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Featured Categories',
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.more_horiz_rounded,
                        color: darkTeal,
                      ),
                      onPressed: () {})
                ],
              ),
            ),
            HomePageCategories(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Best Sellers',
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.more_horiz_rounded,
                        color: darkTeal,
                      ),
                      onPressed: () {})
                ],
              ),
            ),
            Container(
              height: 250,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return itemCard(index);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Recommended For You',
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.more_horiz_rounded,
                        color: darkTeal,
                      ),
                      onPressed: () {})
                ],
              ),
            ),
            Container(
              height: 250,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return itemCard(index + 4);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Top Brands',
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.more_horiz_rounded,
                        color: darkTeal,
                      ),
                      onPressed: () {})
                ],
              ),
            ),
            TopBrand(),
            Container(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
