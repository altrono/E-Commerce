import 'package:flutter/material.dart';
import 'package:zando/utilities/categ_list.dart';
import '../widgets/categ_widgets.dart';

class HomeAndGardenCategory extends StatelessWidget {
  const HomeAndGardenCategory({Key? key}) : super(key: key);

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
                  const CategHeaderLabel(headerLabel: 'Home & Garden'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.68,
                    child: GridView.count(
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 70,
                      crossAxisCount: 3,
                      children: List.generate(homeandgarden.length, (index) {
                        return SubCategModel(
                          mainCategName: 'homeandgarden',
                          subCategName: homeandgarden[index],
                          assetName: 'images/homegarden/home$index.jpg',
                          subcategLabel: homeandgarden[index],
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            bottom: 0,
            right: 0,
            child: SliderBar(mainCategName: 'Home and Garden',),
          ),
        ],
      ),
    );
  }
}

