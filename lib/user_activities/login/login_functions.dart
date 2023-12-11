import 'package:flutter/material.dart';
import 'package:vcu_2023/user_activities/home/home.dart';
import 'package:vcu_2023/user_activities/login/login.dart';
import 'package:http/http.dart' as http;

checkFormValidityToProceed(
    BuildContext context, String username, String password) {
  try {
    if (loginFormKey.currentState!.validate()) {
      requestAuth(context, username, password);
    }
  } catch (e) {
    debugPrint(
        'checkFormValidityToProceed(String $username, String $password) failed: $e');
  }
}

requestAuth(BuildContext context, String username, String password) {
  try {
    Uri url = Uri.parse('google.com');
    final response = http.post(url);
    debugPrint('response===>$response');
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Home()));
  } catch (e) {
    debugPrint('requestAuth(String $username, String $password) failed: $e');
  }
}
