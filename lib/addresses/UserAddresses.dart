import 'package:flutter/material.dart';

class UserAddresses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),onPressed: (){
        showCupertinoModalBottomSheet(
          expand: true,
          context: context,
          backgroundColor: Colors.transparent,
          builder: (context) => Container(),
        );
      },
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (c, i) {
                  return AddressItem(i);
                }),
          ),
        ),
      ),
    );
  }
}

class AddressItem extends StatelessWidget {
  int i;

  AddressItem(this.i);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, right: 4, top: 4),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(4)),
        child: Row(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.edit),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.delete),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(' عنوان عياة رقم $i'),
                Text('Ahmed Mohsin'),
                Text('01553969051'),
                Row(
                  children: [
                    Text('Dakahlya'),
                    SizedBox(width: 5,),
                    Text('Mansoura'),
                  ],
                ),
                Text('شارع قناة السويس عمارة السوسن الشقة رقم 5'),
                Text('ملاحظات مثل موعد عمل العيادة'),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
