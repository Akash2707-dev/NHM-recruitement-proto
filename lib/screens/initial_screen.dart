import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:grs/controllers/initial_screen_controller.dart';
import 'package:grs/screens/form_screen.dart';
import 'package:grs/screens/login_screen.dart';

class InitialScreen extends StatelessWidget {
  final InitialScreenController _controller = Get.put(InitialScreenController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _controller.isDialogVisible.value ? FocusScope.of(context).requestFocus(FocusNode()) : null,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Government Recruitment Software')),
          backgroundColor: Colors.green,
          elevation: 0, // Remove app bar shadow
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            height: 280,
            width: 333,
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24), bottom: Radius.circular(24)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Text(
                      'Welcome to NHM',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'Readex Pro',
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                    children: [
                      TextSpan(
                        text: 'This is the NHM Platform Recruitment App, please proceed to the form filling and review the form before proceeding with the payment. If any problems arise, please contact us at ',
                      ),
                      TextSpan(
                        text: 'nhm@gov.hotmail.com',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.lightBlue,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      _controller.showPhoneNumberDialog(context);
                    },
                    child: Text('Continue to Form Filling'),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    await Get.to(LoginScreenWidget());
                  },
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(LoginScreenWidget());
                      },
                      child: Text('Admin Login'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
