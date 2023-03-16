import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zando/customer_screens/customer_orders.dart';
import 'package:zando/customer_screens/wishlist.dart';
import 'package:zando/main_screens/cart.dart';
import 'package:zando/widgets/appbar_widgets.dart';

import '../widgets/my_alert_dialog.dart';

class ProfileScreen extends StatefulWidget {
  final String documentId;
  const ProfileScreen({Key? key, required this.documentId}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  CollectionReference customers = FirebaseFirestore.instance.collection('customers');
  CollectionReference anonymous = FirebaseFirestore.instance.collection('anonymous');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future:FirebaseAuth.instance.currentUser!.isAnonymous ? anonymous.doc(widget.documentId).get() : customers.doc(widget.documentId).get(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return const Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
            return Scaffold(
              backgroundColor: Colors.grey.shade300,
              body: Stack(
                children: [
                  Container(
                    height: 230,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.yellow, Colors.brown],
                      ),
                    ),
                  ),

                  CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        pinned: true,
                        centerTitle: true,
                        elevation: 0,
                        backgroundColor: Colors.white,
                        expandedHeight: 140,
                        flexibleSpace: LayoutBuilder(
                          builder: (context, constraints){
                            return FlexibleSpaceBar(
                              title: AnimatedOpacity(
                                duration: const Duration(milliseconds: 200),
                                opacity: constraints.biggest.height <= 120 ? 1 : 0,
                                child: const Text(
                                  'Account',
                                  style: TextStyle(
                                      color: Colors.black
                                  ),
                                ),
                              ),
                              background: Container(
                                decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.yellow,
                                        Colors.brown,
                                      ],
                                    )
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 25.0, left: 30.0),
                                  child: Row(
                                    children: [
                                      data['profileimage'] == '' ?
                                      CircleAvatar(
                                        radius: 50,
                                        backgroundImage: AssetImage('images/inapp/guest.jpg'),
                                      ) :
                                      CircleAvatar(
                                        radius: 50,
                                        backgroundImage: NetworkImage(data['profileimage']),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 25.0),
                                        child: Text(
                                          data['name'] == '' ? 'guest'.toUpperCase() : data['name'].toUpperCase(),
                                          style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            Container(
                              height: 80,
                              width: MediaQuery.of(context).size.width * 0.9,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.black54,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(50),
                                          bottomLeft: Radius.circular(50),
                                        )
                                    ),
                                    child: TextButton(
                                      child: SizedBox(
                                        height: 40,
                                        width: MediaQuery.of(context).size.width * 0.2,
                                        child: const Center(
                                          child: Text(
                                            'Cart',
                                            style: TextStyle(
                                              color: Colors.yellow,
                                              fontSize: 16,

                                            ),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen(
                                          back: AppBarBackButton(),
                                        )));
                                      },
                                    ),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.yellow,
                                    ),
                                    child: TextButton(
                                      child: SizedBox(
                                        height: 40,
                                        width: MediaQuery.of(context).size.width * 0.2,
                                        child: const Center(
                                          child: Text(
                                            'Orders',
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 16,

                                            ),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => const CustomerOrders()));
                                      },
                                    ),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.black54,
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(50),
                                          bottomRight: Radius.circular(50),
                                        )
                                    ),
                                    child: TextButton(
                                      child: SizedBox(
                                        height: 40,
                                        width: MediaQuery.of(context).size.width * 0.2,
                                        child: const Center(
                                          child: Text(
                                            'Wishlist',
                                            style: TextStyle(
                                              color: Colors.yellow,
                                              fontSize: 16,

                                            ),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => const WishlistScreen()));
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              color: Colors.grey.shade300,
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 150,
                                    child: Image(image: AssetImage('images/inapp/logo.jpg')),
                                  ),
                                  const ProfileHeaderLabel(headerLabel: '  Account Info  '),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      height: 260,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(16.00),
                                      ),
                                      child: Column(
                                        children:  [
                                          RepeatedListTile(
                                            title: 'Email Address',
                                            onPressed: (){},
                                            icon: Icons.email,
                                            subTitle: data['email'] == '' ? "example@gmail.com" : data['email'],
                                          ),
                                          const Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 40.0),
                                            child: Divider(
                                              color: Colors.yellow,
                                              thickness: 1,
                                            ),
                                          ),
                                          RepeatedListTile(
                                              title: 'Phone No.',
                                              subTitle: data['phone'] == '' ? 'example: +27111' : data['phone'],
                                              icon: Icons.phone),

                                          const Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 40.0),
                                            child: Divider(
                                              color: Colors.yellow,
                                              thickness: 1,
                                            ),
                                          ),
                                          RepeatedListTile(
                                              title: 'Address',
                                              subTitle: data['address'] == '' ? 'example: Rosebank CTP SA' : data['address'],
                                              icon: Icons.location_pin),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const ProfileHeaderLabel(headerLabel: '  Account Settings  '),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      height: 260,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(16.00),
                                      ),
                                      child: Column(
                                        children: [
                                          const RepeatedListTile(
                                            title: 'Edit Profile',
                                            subTitle: '',
                                            icon: Icons.edit,
                                          ),
                                          const YellowDivider(),
                                          RepeatedListTile(
                                            title: 'Change Password.',
                                            icon: Icons.lock,
                                            onPressed: (){},
                                          ),
                                          const YellowDivider(),
                                          RepeatedListTile(
                                            title: 'Log Out',
                                            icon: Icons.logout,
                                            onPressed: () async {
                                              MyAlertDialog.showMyDialog(
                                                  context: context,
                                                  title: 'Log Out',
                                                  content: 'Are you sure you want to log out?',
                                                  tabNo: (){
                                                    Navigator.pop(context);
                                                  },
                                                  tabYes: () async {
                                                    await FirebaseAuth.instance.signOut();
                                                    Navigator.pop(context);
                                                    Navigator.pushReplacementNamed(context, '/welcome_screen');


                                                  }
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator(color: Colors.purple,),);
    });

  }
}





class YellowDivider extends StatelessWidget {
  const YellowDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.symmetric(horizontal: 40.0),
      child: Divider(
        color: Colors.yellow,
        thickness: 1,
      ),
    );
  }
}

class RepeatedListTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icon;
  final Function()? onPressed;
  const RepeatedListTile({
    super.key,
    required this.title,
    this.onPressed,
    required this.icon,
    this.subTitle = ''
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child:  ListTile(
        leading: Icon(icon),
        subtitle: Text(subTitle),
        title: Text(title),
      ),
    );
  }
}

class ProfileHeaderLabel extends StatelessWidget {
  final String headerLabel;
  const ProfileHeaderLabel({
    super.key,
    required this.headerLabel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
            width: 50,
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
          Text(
              headerLabel,
              style:const TextStyle(
                color: Colors.grey,
                fontSize: 24,
                fontWeight: FontWeight.w600
              ),
          ),
          const SizedBox(
            height: 40,
            width: 50,
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
