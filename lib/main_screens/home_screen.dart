import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zando/galleries/beauty_gallery.dart';
import 'package:zando/galleries/kids_gallery.dart';
import 'package:zando/galleries/shoes_gallery.dart';
import 'package:zando/galleries/women-category.dart';
import 'package:zando/minor_screen/search_screen.dart';

import '../galleries/men_gallery.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade100.withOpacity(0.5),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title:const FakeSearch(),
          bottom:const TabBar(
            isScrollable: true,
            indicatorColor: Colors.yellow,
            indicatorWeight: 8,
            tabs: [
              RepeatedTab(name: 'Men',),
              RepeatedTab(name: 'Woman',),
              RepeatedTab(name: 'Shoes',),
              RepeatedTab(name: 'Bags',),
              RepeatedTab(name: 'Electronics',),
              RepeatedTab(name: 'Accessories',),
              RepeatedTab(name: 'Home & Garden',),
              RepeatedTab(name: 'Kids',),
              RepeatedTab(name: 'Beauty',),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            MenGalleryScreen(),
            WomenGalleryScreen(),
            ShoesGalleryScreen(),
            Center(child: Text('Bag screen'),),
            Center(child: Text('Electronics screen'),),
            Center(child: Text('Accessories screen'),),
            Center(child: Text('Home & Garden screen'),),
            KidsGalleryScreen(),
            BeautyGalleryScreen(),
          ],
        ),
      ),
    );
  }
}

class FakeSearch extends StatelessWidget {
  const FakeSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen()));
      },
      child: Container(
        height: 35,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.yellow, width: 1.4),
          borderRadius:const BorderRadius.all(Radius.circular(25)),
        ),
        child: Row(
          children:  [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Icon(Icons.search, color: Colors.grey,),
            ),
            const Text('What are you looking for', style: TextStyle(fontSize: 16, color: Colors.grey),),
            const Spacer(),
            Container(
              height: 32,
              width: 75,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Center(child: Text('Search', style: TextStyle(fontSize: 16, color: Colors.grey),)),
            ),

          ],
        ),
      ),
    );
  }
}

class RepeatedTab extends StatelessWidget {
  final String name;
  const RepeatedTab({
    super.key,
    required this.name
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        name,
        style: TextStyle(color: Colors.grey.shade600),
      ),
    );
  }
}
