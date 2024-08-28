import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grs/screens/splash_screen.dart';
import 'package:grs/screens/initial_screen.dart';
import 'package:grs/bindings/splash_binding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GRS',
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: '/grs/screens/splash_screen',
      getPages: [
        GetPage(name: '/grs/screens/splash_screen', page: () => SplashScreen(), binding: SplashBinding()),
        GetPage(name: '/grs/screens/initial_screen', page: () => InitialScreen()),
        // Add routes for other screens here
      ],
    );
  }
}
