import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../models/product_model.dart';
import '../widgets/appbar_widgets.dart';

class SubCategProducts extends StatefulWidget {
  final String maincategName;
  final String subCategName;
  const SubCategProducts({Key? key, required this.subCategName, required this.maincategName}) : super(key: key);

  @override
  State<SubCategProducts> createState() => _SubCategProductsState();
}

class _SubCategProductsState extends State<SubCategProducts> {

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> _productsStream = FirebaseFirestore.instance
        .collection('products')
        .where('maincateg', isEqualTo: widget.maincategName)
        .where('subcateg', isEqualTo: widget.subCategName)
        .snapshots();
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading:const AppBarBackButton(),
        title: AppBarTitle(title: widget.subCategName),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: _productsStream,
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
    );
  }
}


