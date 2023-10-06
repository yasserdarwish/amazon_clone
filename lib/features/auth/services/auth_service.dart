import 'dart:convert';

import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/extensions.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/cubits/cubit/user_cubit.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:amazon_clone/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
      if (context.mounted) {
        httoErrorHandling(
          context: context,
          response: response,
          onSuccess: () {
            showSnackBar(context,
                "Account Created! Please sign in with the same credentials");
          },
        );
      }
    } catch (e) {
      if (context.mounted) {
        showSnackBar(context, e.toString());
      }
    }
  }

  void signinUser(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$baseUrl/api/signin'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      debugPrint(response.body);
      if (context.mounted) {
        httoErrorHandling(
          context: context,
          response: response,
          onSuccess: () async {
            final SharedPreferences prefs =
                await SharedPreferences.getInstance();
            if (context.mounted) {
              BlocProvider.of<UserCubit>(context).setUser(response.body);
            }
            await prefs.setString(
                'x-auth-token', jsonDecode(response.body)['token']);
            context.navigateTo(const HomeScreen());
          },
        );
      }
    } catch (e) {
      if (context.mounted) {
        showSnackBar(context, e.toString());
      }
    }
  }

  void getUserData(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('x-auth-token');
    if (token == null) {
      prefs.setString('x-auth-token', '');
    }
  }
}
