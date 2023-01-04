import 'package:flutter/material.dart';
import 'package:zando/widgets/appbar_widgets.dart';

class SupplierStatics extends StatelessWidget {
  const SupplierStatics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const AppBarTitle(title: 'Supplier Statics'),
        leading: const AppBarBackButton(),
      ),
    );
  }
}