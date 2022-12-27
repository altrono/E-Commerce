import 'package:flutter/material.dart';
import 'package:zando/utilities/categ_list.dart';

import '../minor_screen/sub_categ_products.dart';

class WomenCategory extends StatefulWidget {
  const WomenCategory({Key? key}) : super(key: key);

  @override
  State<WomenCategory> createState() => _WomenCategoryState();
}

class _WomenCategoryState extends State<WomenCategory> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Text(
            'Women',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 1.5),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.68,
          child: GridView.count(
            crossAxisSpacing: 15,
            mainAxisSpacing: 70,
            crossAxisCount: 3,
            children: List.generate(men.length, (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SubCategProducts(
                      maincategName: 'Women',
                      subCategName: women[index],);
                  }));
                },
                child: Column(
                  children: [
                    SizedBox(
                      height: 70,
                      width: 70,
                      child: Image(
                        image: AssetImage('images/women/women$index.jpg'),
                      ),
                    ),
                    Text(women[index]),
                  ],
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
