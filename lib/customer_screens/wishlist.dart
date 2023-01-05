import 'package:flutter/material.dart';
import 'package:zando/widgets/appbar_widgets.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const AppBarTitle(title: 'Wishlist Screen'),
        leading: const AppBarBackButton(),
      ),
    );
  }
}