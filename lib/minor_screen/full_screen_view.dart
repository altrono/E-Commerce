import 'package:flutter/material.dart';
import 'package:zando/widgets/appbar_widgets.dart';

class FullScreenView extends StatefulWidget {
  final List<dynamic> imagesList;
  const FullScreenView({Key? key,required this.imagesList}) : super(key: key);

  @override
  State<FullScreenView> createState() => _FullScreenViewState();
}

class _FullScreenViewState extends State<FullScreenView> {
  final PageController _controller = PageController();

  int index = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const AppBarBackButton(),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(child: Text('${index + 1}/${widget.imagesList.length}', style: TextStyle(letterSpacing: 8, fontSize: 24),)),
            SizedBox(
              height: size.height * 0.5,
              child: PageView(
                onPageChanged: (value) {
                  setState(() {
                    index = value;
                  });
                },
                controller: _controller,
                children: images(),
              ),
            ),
            SizedBox(
              height: size.height * 0.2,
              child: imageView(),
            ),
          ],
        ),
      ),
    );
  }


  List<Widget> images() {
    return List.generate(widget.imagesList.length, (index) {
      return InteractiveViewer(
        transformationController: TransformationController(),
        child: Image.network(widget.imagesList[index].toString(),
        ),
      );
    });
  }


  Widget imageView(){
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.imagesList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              _controller.jumpToPage(index);
            },
            child: Container(
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
                    child: Image.network(widget.imagesList[index], fit: BoxFit.cover,))),
          );

        });
  }
}
