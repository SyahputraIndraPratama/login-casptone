import 'dart:convert';

import 'package:zoo/screens/home_screens.dart';
import 'package:zoo/screens/resgistration_screens.dart';
import 'package:zoo/ui/root_page.dart';
import 'package:flutter/material.dart';
import 'package:zoo/ui/screens/home_page.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() =>  _LoginScreenState();
}

class  _LoginScreenState extends State <LoginScreen> {

  // form key
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  void _login(String email, String password) async {
    final url = 'https://127.0.0.1:5000/login';
    final response = await http.post(
      Uri.parse(url),
      body: {'email': email, 'password': password},
    );

    if (response.statusCode == 200) {
      print("login success");
      final responseData = json.decode(response.body);
      final token = responseData['token'];
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RootPage()));
    } else if(response.statusCode == 400) {
      print("login gagal: ${response.body}");
    }
  }


  @override
  Widget build(BuildContext context) {
    //email field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      //validator: () {},
      onSaved: (value)
      {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );




    //password field
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      //validator: () {},
      onSaved: (value)
      {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ));

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.greenAccent,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RootPage()));
          },
          child: Text(
            "Login", 
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );


    return Scaffold(
      backgroundColor: Colors.white,
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
                      height: 200,
                      child: Image.asset(
                        "assets/images/signin.png",
                        fit: BoxFit.contain,
                        )),
                        SizedBox(height: 45),
                    SizedBox(height: 45),    
                    emailField,
                    SizedBox(height: 25),
                    passwordField,
                    SizedBox(height: 35),
                    loginButton,
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: <Widget>[
                        Text("Don't have an account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (context) => 
                                RegistrationScreen()));
                          }, 
                          child: Text(
                            "SignUp", 
                            style: TextStyle(
                              color: Colors.greenAccent,
                              fontWeight: FontWeight.w600, 
                              fontSize: 15),
                          ),
                        )
                      ])
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