import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zando/main_screens/visit_store.dart';
import 'package:zando/widgets/appbar_widgets.dart';

class StoresScreen extends StatelessWidget {
  const StoresScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const AppBarTitle(title: 'Stores',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('suppliers').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('error');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData) {
              return GridView.builder(
                  itemCount: snapshot.data!.docs.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 25,
                      crossAxisSpacing: 25,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => VisitStore(suppId: snapshot.data!.docs[index]['sid'],)));
                      } ,
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              SizedBox(
                                height: 120,
                                width: 120,
                                child: Image.asset('images/inapp/store.jpg'),
                              ),
                              Positioned(
                                  left: 10,
                                  bottom: 28,
                                  child: SizedBox(
                                    height: 50,
                                    width: 100,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: Image.network(snapshot.data!.docs[index]['storelogo'], fit: BoxFit.cover,),
                                        )),
                              ))
                            ],
                          ),
                          Text(
                              snapshot.data!.docs[index]['storename'].toLowerCase(),
                              style: const TextStyle(
                                fontFamily: 'Akaya',
                                fontSize: 26,

                              ),
                          )
                        ],
                      ),
                    );
                  });
            }

            return Center(child: Text('No Stores'));

          },
        ),
      ),
    );
  }
}
