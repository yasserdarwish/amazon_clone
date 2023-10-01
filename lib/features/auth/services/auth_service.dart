import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService {
  void signupUser(
      {required BuildContext context,
      required String name,
      required String email,
      required String password}) async {
    User user = User(
        id: "",
        name: name,
        email: email,
        password: password,
        type: "",
        address: "",
        token: "");
    try {
      http.Response response = await http.post(
        Uri.parse('$baseUrl/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      httoErrorHandling(
        context: context,
        response: response,
        onSuccess: () {
          showSnackBar(context,
              "Account Created! Please sign in with the same credentials");
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
