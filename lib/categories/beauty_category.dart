import 'package:flutter/material.dart';
import 'package:zando/utilities/categ_list.dart';
import '../widgets/categ_widgets.dart';

class BeautyCategory extends StatelessWidget {
  const BeautyCategory({Key? key}) : super(key: key);

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
                  const CategHeaderLabel(headerLabel: 'Beauty'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.68,
                    child: GridView.count(
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 70,
                      crossAxisCount: 3,
                      children: List.generate(beauty.length, (index) {
                        return SubCategModel(
                          mainCategName: 'beauty',
                          subCategName: beauty[index],
                          assetName: 'images/beauty/beauty$index.jpg',
                          subcategLabel: beauty[index],
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
            child: SliderBar(mainCategName: 'beauty',),
          ),
        ],
      ),
    );
  }
}

