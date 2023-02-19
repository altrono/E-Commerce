import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zando/auth/customer_login.dart';
import 'package:zando/auth/customer_signup.dart';
import 'package:zando/auth/supplier_signup.dart';
import 'package:zando/main_screens/supplier_home_screen.dart';
import 'package:zando/main_screens/welcome_screen.dart';
import 'auth/supplier_login.dart';
import 'main_screens/customer_home_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:FirebaseAuth.instance.currentUser == null ? '/welcome_screen': '/supplier_home_screen',
      routes: {
        '/welcome_screen': (context) => const WelcomeScreen(),
        '/customer_home_screen': (context) => const CustomerHomeScreen(),
        '/supplier_home_screen': (context) => const SupplierHomeScreen(),
        '/customer_signup': (context) => const CustomerRegisterScreen(),
        '/customer_login': (context) => const CustomerLoginScreen(),
        '/supplier_login': (context) => const SupplierLoginScreen(),
        '/supplier_signup': (context) => const SupplierRegisterScreen(),
      },
    );
  }
}
