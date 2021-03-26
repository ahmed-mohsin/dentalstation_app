import 'package:cached_network_image/cached_network_image.dart';
import 'package:dentalstation_app/Designs/Decorations/hex.dart';
import 'package:dentalstation_app/Designs/NavBarScreens/Categories/tabs.dart';
import 'package:flutter/material.dart';
import 'package:vertical_tabs/vertical_tabs.dart';

import '../../../productsjson.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  var styles = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w100,
    fontFamily: 'CeraRound',
  );
  List<Tab> tabs = [];
  List<Widget> content = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < catList.length; i++) {
      tabs.add(Tab(
        child: Container(height: 30,width: double.infinity,
          child: Center(
            child: Text(
              catList[i]["name"],textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w500,
                fontFamily: 'CeraRound',
              ),
            ),
          ),
        ),
      ));
      content.add(Container(
        color: bac,
        //            itemCount: catList[i]["subCat"].length,
        child: Padding(
          padding: const EdgeInsets.only(top: 3,left: 2,right: 2,bottom: 4),
          child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: catList[i]["subCat"].length,
              itemBuilder: (x, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.grey[300],
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 6, left: 6, right: 6),
                            child: Text(
                              catList[i]["subCat"][index]['name'],
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'CeraRound',
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey[300],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount:
                                  catList[i]["subCat"][index]['dubCat'].length,
                              gridDelegate:
                                  new SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3),
                              itemBuilder: (BuildContext context, int i2) {
                                return Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: new Container(
                                    decoration: BoxDecoration(
                                        color: bac,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            color: Colors.white,
                                            child: CachedNetworkImage(
                                              height: double.infinity,
                                              width: double.infinity,
                                              imageUrl: catList[i]["subCat"]
                                                      [index]['dubCat'][i2]
                                                  ['image'],
                                              //placeholder: (context, url) => CircularProgressIndicator(),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Icon(Icons.error),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(
                                            catList[i]["subCat"][index]
                                                ['dubCat'][i2]['name'],
                                            style: TextStyle(color: darkTeal,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'CeraRound',),textAlign: TextAlign.center,maxLines: 2,overflow: TextOverflow.fade,
                                          ),
                                        ),
                                      ],
                                    ),
                                    // child: new Text(data[index]
                                    //     ['image']), //just for testing, will fill with image later
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      )),
                );
              }),
        ),
      ));
    }
  }

/* */
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Material(
        child: VerticalTabs(
                tabTextStyle: TextStyle(),
                tabsShadowColor: Colors.grey[200],
                indicatorColor: Colors.orange,
                selectedTabBackgroundColor: bac,
                backgroundColor: Colors.indigoAccent,
                tabBackgroundColor: Colors.white,indicatorSide: IndicatorSide.start,
                // unselectedTabBackgroundColor: Colors.grey[200],
                indicatorWidth: 3,initialIndex: 0,
                contentScrollAxis: Axis.vertical,
                 tabsWidth: 120,
                tabs: tabs,
                contents: content,
              ),
      ),
    );
  }

  Widget tabsContent(String caption, [String description = '']) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      color: Colors.black12,
      child: Column(
        children: <Widget>[
          Text(
            caption,
            style: TextStyle(fontSize: 25),
          ),
          Divider(
            height: 20,
            color: Colors.black45,
          ),
          Text(
            description,
            style: TextStyle(fontSize: 15, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Title',
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[],
          ),

          /*child: Column(
            children: <Widget>[
              Container(
                height: 300,
                child: VerticalTabs(
                  tabsWidth: 150,
                  direction: TextDirection.ltr,
                  contentScrollAxis: Axis.vertical,
                  changePageDuration: Duration(milliseconds: 500),
                  tabs: <Tab>[
                    Tab(child: Text('Flutter'), icon: Icon(Icons.phone)),
                    Tab(child: Text('Dart')),
                    Tab(
                      child: Container(
                        margin: EdgeInsets.only(bottom: 1),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.favorite),
                            SizedBox(width: 25),
                            Text('Javascript'),
                          ],
                        ),
                      ),
                    ),
                    Tab(child: Text('NodeJS')),
                    Tab(child: Text('PHP')),
                  ],
                  contents: <Widget>[
                    tabsContent('Flutter', 'You can change page by scrolling content vertically'),
                    tabsContent('Dart'),
                    tabsContent('Javascript'),
                    tabsContent('NodeJS'),
                    Container(
                        color: Colors.black12,
                        child: ListView.builder(
                            itemCount: 10,
                            itemExtent: 100,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index){
                              return Container(
                                margin: EdgeInsets.all(10),
                                color: Colors.white30,
                              );
                            })
                    ),
                  ],
                ),
              ),
              Divider(height: 20, color: Colors.black87,),
              Container(
                height: 300,
                child: VerticalTabs(
                  tabsWidth: 150,
                  direction: TextDirection.ltr,
                  changePageDuration: Duration(milliseconds: 500),
                  tabs: <Tab>[
                    Tab(child: Text('Flutter'), icon: Icon(Icons.phone)),
                    Tab(child: Text('Dart')),
                    Tab(
                      child: Container(
                        margin: EdgeInsets.only(bottom: 1),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.favorite),
                            SizedBox(width: 25),
                            Text('Javascript'),
                          ],
                        ),
                      ),
                    ),
                    Tab(child: Text('NodeJS')),
                    Tab(child: Text('PHP')),
                  ],
                  contents: <Widget>[
                    tabsContent('Flutter', 'You can change page by scrolling content horizontally'),
                    tabsContent('Dart'),
                    tabsContent('Javascript'),
                    tabsContent('NodeJS'),
                    Container(
                        color: Colors.black12,
                        child: ListView.builder(
                            itemCount: 10,
                            itemExtent: 100,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index){
                              return Container(
                                margin: EdgeInsets.all(10),
                                color: Colors.white30,
                              );
                            })
                    ),
                  ],
                ),
              ),
            ],
          ),*/
        ),
      ),
    );
  }
}
