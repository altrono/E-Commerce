import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zando/dashboard_components/edit_business.dart';
import 'package:zando/dashboard_components/manage_products.dart';
import 'package:zando/dashboard_components/my_store.dart';
import 'package:zando/dashboard_components/supplier_balance.dart';
import 'package:zando/dashboard_components/supplier_orders.dart';
import 'package:zando/dashboard_components/supplier_statics.dart';
import 'package:zando/main_screens/supplier_home_screen.dart';
import 'package:zando/widgets/appbar_widgets.dart';

import '../widgets/my_alert_dialog.dart';


List<String> labels = [
  'my store',
  'orders',
  'edit profile',
  'manage products',
  'balance',
  'statics'
];

List<IconData> icons = [
  Icons.store,
  Icons.shop_2_outlined,
  Icons.edit,
  Icons.settings_applications,
  Icons.attach_money,
  Icons.show_chart,
];


List<Widget> pages = const [
  MyStore(),
  SupplierOrders(),
  EditBusiness(),
  ManageProducts(),
  SupplierBalance(),
  SupplierStatics()
];

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const AppBarTitle(title: 'Dashboard',),
        actions: [
          IconButton(
            onPressed: () {
              MyAlertDialog.showMyDialog(
                  context: context,
                  title: 'Log Out',
                  content: 'Are you sure you want to log out?',
                  tabNo: (){
                    Navigator.pop(context);
                  },
                  tabYes: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, '/welcome_screen');


                  }
              );
            },
            icon: const Icon(Icons.logout, color: Colors.black,),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: GridView.count(
          mainAxisSpacing: 50,
          crossAxisSpacing: 50,
          crossAxisCount: 2,
          children: List.generate(6, (index) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => pages[index]));
              },
              child: Card(
                elevation: 30,
                shadowColor: Colors.black,
                color: Colors.blueGrey.withOpacity(0.7),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      icons[index],
                      size: 50,
                      color: Colors.yellowAccent,
                    ),
                    Text(
                      labels[index].toUpperCase(),
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.yellowAccent,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2,
                        fontFamily: 'Acme'
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
