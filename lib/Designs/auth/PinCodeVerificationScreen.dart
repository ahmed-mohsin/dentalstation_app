import 'dart:async';

import 'package:dentalstation_app/Designs/Decorations/hex.dart';
import 'package:dentalstation_app/Designs/HomePage/HomePageScreen.dart';
import 'package:dentalstation_app/Designs/auth/authServices.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeVerificationScreen extends StatefulWidget {
  final String phoneNumber;
  final String type;


  PinCodeVerificationScreen(this.phoneNumber,{this.type});

  @override
  _PinCodeVerificationScreenState createState() =>
      _PinCodeVerificationScreenState();
}

class _PinCodeVerificationScreenState extends State<PinCodeVerificationScreen> {
  var onTapRecognizer;

  TextEditingController pinCode = TextEditingController();

  // ..text = "123456";

  StreamController<ErrorAnimationType> errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Activation'),
        centerTitle: true,
        backgroundColor: darkTeal,
      ),
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: <Widget>[
            SizedBox(height: 30),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Phone Number Verification',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
              child: RichText(
                text: TextSpan(
                    text: "Enter the code sent to ",
                    children: [
                      TextSpan(
                          text: widget.phoneNumber,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15)),
                    ],
                    style: TextStyle(color: Colors.black54, fontSize: 15)),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Builder(
              builder: (BuildContext context) {
                return Form(
                  key: formKey,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 30),
                      child: PinCodeTextField(
                        enablePinAutofill: true,
                        appContext: context,
                        pastedTextStyle: TextStyle(
                          color: Colors.green.shade600,
                          fontWeight: FontWeight.bold,
                        ),
                        length: 4,
                        obscureText: false,
                        obscuringCharacter: '*',
                        animationType: AnimationType.fade,
                        validator: (v) {
                          if (v.length < 4) {
                            return "Enter Activation code";
                          } else {
                            return null;
                          }
                        },
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 60,
                          selectedColor: Colors.teal.shade100,
                          selectedFillColor: Colors.white,
                          fieldWidth: 50,
                          inactiveColor: Colors.white38,
                          activeColor: darkTeal,
                          inactiveFillColor: Colors.white,
                          activeFillColor:
                              hasError ? Colors.red.shade100 : Colors.white,
                        ),
                        cursorColor: Colors.black,
                        animationDuration: Duration(milliseconds: 300),
                        textStyle: TextStyle(fontSize: 20, height: 1.6),
                        backgroundColor: Colors.white,
                        enableActiveFill: true,
                        errorAnimationController: errorController,
                        controller: pinCode,
                        keyboardType: TextInputType.number,
                        boxShadows: [
                          BoxShadow(
                            offset: Offset(0, 1),
                            color: Colors.black12,
                            blurRadius: 10,
                          )
                        ],
                        onCompleted: (v) {
                          print("Completed");
                        },
                        // onTap: () {
                        //   print("Pressed");
                        // },
                        onChanged: (value) {
                          print(value);
                          setState(() {
                            currentText = value;
                          });
                        },
                        beforeTextPaste: (text) {
                          print("Allowing to paste $text");
                          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                          //but you can show anything you want here, like your pop up saying wrong paste format or etc
                          return true;
                        },
                      )),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                hasError ? "*Please fill up all the cells properly" : "",
                style: TextStyle(
                    color: Colors.teal,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "Didn't receive the code? ",
                  style: TextStyle(color: Colors.black54, fontSize: 15),
                  children: [
                    TextSpan(
                        text: " RESEND",
                        recognizer: onTapRecognizer,
                        style: TextStyle(
                            color: Color(0xFF91D3B3),
                            fontWeight: FontWeight.bold,
                            fontSize: 16))
                  ]),
            ),
            SizedBox(
              height: 14,
            ),
            Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
              child: ButtonTheme(
                height: 50,
                child: FlatButton(
                  onPressed: () {
                    formKey.currentState.validate();
                    // conditions for validating
                    if (currentText.length != 4 ) {
                      errorController.add(ErrorAnimationType
                          .shake); // Triggering error shake animation
                      setState(() {
                        hasError = true;
                      });
                    } else {
                      activateNewUserService(
                          context, widget.phoneNumber, pinCode.text,widget.type=='cpw'?'cpw':'new',);
                      setState(() {
                        hasError = false;
                      });
                    }
                  },
                  child: Center(
                      child: Text(
                    "VERIFY".toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.green.shade300,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.green.shade200,
                        offset: Offset(1, -2),
                        blurRadius: 5),
                    BoxShadow(
                        color: Colors.green.shade200,
                        offset: Offset(-1, 2),
                        blurRadius: 5)
                  ]),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text("Clear"),
                  onPressed: () {
                    pinCode.clear();
                  },
                ),
                FlatButton(
                  child: Text("Set Text"),
                  onPressed: () {
                    pinCode.text = "123456";
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
