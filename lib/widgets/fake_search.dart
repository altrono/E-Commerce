import 'package:flutter/material.dart';

import '../minor_screen/search_screen.dart';

class FakeSearch extends StatelessWidget {
  const FakeSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen()));
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
            const Text('What are you looking for', style: TextStyle(fontSize: 18, color: Colors.grey),),
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