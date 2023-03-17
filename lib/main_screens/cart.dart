import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zando/providers/cart_provider.dart';
import 'package:zando/widgets/appbar_widgets.dart';
import '../widgets/yellow_button.dart';

class CartScreen extends StatefulWidget {
  final Widget? back;
  const CartScreen({Key? key, this.back}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.white,
            leading: widget.back,
            title:const AppBarTitle(title: 'Cart'),
            actions: [
              IconButton(onPressed: (){}, icon: Icon(Icons.delete_forever, color: Colors.black,))
            ],
          ),
          body: Consumer<Cart>(builder: (context, cart, child) {
            return ListView.builder(
                itemCount: cart.count,
                itemBuilder: (context, index) {
                return Text(cart.getItems[index].name);
            });
          }),
          bottomSheet: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                     Text(
                      'Total: R ',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      '00.00',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
                YellowButton(
                  width: 0.45,
                  onPressed: (){},
                  label: 'CHECK OUT',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


