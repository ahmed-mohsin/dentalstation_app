import 'package:dentalstation_app/Designs/Decorations/hex.dart';
import 'package:flutter/material.dart';

class CHECKOUT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: darkTeal,
        title: Text(
          'ORDER SUMMARY',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey[300],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Delivery options',
                style: TextStyle(color: darkTeal, fontWeight: FontWeight.bold),
              ),
            ),
            Card(
                child: Container(
              color: Colors.white,
              child: RadioListBuilder(
                num: 3,
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class RadioListBuilder extends StatefulWidget {
  final int num;

  const RadioListBuilder({Key key, this.num}) : super(key: key);

  @override
  RadioListBuilderState createState() {
    return RadioListBuilderState();
  }
}

class RadioListBuilderState extends State<RadioListBuilder> {
  int value;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return RadioListTile(
          value: index,
          groupValue: value,
          onChanged: (ind) => setState(() => value = ind),
          title: Text(" عنوان $index"),
        );
      },
      itemCount: widget.num,
    );
  }
}
