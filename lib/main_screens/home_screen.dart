import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const CupertinoSearchTextField(),
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
            Center(child: Text('men screen'),),
            Center(child: Text('women screen'),),
            Center(child: Text('shoes screen'),),
            Center(child: Text('Bag screen'),),
            Center(child: Text('Electronics screen'),),
            Center(child: Text('Accessories screen'),),
            Center(child: Text('Home & Garden screen'),),
            Center(child: Text('Kids screen'),),
            Center(child: Text('Beauty screen'),),
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
