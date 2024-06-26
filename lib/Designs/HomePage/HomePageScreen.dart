import 'dart:convert';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart';
import 'package:dentalstation_app/Designs/Cart/CartPage.dart';
import 'package:dentalstation_app/Designs/Decorations/hex.dart';
import 'package:dentalstation_app/Designs/NavBar/NavigationBar.dart';
import 'package:dentalstation_app/Designs/NavBarScreens/Categories/CategoriesScreen.dart';
import 'package:dentalstation_app/Designs/NavBarScreens/Deals/DealsScreen.dart';
import 'package:dentalstation_app/Designs/NavBarScreens/MainScreen/MainScreen.dart';
import 'package:dentalstation_app/Designs/NavBarScreens/MyAccount/MyAccount.dart';
import 'package:dentalstation_app/Designs/drawer.dart';
import 'package:dentalstation_app/State/stateManger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text("This is the screen after Introduction")),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final autoSizeGroup = AutoSizeGroup();
  var _bottomNavIndex = 0; //default index of first screen

  AnimationController _animationController;
  Animation<double> animation;
  CurvedAnimation curve;

  final iconList = <IconData>[
    LineIcons.home,
    Icons.format_list_bulleted_sharp,
    FluentIcons.cart_24_regular,
    Icons.account_circle_outlined,
  ];
  final tabString = <String>[
    'MainScreen',
    'Categories',
    'Cart',
    'MyAccount',
  ];
  final homePageWidgets = <Widget>[
    MainScreen(),
    Categories(),
    Deals(),
    MyAccount(),
  ];

  @override
  void initState() {
    super.initState();
    final systemTheme = SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarColor: HexColor('#373A36'),
      systemNavigationBarIconBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(systemTheme);

    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    curve = CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.4,
        1.0,
        curve: Curves.easeIn,
      ),
    );
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);

    Future.delayed(
      Duration(seconds: 1),
      () => _animationController.forward(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        extendBody: true,
        drawer: AppDrawer(),
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu_rounded),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          centerTitle: true,
          actions: [
            Container(
                //decoration: BoxDecoration(color: xx, shape: BoxShape.circle),
                child: CartLogo())
          ],
          title: Text(
            "Dental Station",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: darkTeal,
        ),
        body: NavigationScreen(
          homePageWidgets[_bottomNavIndex],
        ),
        //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          itemCount: iconList.length,
          tabBuilder: (int index, bool isActive) {
            final color = isActive ? darkTeal : Colors.grey;
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconList[index],
                  size: 25,
                  color: color,
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: AutoSizeText(
                    tabString[index],
                    maxLines: 1,
                    style: TextStyle(
                      color: color,
                      fontFamily: 'Poppins',
                    ),
                    group: autoSizeGroup,
                  ),
                )
              ],
            );
          },
          backgroundColor: Colors.white,
          activeIndex: _bottomNavIndex,
          splashColor: Colors.white,
          elevation: 10,
          notchAndCornersAnimation: animation,
          splashSpeedInMilliseconds: 50,
          notchSmoothness: NotchSmoothness.verySmoothEdge,
          gapLocation: GapLocation.none,
          leftCornerRadius: 10,
          rightCornerRadius: 10,
          onTap: (index) => setState(() => _bottomNavIndex = index),
        ),
      ),
    );
  }
}

class CartLogo extends StatelessWidget {
  const CartLogo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Consumer(
        builder: (cx, watch, v) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (cx) {
                return CartPage();
              }));
            },
            child: Badge(
              child: IconButton(
                  icon: Icon(LineIcons.shoppingCart),
                  onPressed: () {
                    //CartPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartPage()),
                    );
                  }),
              position: BadgePosition(top: 0, end: 1),
              animationDuration: (Duration(milliseconds: 500)),
              animationType: BadgeAnimationType.scale,
              showBadge: true,
              badgeContent: Text(
                '${watch(cartListProvider.state).length}',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              badgeColor: Colors.pink,
            ),
          );
        },
      ),
    );
  }
}
