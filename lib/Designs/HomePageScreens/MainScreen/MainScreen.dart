import 'package:dentalstation_app/productsjson.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      //color: Colors.teal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Best Sellers',
                  style: TextStyle(color: Colors.black87),
                ),
                IconButton(
                    icon: Icon(
                      Icons.more_horiz_rounded,
                      color: Colors.black87,
                    ),
                    onPressed: () {})
              ],
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            itemCount: 4,
            padding: EdgeInsets.all(0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0),
            itemBuilder: (BuildContext context, int index) {
              return new Card(
                elevation: 9,
                color: Colors.white,
                child: Container(
                  child: Column(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.network(
                        productList[index]['url'],
                        height: 120, width: 200,
                        //fit: BoxFit.fitHeight,
                      ),
                      Container(width: MediaQuery.of(context).size.width,
                        child: Text(
                          productList[index]['name'],
                          style: TextStyle(color: Colors.black),textAlign: TextAlign.left,
                        ),
                      ),
                      Container(width: MediaQuery.of(context).size.width,
                        child: Text(
                          productList[index]['title'],
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Container(width: MediaQuery.of(context).size.width,
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              productList[index]['price'].toString(),
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              productList[index]['oldPrice'].toString(),
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
/*new GridTile(
                  footer: new Text(
                    productList[index]['title'],
                    style: TextStyle(color: Colors.grey),
                  ),
                  child: SizedBox(
                      height: 30,width: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: new Image.network(
                          productList[index]['url'],
                          height: 30,
                          //fit: BoxFit.fitHeight,
                        ),
                      )),
                  header: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      productList[index]['name'],
                      style: TextStyle(color: Colors.black),
                    ),
                  ), //just for testing, will fill with image later
                )*/
