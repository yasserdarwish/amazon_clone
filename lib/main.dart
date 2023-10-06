import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/cubits/cubit/user_cubit.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const AmazonCloneApp());
}

class AmazonCloneApp extends StatelessWidget {
  const AmazonCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Amazon Clone',
          theme: ThemeData(
            scaffoldBackgroundColor: GlobalVariables.backgroundColor,
            appBarTheme: const AppBarTheme(
                elevation: 0, iconTheme: IconThemeData(color: Colors.black)),
            colorScheme: const ColorScheme.light(
                primary: GlobalVariables.secondaryColor),
          ),
          home: const AuthScreen()),
    );
  }
}
