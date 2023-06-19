import 'package:flutter/material.dart';
import 'package:zoo/camera/camera_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(MainCamera());
}

class MainCamera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Camera Test',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: CameraPage(),
    );
  }
}