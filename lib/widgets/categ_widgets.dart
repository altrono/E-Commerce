import 'package:flutter/material.dart';

import '../minor_screen/sub_categ_products.dart';

class SliderBar extends StatelessWidget {
  final String mainCategName;
  const SliderBar({
    super.key,
    required this.mainCategName,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  mainCategName.toUpperCase(),
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
    );
  }
}

class SubCategModel extends StatelessWidget {
  final String mainCategName;
  final String subCategName;
  final String assetName;
  final String subcategLabel;
  const SubCategModel({
    super.key,
    required this.mainCategName,
    required this.subCategName,
    required this.assetName,
    required this.subcategLabel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return SubCategProducts(
            maincategName: mainCategName,
            subCategName: subCategName,);
        }));
      },
      child: Column(
        children: [
          SizedBox(
            height: 70,
            width: 70,
            child: Image(
              image: AssetImage(assetName),
            ),
          ),
          Text(subcategLabel),
        ],
      ),
    );
  }
}

class CategHeaderLabel extends StatelessWidget {
  final String headerLabel;
  const CategHeaderLabel({
    super.key,
    required this.headerLabel
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(30.0),
      child: Text(
        headerLabel,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 1.5),
      ),
    );
  }
}