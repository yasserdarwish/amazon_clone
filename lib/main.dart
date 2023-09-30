import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AmazonCloneApp());
}

class AmazonCloneApp extends StatelessWidget {
  const AmazonCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Amazon Clone',
        theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          appBarTheme: const AppBarTheme(
              elevation: 0, iconTheme: IconThemeData(color: Colors.black)),
          colorScheme:
              const ColorScheme.light(primary: GlobalVariables.secondaryColor),
        ),
        home: const AuthScreen());
  }
}
