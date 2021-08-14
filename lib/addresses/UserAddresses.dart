import 'dart:convert';

import 'package:dentalstation_app/Designs/Decorations/hex.dart';
import 'package:dentalstation_app/addresses/citiesModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class UserAddresses extends StatelessWidget {
  Future<String> getJson() {
    return rootBundle.loadString('lib/addresses/governorates.json');
  }

  ff()async{
    List<Cities> my_data = json.decode(await getJson());
    print(my_data[0].name);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: darkTeal,),
      floatingActionButton: FloatingActionButton(backgroundColor:darkTeal ,
        child: Icon(Icons.add),
        onPressed: () {
          ff();
          showCupertinoModalBottomSheet(
            expand: true,
            context: context,
            backgroundColor: Colors.white,
            builder: (context) => Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20,top: 12),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.close),
                          Text('اضف عنوان جديد'),
                        ],
                      ),
                    ),
                    Divider(color: Colors.grey,),
                    AddAdressBody()
                  ],
                ),
              ),
            ),
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
class AddAdressBody extends StatefulWidget {

  @override
  _AddAdressBodyState createState() => _AddAdressBodyState();
}

class _AddAdressBodyState extends State<AddAdressBody> {
  final TextEditingController userName = new TextEditingController();
  final TextEditingController userPhone = new TextEditingController();
  final TextEditingController userAddress = new TextEditingController();
  final TextEditingController street = new TextEditingController();
  final TextEditingController building = new TextEditingController();
  final TextEditingController NearestLandMark = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _validate = false;
  List<Cities> my_data;
  _getStateList(){

  }
  @override
  void initState() {
    _getStateList();
    super.initState();
  }


  String _myState = ' ';


  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (BuildContext context) {

          return Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10, vertical: 8),
                    child: TextFormField(
                      controller: userName,
                      autofocus: false,
                      style: TextStyle(
                          fontSize: 15.0, color: Colors.black),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Address Title ..ie. Mansoura clinic address',
                        filled: true,
                        errorText:
                        _validate
                            ? 'Value Can\'t Be Empty'
                            : null,
                        fillColor: Colors.grey[200],
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 6.0, top: 8.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.teal),
                          borderRadius: BorderRadius.circular(
                              10.0),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey),
                          borderRadius: BorderRadius.circular(
                              10.0),
                        ),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10, vertical: 8),
                    child: TextFormField(
                      controller: userName,
                      autofocus: false,
                      style: TextStyle(
                          fontSize: 15.0, color: Colors.black),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Username',
                        filled: true,
                        errorText:
                        _validate
                            ? 'Value Can\'t Be Empty'
                            : null,
                        fillColor: Colors.grey[200],
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 6.0, top: 8.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.teal),
                          borderRadius: BorderRadius.circular(
                              10.0),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey),
                          borderRadius: BorderRadius.circular(
                              10.0),
                        ),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10, vertical: 8),
                    child: TextFormField(
                      controller: userPhone,
                      autofocus: false,
                      style: TextStyle(
                          fontSize: 15.0, color: Colors.black),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Phone Number',
                        filled: true,
                        errorText:
                        _validate
                            ? 'Value Can\'t Be Empty'
                            : null,
                        fillColor: Colors.grey[200],
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 6.0, top: 8.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.teal),
                          borderRadius: BorderRadius.circular(
                              10.0),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey),
                          borderRadius: BorderRadius.circular(
                              10.0),
                        ),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10, vertical: 8),
                    child: TextFormField(
                      controller: userPhone,
                      autofocus: false,
                      style: TextStyle(
                          fontSize: 15.0, color: Colors.black),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'LandLine Number',
                        filled: true,
                        errorText:
                        _validate
                            ? 'Value Can\'t Be Empty'
                            : null,
                        fillColor: Colors.grey[200],
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 6.0, top: 8.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.teal),
                          borderRadius: BorderRadius.circular(
                              10.0),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey),
                          borderRadius: BorderRadius.circular(
                              10.0),
                        ),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),

                  // Padding(
                  //   padding: EdgeInsets.symmetric(
                  //       horizontal: 10, vertical: 8),
                  //   child: TextFormField(
                  //     controller: userAddress,
                  //     autofocus: false,
                  //     style: TextStyle(
                  //         fontSize: 15.0, color: Colors.black),
                  //     decoration: InputDecoration(
                  //       border: InputBorder.none,
                  //       hintText: 'Address',
                  //       filled: true,
                  //       errorText:
                  //       _validate ? 'Value Can\'t Be Empty' : null,
                  //       fillColor: Colors.grey[200],
                  //       contentPadding: const EdgeInsets.only(
                  //           left: 14.0, bottom: 6.0, top: 8.0),
                  //       focusedBorder: OutlineInputBorder(
                  //         borderSide: BorderSide(color: Colors.teal),
                  //         borderRadius: BorderRadius.circular(10.0),
                  //       ),
                  //       enabledBorder: UnderlineInputBorder(
                  //         borderSide: BorderSide(color: Colors.grey),
                  //         borderRadius: BorderRadius.circular(10.0),
                  //       ),
                  //     ),
                  //     validator: (value) {
                  //       if (value.isEmpty) {
                  //         return 'Please enter some text';
                  //       }
                  //       return null;
                  //     },
                  //   ),
                  // ),
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton<String>(
                                value: _myState,
                                iconSize: 30,
                                icon: (null),
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                ),
                                hint: Text('Select State'),
                                onChanged: (String newValue) {
                                  setState(() {
                                    _myState = newValue;
                                    print(_myState);
                                  });
                                },
                                items: gg.map((item) {
                                  return new DropdownMenuItem(
                                    child: new Text(''),
                                    value: item['name'],
                                  );
                                })?.toList()
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10, vertical: 8),
                    child: TextFormField(
                      controller: street,
                      autofocus: false,
                      style: TextStyle(
                          fontSize: 15.0, color: Colors.black),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Street',
                        filled: true,
                        errorText:
                        _validate
                            ? 'Value Can\'t Be Empty'
                            : null,
                        fillColor: Colors.grey[200],
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 6.0, top: 8.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.teal),
                          borderRadius: BorderRadius.circular(
                              10.0),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey),
                          borderRadius: BorderRadius.circular(
                              10.0),
                        ),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10, vertical: 8),
                    child: Stack(
                      alignment: const Alignment(0, 0),
                      children: <Widget>[
                        TextFormField(
                          controller: building,
                          //obscureText: _obscureText,
                          autofocus: false,
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Building/Floor',
                            filled: true,
                            errorText: _validate
                                ? 'Value Can\'t Be Empty'
                                : null,
                            fillColor: Colors.grey[200],
                            contentPadding: const EdgeInsets.only(
                                left: 14.0,
                                bottom: 6.0,
                                top: 8.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.teal),
                              borderRadius: BorderRadius.circular(
                                  10.0),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(
                                  10.0),
                            ),
                          ),
                          validator: (value) {
                            if (!(value.length > 6) &&
                                value.isNotEmpty) {
                              return "Password should contain more than 6 characters";
                            }
                            return null;
                          },
                        ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10, vertical: 8),
                    child: Stack(
                      alignment: const Alignment(0, 0),
                      children: <Widget>[
                        TextFormField(
                          controller: NearestLandMark,
                       //   obscureText: _obscureText,
                          autofocus: false,
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'NearestLandMark',
                            filled: true,
                            errorText: _validate
                                ? 'Value Can\'t Be Empty'
                                : null,
                            fillColor: Colors.grey[200],
                            contentPadding: const EdgeInsets.only(
                                left: 14.0,
                                bottom: 6.0,
                                top: 8.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.teal),
                              borderRadius: BorderRadius.circular(
                                  10.0),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(
                                  10.0),
                            ),
                          ),
                          validator: (value) {
                            if (value.isEmpty) return 'Empty';
                            if (value != building.text)
                              return 'The two passwords are not matched';
                            return null;
                          },
                        ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10, vertical: 8),
                    child: Stack(
                      alignment: const Alignment(0, 0),
                      children: <Widget>[
                        TextFormField(
                          controller: NearestLandMark,
                          //   obscureText: _obscureText,
                          autofocus: false,
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'other details like work time',
                            filled: true,
                            errorText: _validate
                                ? 'Value Can\'t Be Empty'
                                : null,
                            fillColor: Colors.grey[200],
                            contentPadding: const EdgeInsets.only(
                                left: 14.0,
                                bottom: 6.0,
                                top: 8.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.teal),
                              borderRadius: BorderRadius.circular(
                                  10.0),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(
                                  10.0),
                            ),
                          ),
                          validator: (value) {
                            if (value.isEmpty) return 'Empty';
                            if (value != building.text)
                              return 'The two passwords are not matched';
                            return null;
                          },
                        ),

                      ],
                    ),
                  ),

                  // CheckboxListTile(
                  //   activeColor: Colors.tealAccent,
                  //   title: Text(
                  //     "Remember Me",
                  //     style: TextStyle(
                  //         fontFamily: 'arn', color: Colors.grey),
                  //   ),
                  //   value: rememberMeCheckValue,
                  //   onChanged: (newValue) {
                  //     setState(() {
                  //       rememberMeCheckValue = newValue;
                  //       print('remember me >> ' + newValue.toString());
                  //     });
                  //   },
                  //   controlAffinity: ListTileControlAffinity
                  //       .leading, //  <-- leading Checkbox
                  // ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 50, horizontal: 10),
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        child: RaisedButton(
                          color: darkTeal,
                          onPressed: () {

                          },
                          child: Text(
                            'Submit',
                            style: TextStyle(color: Colors.white),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              new BorderRadius.circular(18.0),
                              side: BorderSide(
                                  color: Colors.green)),
                        ),
                      )),
                ],
              ));

        }
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
                Text('0502152215'),
                Row(
                  children: [
                    Text('Dakahlya'),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Mansoura'),
                  ],
                ),
                Text('شارع قناة السويس عمارة السوسن'),
                Text('الدور التالت الشقة رقم 5'),

                Text('ملاحظات مثل موعد عمل العيادة'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
