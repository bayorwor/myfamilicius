import 'package:famliciousapp/views/auth/login_view.dart';
import 'package:famliciousapp/views/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FamliciousApp());
}

class FamliciousApp extends StatelessWidget {
  const FamliciousApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Famlicious App",
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            color: Colors.white,
            elevation: 0,
            foregroundColor: Colors.black,
          )),
      home: LoginView(),
    );
  }
}
