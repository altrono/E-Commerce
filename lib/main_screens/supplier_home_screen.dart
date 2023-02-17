import 'package:flutter/material.dart';
import 'package:zando/main_screens/category_screen.dart';
import 'package:zando/main_screens/dashboard_screen.dart';
import 'package:zando/main_screens/home_screen.dart';
import 'package:zando/main_screens/stores.dart';
import 'package:zando/main_screens/upload_product.dart';

class SupplierHomeScreen extends StatefulWidget {
  const SupplierHomeScreen({Key? key}) : super(key: key);

  @override
  State<SupplierHomeScreen> createState() => _SupplierHomeScreenState();
}

class _SupplierHomeScreenState extends State<SupplierHomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _tabs = const [
    HomeScreen(),
    CategoryScreen(),
    StoresScreen(),
    DashboardScreen(),
    UploadProductScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        selectedItemColor: Colors.black,
        // unselectedItemColor: Colors.red,
        currentIndex: _selectedIndex,
        onTap: (index){
          setState(() {
            _selectedIndex = index;
          });
        },
        items:const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home',),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Category',),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Stores',),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard',),
          BottomNavigationBarItem(icon: Icon(Icons.upload), label: 'Upload',),

        ],),
    );
  }
}
