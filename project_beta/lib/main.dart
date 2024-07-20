import 'package:flutter/material.dart';
import 'package:project_beta/homepage.dart';
import 'package:project_beta/login.dart';
import 'package:project_beta/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const Login(),
        '/homepage': (context) => const Homepage(),
        '/register': (context) => const Register()
      },
    );
  }
}
