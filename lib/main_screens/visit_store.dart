import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'package:zando/widgets/appbar_widgets.dart';

import '../models/product_model.dart';

class VisitStore extends StatefulWidget {
  final String suppId;
  const VisitStore({Key? key, required this.suppId}) : super(key: key);

  @override
  State<VisitStore> createState() => _VisitStoreState();
}

class _VisitStoreState extends State<VisitStore> {
  bool following = false;

  @override
  Widget build(BuildContext context) {
    CollectionReference stores = FirebaseFirestore.instance.collection('suppliers');

    Stream<QuerySnapshot> _productStream = FirebaseFirestore.instance
        .collection('products')
        .where('sid', isEqualTo: widget.suppId)
        .snapshots();

    return FutureBuilder<DocumentSnapshot>(
        future: stores.doc(widget.suppId).get(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wron');
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            print(widget.suppId);
            return const Text('Document doesnt exist');
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
            return Scaffold(
              backgroundColor: Colors.blueGrey,
                appBar: AppBar(
                  leading: const YellowBackButton(),
                  toolbarHeight: 100,
                  flexibleSpace: Image.asset('images/inapp/coverimage.jpg', fit: BoxFit.cover,),
                  title: Row(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 4, color: Colors.yellow),
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(data['storelogo'], fit: BoxFit.cover,)),
                      ),
                      SizedBox(
                        height: 100,
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(data['storename'].toUpperCase(), style: TextStyle(fontSize: 20, color: Colors.yellow),),
                                ),
                              ],
                            ),
                            data['sid'] == FirebaseAuth.instance.currentUser!.uid
                                ?  Container(
                              height: 30,
                              width: MediaQuery.of(context).size.width * 0.3,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 3,
                                    color: Colors.black54,
                                  ),
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(12)
                              ),
                              child: MaterialButton(
                                onPressed: (){

                                },
                                child:  Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Edit',
                                      style: TextStyle(fontSize: 10,),
                                    ),
                                    Icon(Icons.edit)
                                  ],
                                ),
                              ),

                            )
                                :  Container(
                              height: 30,
                              width: MediaQuery.of(context).size.width * 0.3,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 3,
                                  color: Colors.black,
                                ),
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(25)
                              ),
                              child: MaterialButton(
                                onPressed: (){
                                  setState(() {
                                    following = !following;
                                  });
                                },
                                child: following == true ? const Text(
                                  'FOLLOW',
                                    style: TextStyle(fontSize: 10),
                                ) : const Text('FOLLOWING', style: TextStyle(fontSize: 10),),
                              ),

                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: StreamBuilder<QuerySnapshot>(
                      stream: _productStream,
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return const Center(child: Text('Sum went wrong'));
                        }
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Material(child: Center(child: Text('Loading...')));
                        }

                        if (snapshot.data!.docs.isEmpty){
                          return const Center(
                            child: Text(
                              'This Store \nhas no items yet!',
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
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Colors.green,
                  child: const Icon(FontAwesomeIcons.whatsapp, color: Colors.white, size: 30,),
                ),
            );
          }

          return Material(
            child:  Center(
              child: Text('Loading...'),
            ),
          );
        });
  }
}
