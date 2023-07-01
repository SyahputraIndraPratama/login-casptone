import 'package:zoo/pages/edit_profile.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screens/login_screens.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {

  //final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/User Icon.svg",
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (contex) => EditProfilePage()));
            },
          ),
          ProfileMenu(
            text: "Notifications",
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () async {
              showDialog(
                context: context, 
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Row(
                      children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Keluar'),
                          ),
                        ],
                      ),
                      content: Text('Apakah kamu ingin keluar?'),
                      actions: [
                        TextButton(
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          child: Text('Cancel')),
                        TextButton(
                          onPressed: () async {
                            Navigator.pushReplacement(
                                context, MaterialPageRoute(builder: (context) => LoginScreen()));
                          },
                          child: Text('Ok', style: TextStyle(color: Colors.red)))
                    ],
                  );
                }
              );
            },
          ),
        ],
      ),
    );
  }
}