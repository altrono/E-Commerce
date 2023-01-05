import 'package:flutter/material.dart';
import 'package:zando/widgets/appbar_widgets.dart';

class CustomerOrders extends StatelessWidget {
  const CustomerOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const AppBarTitle(title: 'Customer Orders'),
        leading: const AppBarBackButton(),
      ),
    );
  }
}