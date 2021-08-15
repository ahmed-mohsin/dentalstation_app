import 'package:dentalstation_app/Designs/Decorations/hex.dart';
import 'package:dentalstation_app/Designs/HomePage/HomePageScreen.dart';
import 'package:dentalstation_app/Designs/orders/MyOrders.dart';
import 'package:flutter/material.dart';

class Congratulation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Congratulation \n Your order has been placed',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20,),
            FlatButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (v){
                    return MyHomePage();
                  }));
                },
                color: Colors.amber,
                child: Text(
                  'Go to HomePage',
                  style: TextStyle(color: Colors.white),
                )),
            FlatButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (v){
                    return MyOrders();
                  }));
                },
                color: darkTeal,
                child: Text(
                  'Go to Your Orders',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        )),
      ),
    );
  }
}
