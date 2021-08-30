import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dentalstation_app/Designs/Decorations/hex.dart';
import 'package:dentalstation_app/Designs/NavBarScreens/Categories/singleSubCategeroyScreen.dart';
import 'package:dentalstation_app/constants/baseUrl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:vertical_tabs/vertical_tabs.dart';


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

  fetchSideCategories() async {
    String serviceUrl = baseUrl + 'sideCategories';
    //EasyLoading.show(status: 'loading...');
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.getUrl(Uri.parse(serviceUrl));
    request.headers.set('content-type', 'application/json');
    request.headers.set('Authorization',
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZGVudGFsc3RhdGlvbi5uZXRcL2FwaVwvc2lnbl9pbiIsImlhdCI6MTYzMDI1OTEwMywiZXhwIjoxMDk2MTQ1OTEwMywibmJmIjoxNjMwMjU5MTAzLCJqdGkiOiJWN3JsQ0xkUWtwRnoybXQ3Iiwic3ViIjoyLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.skLFhyAb4QysG8BafVtElLV0057e1ix-Ceyw8xSJeeg');
    HttpClientResponse response = await request.close();
    String reply = await response.transform(utf8.decoder).join();
    print(reply);
    httpClient.close();
    Map<String, dynamic> resMap = json.decode(reply);
    print(resMap['msg'].toString());
    if (resMap['code'] == 401) {
      EasyLoading.showToast(resMap['msg'].toString(),
          toastPosition: EasyLoadingToastPosition.bottom);
    }
    if (resMap['code'] == 200) {

      for (int i = 0; i < resMap['data'].length; i++) {
        tabs.add(Tab(
          child: Container(
            height: 30,
            width: double.infinity,
            child: Center(
              child: Text(
                resMap['data'][i]["main_category_name"],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
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
            padding: const EdgeInsets.only(top: 3, left: 2, right: 2, bottom: 4),
            child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: resMap['data'][i]["primary_category"].length,
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
                                resMap['data'][i]["primary_category"][index]['name'],
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
                                resMap['data'][i]["primary_category"][index]['secondary_category'].length,
                                gridDelegate:
                                new SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3),
                                itemBuilder: (BuildContext context, int i2) {
                                  return Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    SingleSubCatScreen(resMap['data'][i]["primary_category"][index]['secondary_category'][i2]['name'])));
                                      },
                                      child: new Container(
                                        decoration: BoxDecoration(
                                            color: bac,
                                            borderRadius:
                                            BorderRadius.circular(5)),
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
                                                  imageUrl:resMap['data'][i]["primary_category"][index]['secondary_category'][i2]['image'],
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
                                                resMap['data'][i]["primary_category"][index]['secondary_category'][i2]['name'],
                                                style: TextStyle(
                                                  color: darkTeal,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'CeraRound',
                                                ),
                                                textAlign: TextAlign.center,
                                                maxLines: 2,
                                                overflow: TextOverflow.fade,
                                              ),
                                            ),
                                          ],
                                        ),
                                        // child: new Text(data[index]
                                        //     ['image']), //just for testing, will fill with image later
                                      ),
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
      setState(() {

      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchSideCategories();

  }

/* */
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: tabs.length == 0?CircularProgressIndicator():Material(color: Colors.red,
        child: VerticalTabs(
          tabTextStyle: TextStyle(),
          tabsShadowColor: Colors.grey[200],
          indicatorColor: Colors.deepOrange,
          selectedTabBackgroundColor: bac,
          backgroundColor: Colors.indigoAccent,
          tabBackgroundColor: Colors.white,
          indicatorSide: IndicatorSide.start,
          // unselectedTabBackgroundColor: Colors.grey[200],
          indicatorWidth: 5,
          initialIndex: 0,
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
