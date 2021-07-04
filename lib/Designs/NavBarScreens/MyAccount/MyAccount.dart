import 'package:dentalstation_app/Designs/auth/ChangePassword.dart';
import 'package:dentalstation_app/Designs/auth/Login.dart';
import 'package:dentalstation_app/Designs/auth/Registration.dart';
import 'package:dentalstation_app/Designs/auth/ResetPassWord.dart';
import 'package:dentalstation_app/Designs/auth/authServices.dart';
import 'package:flutter/material.dart';

class MyAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      //color: Colors.teal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LogginScreen()));
              },
              child: Text(
                'Login',
                style: TextStyle(color: Colors.teal),
              ),
            ),
          ),
          //ChangePassWord


          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: InkWell(
          //     onTap: () {
          //       registerNewUserService(context);
          //     },
          //     child: Text(
          //       'Create New Account function',
          //       style: TextStyle(color: Colors.teal),
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: InkWell(
          //     onTap: () {
          //       activateNewUserService(context,'01021888175','1234');
          //     },
          //     child: Text(
          //       'Activate New Account function',
          //       style: TextStyle(color: Colors.teal),
          //     ),
          //   ),
          // ),

        ],
      ),
    );
  }
}


