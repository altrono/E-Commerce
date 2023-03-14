import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'package:zando/widgets/yellow_button.dart';

import '../models/product_model.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final Stream<QuerySnapshot> _productStream = FirebaseFirestore.instance.collection('products').snapshots();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: Swiper(
                      pagination: SwiperPagination(builder: SwiperPagination.dots),
                      itemBuilder: (context, index) {
                        return Image(
                            image: NetworkImage(
                              'https://cdn.shopify.com/s/files/1/0555/8897/8864/products/image_d99dbc81-b3a0-48a2-9989-368ebbcb1f45_720x514.jpg?v=1641320237',
                        ));
                      },
                      itemCount: 1),
                ),
                Text('pro nameeee', style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w600
                ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Text(
                          'ZAR ',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        Text(
                          '100.00',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: (){},
                        icon: const Icon(
                          Icons.favorite_border_outlined,
                          color: Colors.red,
                          size: 30,
                        ),
                    ),
                  ],
                ),
                const Text(
                  '99 pieces available int stock',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blueGrey,
                  ),
                ),
                const ProDetailsHeader(label: '  Item Description  ',),

                Text(
                    'pro description lorem ipsum dum nonu rert poir que donc lors que dout gout pour request ds',
                    textScaleFactor: 1.1,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueGrey.shade800,
                    ),
                ),

                const ProDetailsHeader(label: '  Similar Items  ',),
                SizedBox(
                  child: StreamBuilder<QuerySnapshot>(
                      stream: _productStream,
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return const Center(child: Text('Sum went wrong'));
                        }
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: Text('Loading...'));
                        }

                        if (snapshot.data!.docs.isEmpty){
                          return const Center(
                            child: Text(
                              'This category \nhas no items yet!',
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Acme',
                                  letterSpacing: 1.5
                              ),
                              textAlign: TextAlign.center,
                            ),
                          );
                        }
                        return SingleChildScrollView(
                          child: StaggeredGridView.countBuilder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: snapshot.data!.docs.length,
                              crossAxisCount: 2,
                              itemBuilder: (context, index){
                                return ProductModel(products: snapshot.data!.docs[index],);
                              },
                              staggeredTileBuilder: (context) => const StaggeredTile.fit(1)),
                        );
                      }),
                )
              ],
            ),
          ),
          bottomSheet: Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.store)),
                    SizedBox(width: 20,),
                    IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart)),
                  ],
                ),
                YellowButton(label: 'ADD TO CART', onPressed: (){}, width: 0.55)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProDetailsHeader extends StatelessWidget {
  final String label;
  const ProDetailsHeader({
    super.key, required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          SizedBox(
            height: 40,
            width: 40,
            child: Divider(
              color: Colors.yellow.shade900,
              thickness: 1,
            ),
          ),
          Text(
            label,
            style:TextStyle(
                color: Colors.yellow.shade900,
                fontSize: 20,
                fontWeight: FontWeight.w600
            ),
          ),
          SizedBox(
            height: 40,
            width: 40,
            child: Divider(
              color: Colors.yellow.shade900,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
