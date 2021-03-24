import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      //color: Colors.teal,
      child: Center(
        child: Text(
          'Categories',
          style: TextStyle(color: Colors.teal),
        ),
      ),
    );
  }
}
