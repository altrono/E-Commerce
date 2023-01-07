import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zando/customer_screens/customer_orders.dart';
import 'package:zando/customer_screens/wishlist.dart';
import 'package:zando/main_screens/cart.dart';
import 'package:zando/widgets/appbar_widgets.dart';

import '../widgets/my_alert_dialog.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
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
                              const CircleAvatar(
                                radius: 50,
                                backgroundImage: AssetImage('images/inapp/guest.jpg'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 25.0),
                                child: Text(
                                  'guest'.toUpperCase(),
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
                                      fontSize: 20,

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
                                      fontSize: 20,

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
                                      fontSize: 20,

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
                                    subTitle: 'hbotem16@gmail.com',
                                  ),
                                  const Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                                    child: Divider(
                                      color: Colors.yellow,
                                      thickness: 1,
                                    ),
                                  ),
                                  const RepeatedListTile(
                                      title: 'Phone No.',
                                      subTitle: '+27 82 222 222',
                                      icon: Icons.phone),

                                  const Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                                    child: Divider(
                                      color: Colors.yellow,
                                      thickness: 1,
                                    ),
                                  ),
                                  const RepeatedListTile(
                                      title: 'Address',
                                      subTitle: '22 Flora Village Hamburg Gauteng SA',
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
