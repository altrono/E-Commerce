import 'package:flutter/material.dart';
import 'package:zando/widgets/appbar_widgets.dart';

class FullScreenView extends StatefulWidget {
  final List<dynamic> imagesList;
  const FullScreenView({Key? key,required this.imagesList}) : super(key: key);

  @override
  State<FullScreenView> createState() => _FullScreenViewState();
}

class _FullScreenViewState extends State<FullScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const AppBarBackButton(),
      ),
      body: Column(
        children: [
          Center(child: Text('1/5', style: TextStyle(letterSpacing: 8, fontSize: 24),)),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5, child: PageView(
            children: List.generate(widget.imagesList.length, (index) {
              return InteractiveViewer(
                      transformationController: TransformationController(),
                      child: Image.network(widget.imagesList[index].toString(),
                  ),
              );
            }),
          ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.imagesList.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 120,
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 4,
                        color: Colors.yellow
                      ),
                      borderRadius: BorderRadius.circular(15)
                    ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(widget.imagesList[index], fit: BoxFit.cover,)));

            }),
          ),
        ],
      ),
    );
  }
}
