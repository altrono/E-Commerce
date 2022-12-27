import 'package:flutter/material.dart';

import '../widgets/appbar_widgets.dart';

class SubCategProducts extends StatelessWidget {
  final String maincategName;
  final String subCategName;
  const SubCategProducts({Key? key, required this.subCategName, required this.maincategName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading:const AppBarBackButton(),
        title: AppBarTitle(title: subCategName),
      ),
      body: Center(child: Text(maincategName, style:const  TextStyle(color: Colors.black),),),
    );
  }
}


