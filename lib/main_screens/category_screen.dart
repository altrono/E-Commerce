import 'package:flutter/material.dart';
import 'package:zando/categories/men_category.dart';
import 'package:zando/categories/woman_category.dart';
import 'package:zando/main_screens/home_screen.dart';

List<ItemsData> items = [
  ItemsData(label: 'men'),
  ItemsData(label: 'women'),
  ItemsData(label: 'shoes'),
  ItemsData(label: 'bags'),
  ItemsData(label: 'electronics'),
  ItemsData(label: 'accessories'),
  ItemsData(label: 'home & garden'),
  ItemsData(label: 'kids'),
  ItemsData(label: 'beauty'),
];

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    for (var element in items) {
      element.isSelected = false;
    }
    setState(() {
      items[0].isSelected = true;
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var size =  MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const FakeSearch(),
      ),
      body: Stack(
        children: [
          Positioned(
              bottom: 0,
              left: 0,
              child: sideNavigator(size),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: categoryView(size),
          ),
        ],
      ),
    );
  }

  Widget sideNavigator (Size size){
    return SizedBox(
      height: size.height * 0.8,
      width: size.width * 0.2,
      child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              _pageController.animateToPage(index, duration:const Duration(milliseconds: 100), curve: Curves.bounceInOut);
              // for (var element in items) {
              //   element.isSelected = false;
              // }
              // setState(() {
              //     items[index].isSelected = true;
              // });
            },
            child: Container(
                color:items[index].isSelected ? Colors.white : Colors.grey.shade300,
                height: 100,
                child: Center(
                    child: Text(items[index].label)),
            ),
          );
        },
      ),
    );
  }

  Widget categoryView (Size size){
    return Container(
      height: size.height * 0.8,
      width: size.width * 0.8,
      color: Colors.white,
      child: PageView(
        scrollDirection: Axis.vertical,
        controller: _pageController,
        onPageChanged: (index) {
          for (var element in items) {
            element.isSelected = false;
          }
          setState(() {
            items[index].isSelected = true;
          });
        },
        children: const [
          MenCategory(),
          WomenCategory(),
          Center(child: Text('shoes category'),),
          Center(child: Text('bags category'),),
          Center(child: Text('electronics category'),),
          Center(child: Text('accessories category'),),
          Center(child: Text('home and garden category'),),
          Center(child: Text('kids category'),),
          Center(child: Text('beauty category'),),
        ],
      ),
    );
  }

}


class ItemsData {
  String label;
  bool isSelected;
  ItemsData({required this.label, this.isSelected = false});
}