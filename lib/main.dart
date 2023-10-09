import 'package:amazon_clone/common/widgets/bottom_bar.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/admin/screens/admin_screen.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/auth/services/auth_service.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(ChangeNotifierProvider(
    create: (context) => UserProvider(),
    child: const AmazonCloneApp(),
  ));
}

class AmazonCloneApp extends StatefulWidget {
  const AmazonCloneApp({super.key});

  @override
  State<AmazonCloneApp> createState() => _AmazonCloneAppState();
}

class _AmazonCloneAppState extends State<AmazonCloneApp> {
  final AuthService authService = AuthService();
  @override
  void initState() {
    authService.getUserData(context);
    super.initState();
  }

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
        home: Provider.of<UserProvider>(context).user.token.isNotEmpty
            ? Provider.of<UserProvider>(context).user.type == 'user'
                ? const BottomBar()
                : const AdminScreen()
            : const AuthScreen());
  }
}
