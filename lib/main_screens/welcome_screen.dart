import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:zando/main_screens/supplier_home_screen.dart';
import '../widgets/yellow_button.dart';

const textColors = [
  Colors.yellowAccent,
  Colors.redAccent,
  Colors.blueAccent,
  Colors.green,
  Colors.purple,
  Colors.teal
];

const textStyles = TextStyle(
  fontSize: 45,
  fontWeight: FontWeight.bold,
  fontFamily: 'Acme',
);

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _controller.repeat();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/inapp/bgimage.jpg'),
              fit: BoxFit.cover
          ),
        ),
        constraints:const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedTextKit(
                  animatedTexts: [
                    ColorizeAnimatedText(
                        'WELCOME',
                        textStyle: textStyles,
                        colors: textColors,
                    ),
                    ColorizeAnimatedText(
                        'ZANDO SHOP',
                        textStyle: textStyles,
                        colors: textColors,
                    ),
                  ],
                  isRepeatingAnimation: true,
                  repeatForever: true,
              ),
              const SizedBox(
                height: 120,
                width: 200,
                child: Image(image: AssetImage('images/inapp/logo.jpg')),
              ),
              SizedBox(
                height: 80,
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlueAccent,
                    fontFamily: 'Acme'),
                  child: AnimatedTextKit(
                      repeatForever: true,
                      isRepeatingAnimation: true,
                      animatedTexts: [
                        RotateAnimatedText(
                          'ZANDO  STORE',
                        ),
                        RotateAnimatedText(
                          'SHOP',
                        ),
                        RotateAnimatedText(
                          'BUY',
                        ),
                      ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        decoration:const BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50.00),
                            bottomLeft: Radius.circular(50.0),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            'Suppliers only',
                            style: TextStyle(color: Colors.yellowAccent, fontSize: 26, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      const SizedBox(height: 6,),
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration:const BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50.00),
                            bottomLeft: Radius.circular(50.0),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AnimatedLogo(controller: _controller),
                            YellowButton(
                              width: 0.25,
                              onPressed: (){
                                Navigator.pushReplacementNamed(
                                    context,
                                    '/supplier_home_screen',
                                );
                              },
                              label: 'Log In',
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: YellowButton(
                                width: 0.25,
                                onPressed: (){},
                                label: 'Sign Up',
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration:const BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50.00),
                        bottomRight: Radius.circular(50.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: YellowButton(
                            width: 0.25,
                            onPressed: (){
                              Navigator.pushReplacementNamed(context, '/customer_home_screen');
                            },
                            label: 'Log In',
                          ),
                        ),
                        YellowButton(
                          width: 0.25,
                          onPressed: (){},
                          label: 'Sign Up',
                        ),
                        AnimatedLogo(controller: _controller),
                      ],
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: Container(
                  height: 82,
                  decoration: BoxDecoration(color: Colors.white38.withOpacity(0.3)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GoogleFacebookLogin(
                        child: Image(
                            image: AssetImage('images/inapp/google.jpg')),
                        label: 'Google',
                        onPressed: (){},
                      ),
                      GoogleFacebookLogin(
                        child: Image(
                            image: AssetImage('images/inapp/facebook.jpg')),
                        label: 'Facebook',
                        onPressed: (){},
                      ),
                      GoogleFacebookLogin(
                        child: Icon(Icons.person, size: 55, color: Colors.lightBlueAccent,),
                        label: 'Guest',
                        onPressed: (){},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class AnimatedLogo extends StatelessWidget {
  const AnimatedLogo({
    super.key,
    required AnimationController controller,
  }) : _controller = controller;

  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller.view,
        builder: (context, child) {
          return Transform.rotate(angle: _controller.value * 2 * pi, child: child,);
        },
        child:const  Image(image: AssetImage('images/inapp/logo.jpg')),
    );
  }
}

class GoogleFacebookLogin extends StatelessWidget {
  final String label;
  final Function() onPressed;
  final Widget child;

  const GoogleFacebookLogin({
    super.key,
    required this.onPressed,
    required this.label,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: onPressed,
        child: Column(
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: child),
            Text(
              label,
              style: const TextStyle(color: Colors.white),)
          ],
        ),
      ),
    );
  }
}
