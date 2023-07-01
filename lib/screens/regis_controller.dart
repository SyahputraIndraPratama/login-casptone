import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:zoo/screens/login_screens.dart';

class HttpService{
  static final _client = http.Client();

  static final _registerUrl = Uri.parse('http://192.168.183.50:5000/api/user/signup');

  static flutter_register(emailEditingController, passwordEditingController, firstNameEditingController, lastNameEditingController,  retypePasswordEditingController, context) async {
    http.Response response = await _client.post(_registerUrl, body: {
      "email": emailEditingController,
      "password": passwordEditingController,
      "first_name": firstNameEditingController,
      "last_name": lastNameEditingController,
      "retype_password": retypePasswordEditingController,
    });

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      // Jika sudah ada maka tidak dapat masuk
      if (json[0] == 'Email Telah digunakan!') {
        // EasyLoading.showError(json[0]);
      } else {
        // Jika data tidak ada maka akan masuk ke menu selanjutnya
        // await EasyLoading.showSuccess(json[0]);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const LoginScreen()));
      }
    } else {
      final Map<String, dynamic> errorData = json.decode(response.body);
      // ignore: unused_local_variable
      final String errorMessage = errorData['message'];
      //await EasyLoading.showError(
      //    "Error Code : ${response.statusCode.toString()}");
    }
  }

  static flutter_login(String? email, String? password, String? first_name, String? last_name, String? retype_password, BuildContext context) {}
}