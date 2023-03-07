import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../models/product_model.dart';

class BeautyGalleryScreen extends StatefulWidget {
  const BeautyGalleryScreen({Key? key}) : super(key: key);

  @override
  State<BeautyGalleryScreen> createState() => BeautyGalleryScreenState();
}

class BeautyGalleryScreenState extends State<BeautyGalleryScreen> {
  final Stream<QuerySnapshot> _productStream = FirebaseFirestore.instance.collection('products').where(
      'maincateg',
      isEqualTo: 'beauty'
  ).snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
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
        });
  }
}


