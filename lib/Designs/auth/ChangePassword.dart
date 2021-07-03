import 'package:dentalstation_app/Designs/Decorations/hex.dart';
import 'package:dentalstation_app/Designs/auth/PinCodeVerificationScreen.dart';
import 'package:flutter/material.dart';

class ChangePassWord extends StatefulWidget {
  const ChangePassWord({
    Key key,
  }) : super(key: key);

  @override
  _ChangePassWordState createState() => _ChangePassWordState();
}

class _ChangePassWordState extends State<ChangePassWord> {
  bool _obscureText, rememberMeCheckValue;
  // final TextEditingController userName = new TextEditingController();
  // final TextEditingController userPhone = new TextEditingController();
  // final TextEditingController userAddress = new TextEditingController();
  // final TextEditingController userEmail = new TextEditingController();
  final TextEditingController password = new TextEditingController();
  final TextEditingController confirmPassword = new TextEditingController();
  bool _validate = false;

  @override
  void initState() {
    super.initState();
    _obscureText = true;
    rememberMeCheckValue = true;
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter New PassWord'),
        centerTitle: true,
        backgroundColor: darkTeal,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Text(
              //     'Please Fill this Text fields To Create New Account',
              //     textAlign: TextAlign.start,
              //     style: TextStyle(
              //       fontFamily: 'arn',
              //       fontSize: 15,
              //       color: Colors.teal,
              //       shadows: <Shadow>[
              //         // Shadow(
              //         //   offset: Offset(1, 1),
              //         //   blurRadius: 3.0,
              //         //   color: Color.fromARGB(255, 0, 0, 0),
              //         // ),
              //         Shadow(
              //           offset: Offset(1.5, 1.5),
              //           blurRadius: 8.0,
              //           color: Colors.grey,
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          // Padding(
                          //   padding: EdgeInsets.symmetric(
                          //       horizontal: 10, vertical: 8),
                          //   child: TextFormField(
                          //     controller: userName,
                          //     autofocus: false,
                          //     style: TextStyle(
                          //         fontSize: 15.0, color: Colors.black),
                          //     decoration: InputDecoration(
                          //       border: InputBorder.none,
                          //       hintText: 'Username',
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
                          // Padding(
                          //   padding: EdgeInsets.symmetric(
                          //       horizontal: 10, vertical: 8),
                          //   child: TextFormField(
                          //     controller: userPhone,
                          //     autofocus: false,
                          //     style: TextStyle(
                          //         fontSize: 15.0, color: Colors.black),
                          //     decoration: InputDecoration(
                          //       border: InputBorder.none,
                          //       hintText: 'Phone Number',
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
                          // Padding(
                          //   padding: EdgeInsets.symmetric(
                          //       horizontal: 10, vertical: 8),
                          //   child: TextFormField(
                          //     controller: userEmail,
                          //     autofocus: false,
                          //     style: TextStyle(
                          //         fontSize: 15.0, color: Colors.black),
                          //     decoration: InputDecoration(
                          //       border: InputBorder.none,
                          //       hintText: 'Email',
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
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            child: Stack(
                              alignment: const Alignment(0, 0),
                              children: <Widget>[
                                TextFormField(
                                  controller: password,
                                  obscureText: _obscureText,
                                  autofocus: false,
                                  style: TextStyle(
                                      fontSize: 15.0, color: Colors.black),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'password',
                                    filled: true,
                                    errorText: _validate
                                        ? 'Value Can\'t Be Empty'
                                        : null,
                                    fillColor: Colors.grey[200],
                                    contentPadding: const EdgeInsets.only(
                                        left: 14.0, bottom: 6.0, top: 8.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.teal),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10.0),
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
                                Positioned(
                                    right: 8,
                                    child: GestureDetector(
                                        onTap: _toggle,
                                        child: Icon(_obscureText
                                            ? Icons.visibility
                                            : Icons.visibility_off)))
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
                                  controller: confirmPassword,
                                  obscureText: _obscureText,
                                  autofocus: false,
                                  style: TextStyle(
                                      fontSize: 15.0, color: Colors.black),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Confirm Password',
                                    filled: true,
                                    errorText: _validate
                                        ? 'Value Can\'t Be Empty'
                                        : null,
                                    fillColor: Colors.grey[200],
                                    contentPadding: const EdgeInsets.only(
                                        left: 14.0, bottom: 6.0, top: 8.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.teal),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) return 'Empty';
                                    if (value != password.text)
                                      return 'The two passwords are not matched';
                                    return null;
                                  },
                                ),
                                Positioned(
                                    right: 8,
                                    child: GestureDetector(
                                        onTap: _toggle,
                                        child: Icon(_obscureText
                                            ? Icons.visibility
                                            : Icons.visibility_off)))
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
                                    // Validate returns true if the form is valid, or false
                                    // otherwise.
                                    if (_formKey.currentState.validate()) {
                                      // If the form is valid, display a Snackbar.

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PinCodeVerificationScreen(
                                                      '201553969051','1234')));

                                      Scaffold.of(context).showSnackBar(
                                          SnackBar(
                                              content:
                                              Text('Processing Data')));
                                    } else {
                                      Scaffold.of(context).showSnackBar(
                                          SnackBar(
                                              content: Text(
                                                  'Fill Required TextFields')));
                                    }
                                  },
                                  child: Text(
                                    'Submit',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      new BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.green)),
                                ),
                              )),
                        ],
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
