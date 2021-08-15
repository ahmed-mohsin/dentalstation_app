import 'package:dentalstation_app/Designs/Decorations/hex.dart';
import 'package:flutter/material.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';

class MyOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkTeal,
        centerTitle: true,
        title: Text('My Orders'),
      ),
      body: Container(
        color: Colors.grey[200],
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Order(),
              Order(),
              Order(),
              Order(),
              Order(),
            ],
          ),
        ),
      ),
    );
  }
}

class Order extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4,right: 4),
      child: Card(
          child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Order Date'),
                  Spacer(),
                  Text('10/25/2020')
                ],
              ),
              Row(
                children: [
                  Text('Order Number'),
                  Spacer(),
                  Text('10252020')
                ],
              ),
              Row(
                children: [
                  Text('Order Status'),
                  Spacer(),
                  Text('Delivered')
                ],
              ),
              Divider(),
              Text('Order Details')
            ],
          ),
        ),
      )),
    );
  }
}
