import 'package:flutter/material.dart';
import 'package:zoo/profile/body.dart';

void main(){
  runApp(ProfileScreen());
}
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Body(),
      debugShowCheckedModeBanner: false,
    );
  }
}