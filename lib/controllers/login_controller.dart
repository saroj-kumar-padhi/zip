

import 'package:api/models/user_model.dart';
import 'package:api/views/dashboard_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginController extends GetxController {

  var user = User(
    id: 0,
    username: '',
    email: '',
    firstName: '',
    lastName: '',
    gender: '',
    image: '',
    token: '',
  ).obs;

  Future<void >login(String username, String password) async {
    try {
      var url = Uri.parse('https://dummyjson.com/auth/login');
      var response = await http.post(
        url,
        body: {'username': username, 'password': password},
      );

      if (response.statusCode == 200) {
        final userData = json.decode(response.body);
        user.value = User.fromJson(userData);
        Get.to(() => DashboardScreen());

      } else {
        // Show error if login fails
        Get.snackbar('Login Failed', 'Invalid username or password');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred during login');
    }
  }
}
