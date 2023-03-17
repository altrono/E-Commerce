import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
          backgroundColor: Colors.grey.shade200,
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
                  final product = cart.getItems[index];
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Card(
                    child: SizedBox(
                      height: 100,
                      child: Row(
                        children: [
                          SizedBox(
                            height: 100,
                            width: 120,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Image.network(cart.getItems[index].imagesUrl.first),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    product.name,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey.shade700
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          'R ${product.price.toStringAsFixed(2)}',
                                          style: const TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),
                                      ),
                                      Container(
                                        height: 35,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius: BorderRadius.circular(15)
                                        ),
                                        child: Row(
                                          children: [
                                            IconButton(onPressed: (){
                                              if (product.qty > 1) {
                                                cart.reduceByOne(product);
                                              }
                                            },
                                                icon: const Icon(FontAwesomeIcons.minus, size: 16,)),
                                            Text('${product.qty.toString()}', style: TextStyle(fontSize: 20, fontFamily: 'Acme'),),
                                            IconButton(onPressed: (){
                                              if (product.qty < product.qntty) {
                                                cart.increment(product);
                                              }
                                            },
                                                icon: const Icon(FontAwesomeIcons.plus, size: 16,)),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
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


