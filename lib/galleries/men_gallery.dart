import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MenGalleryScreen extends StatefulWidget {
  const MenGalleryScreen({Key? key}) : super(key: key);

  @override
  State<MenGalleryScreen> createState() => _MenGalleryScreenState();
}

class _MenGalleryScreenState extends State<MenGalleryScreen> {
  final Stream<QuerySnapshot> _productStream = FirebaseFirestore.instance.collection('products').snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _productStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if (snapshot.hasError) {
            return Text('Sum went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('Loding');
          }
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document){
              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
              return ListTile(
                leading: Image(image: NetworkImage(data['proimages'][0]),),
                title: Text(data['proname']),
                subtitle: Text('R ${data['price'].toString()})'),
              );
             }).toList(),
          );
        });
  }
}
