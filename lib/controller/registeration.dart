import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nauggets_flutter_task/constant/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class RegisterationController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> registerWithEmail() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(Api.registerurl);
      Map body = {
        'email': emailController.text,
        'password': passwordController.text,
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        var token = json['token'];
        log(token);
        final SharedPreferences? pref = await _prefs;
        await pref?.setString('token', token);
        emailController.clear();
        passwordController.clear();
      } else {
        throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured";
      }
    } catch (e) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text("Error"),
              contentPadding: EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          });
    }
  }
}
