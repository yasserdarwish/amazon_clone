import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AmazonCloneApp());
}

class AmazonCloneApp extends StatelessWidget {
  const AmazonCloneApp({super.key});

  // This widget is the root of your application.
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
        // useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Hello'),
        ),
        body: Column(
          children: [
            const Center(child: Text('This is a text')),
            ElevatedButton(onPressed: () {}, child: const Text('Click'))
          ],
        ),
      ),
    );
  }
}
