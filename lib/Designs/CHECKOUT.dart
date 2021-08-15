import 'package:dentalstation_app/Designs/Congratulation.dart';
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
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey[300],
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Delivery options',
                      style: TextStyle(
                          color: darkTeal, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 2, right: 2),
                    child: Card(
                        child: RadioListBuilder(
                      num: 3,
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Shipment Items',
                      style: TextStyle(
                          color: darkTeal, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 2, right: 2),
                    child: Card(
                        child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            trailing: Text('Qty: 3'),
                            title: Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Text('Product name'),
                            ),
                            leading: FlutterLogo(),
                            subtitle: Text('25'),
                          ),
                          Divider(),
                          ListTile(
                            trailing: Text('Qty: 1'),
                            title: Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Text('Product namesghg hghg'),
                            ),
                            leading: FlutterLogo(),
                            subtitle: Text('25'),
                          ),
                          Divider(),
                          ListTile(
                            trailing: Text('Qty: 2'),
                            title: Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Text('Product name'),
                            ),
                            leading: FlutterLogo(),
                            subtitle: Text('25'),
                          ),
                          Divider(),
                          ListTile(
                            trailing: Text('Qty: 2'),
                            title: Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Text('Product name'),
                            ),
                            leading: FlutterLogo(),
                            subtitle: Text('25'),
                          )
                          ,
                          Divider(),
                          ListTile(
                            trailing: Text('Qty: 2'),
                            title: Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Text('Product name'),
                            ),
                            leading: FlutterLogo(),
                            subtitle: Text('25'),
                          )
                        ],
                      ),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 2, right: 2),
                    child: Card(
                        child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text('Get A Coupon ?'),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 4, right: 4),
                                  child: Text(
                                    'Enter Here',
                                    style: TextStyle(color: darkTeal),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
                  ),
                  Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text('Sub Total'),
                              Spacer(),
                              Text(
                                '20',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text('Shipping coast'),
                              Spacer(),
                              Text(
                                '35',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text('Total'),
                              Spacer(),
                              Text(
                                '5655',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 50,)
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              child: InkWell(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (cx){
                  return Congratulation();
                }));
              },
                child: Container(height: 60,
                  width: MediaQuery.of(context).size.width,
                  color: darkTeal,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                      'Place Order',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
              )),
        ],
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
    return ListView.builder(physics: NeverScrollableScrollPhysics(),
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
