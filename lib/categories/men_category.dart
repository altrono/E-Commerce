import 'package:flutter/material.dart';
import 'package:zando/utilities/categ_list.dart';

class MenCategory extends StatefulWidget {
  const MenCategory({Key? key}) : super(key: key);

  @override
  State<MenCategory> createState() => _MenCategoryState();
}

class _MenCategoryState extends State<MenCategory> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Text(
            'Men',
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
                return Column(
                  children: [
                    SizedBox(
                      height: 70,
                      width: 70,
                      child: Image(
                        image: AssetImage('images/men/men$index.jpg'),
                      ),
                    ),
                    Text(men[index]),
                  ],
                );
              }),
          ),
        ),
      ],
    );
  }
}
