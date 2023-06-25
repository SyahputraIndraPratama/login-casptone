import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:zoo/model/user_model.dart';
import 'package:zoo/screens/home_screens.dart';
import 'package:flutter/material.dart';
import 'package:zoo/screens/login_screens.dart';
import 'package:zoo/screens/regis_controller.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  late String firstName;
  late String lastName;
  late String email;
  late String password;
  late String retypepassword;

  // our form key
  final _formKey = GlobalKey<FormState>();
  // editing Controller
  final firstNameEditingController = new TextEditingController();
  final lastNameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final retypePasswordEditingController = new TextEditingController();

  

  @override
  Widget build(BuildContext context) {
    //first name field
    final firstNameField = TextFormField(
      autofocus: false,
      controller: firstNameEditingController,
      keyboardType: TextInputType.name,
      onChanged: (value) {
        setState(() {
          firstName = value;
        });
      },
      validator: ((value) {
        if (value == '') {
          return "Mohon isi terlebih dahulu!";
        }
      }),
      onSaved: (value)
      {
        firstNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_circle),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "First Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ));

      //last name field
      final lastNameField = TextFormField(
      autofocus: false,
      controller: lastNameEditingController,
      keyboardType: TextInputType.name,
      onChanged: (value) {
        setState(() {
          lastName = value;
        });
      },
      validator: ((value) {
        if (value == '') {
          return "Mohon isi terlebih dahulu!";
        }
      }),
      onSaved: (value)
      {
        lastNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_circle),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Last Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ));

      //email field
      final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        setState(() {
          email = value;
        });
      },
      validator: ((value) {
        if (value == '') {
          return "Mohon isi terlebih dahulu!";
        }
      }),
      onSaved: (value)
      {
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ));

      //password name field
      final passwordField = TextFormField(
      autofocus: false,
      controller: passwordEditingController,
      obscureText: true,
      onChanged: (value) {
        setState(() {
          password = value;
        });
      },
      validator: ((value) {
        if (value == '') {
          return "Mohon isi terlebih dahulu!";
        }
      }),
      onSaved: (value)
      {
        passwordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ));

      //retype password field
      final retypePasswordField = TextFormField(
      autofocus: false,
      controller: retypePasswordEditingController,
      obscureText: true,
      onChanged: (value) {
        setState(() {
          retypepassword = value;
        });
      },
      validator: ((value) {
        if (value == '') {
          return "Mohon isi terlebih dahulu!";
        }
      }),
      onSaved: (value)
      {
        retypePasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Retype Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ));

      //signup button
      final signupButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.greenAccent,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
                          print("Validation Success");
                          print("email : " + email);
                          print("password : " + password);
                          print("first_name : " + firstName);
                          print("last_name : " + lastName);
                          print("retype_password : " + retypepassword);
                await HttpService.flutter_register(
                firstName, lastName, email, password, retypepassword, context);
              } else {
              print("Validation Error");
            }
          },
          child: Text(
            "SignUp", 
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.greenAccent),
          onPressed: () {
            // passing this our root
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    SizedBox(
                      height: 100,
                      child: Image.asset(
                        "assets/images/signup.png",
                        fit: BoxFit.contain,
                        )),
                    SizedBox(height: 45),    
                    firstNameField,
                    SizedBox(height: 20),    
                    lastNameField,
                    SizedBox(height: 20),    
                    emailField,
                    SizedBox(height: 20),    
                    passwordField,
                    SizedBox(height: 20),
                    retypePasswordField,
                    SizedBox(height: 20),
                    signupButton,
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}