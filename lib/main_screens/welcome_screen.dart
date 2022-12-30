import 'package:flutter/material.dart';

import '../widgets/yellow_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
              const Text(
                'WELCOME',
                style: TextStyle(color: Colors.white, fontSize: 30,),
              ),
              const SizedBox(
                height: 120,
                width: 200,
                child: Image(image: AssetImage('images/inapp/logo.jpg')),
              ),
              const Text(
                'SHOP',
                style: TextStyle(color: Colors.white, fontSize: 30,),
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
                            const Image(image: AssetImage('images/inapp/logo.jpg')),
                            YellowButton(
                              width: 0.25,
                              onPressed: (){},
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
                            onPressed: (){},
                            label: 'Sign Up',
                          ),
                        ),
                        YellowButton(
                          width: 0.25,
                          onPressed: (){},
                          label: 'Log In',
                        ),
                        const Image(image: AssetImage('images/inapp/logo.jpg')),
                      ],
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: Container(
                  height: 82,
                  decoration: const BoxDecoration(color: Colors.white38),
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
                        label: 'Google',
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
