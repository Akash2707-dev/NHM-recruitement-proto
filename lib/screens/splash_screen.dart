import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:grs/controllers/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  final SplashController _controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green, // Set background color as needed
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.white, // Set color of the cubes
          size: 50.0, // Set size of the cubes
        ),
      ),
    );
  }
}
