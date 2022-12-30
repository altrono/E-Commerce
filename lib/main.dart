import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zando/main_screens/supplier_home_screen.dart';
import 'package:zando/main_screens/welcome_screen.dart';

import 'main_screens/customer_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
