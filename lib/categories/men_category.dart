
import 'package:flutter/material.dart';
import 'package:zando/utilities/categ_list.dart';

import '../minor_screen/sub_categ_products.dart';

class MenCategory extends StatefulWidget {
  const MenCategory({Key? key}) : super(key: key);

  @override
  State<MenCategory> createState() => _MenCategoryState();
}

class _MenCategoryState extends State<MenCategory> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.75,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Padding(
                    padding:  EdgeInsets.all(30.0),
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
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return SubCategProducts(
                                  maincategName: 'Men',
                                  subCategName: men[index],);
                              }));
                            },
                            child: Column(
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
                            ),
                          );
                        }),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width * 0.05,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.brown.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(50),),
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                                '<<',
                                style: TextStyle(
                                  color: Colors.brown,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 10
                                ),
                            ),
                            Text(
                                'Name '.toUpperCase(),
                                style: const TextStyle(
                                    color: Colors.brown,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 10
                                ),
                            ),
                            const Text(
                                '>>',
                                style: TextStyle(
                                    color: Colors.brown,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 10
                                ),
                            ),
                          ],
                        ),
                      ),
                  ),
                ),
              ),
          ),
        ],
      ),
    );
  }
}
