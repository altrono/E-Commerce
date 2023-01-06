import 'package:flutter/material.dart';

import '../widgets/auth_widgets.dart';

class CustomerRegisiterScreen extends StatefulWidget {
  const CustomerRegisiterScreen({Key? key}) : super(key: key);

  @override
  State<CustomerRegisiterScreen> createState() => _CustomerRegisiterScreenState();
}

class _CustomerRegisiterScreenState extends State<CustomerRegisiterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            reverse: true,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(

                children: [
                  const AuthHeaderLabel(headerLabel: 'Sign Up',),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
                        child: CircleAvatar(radius: 60, backgroundColor: Colors.purpleAccent,),
                      ),
                      Column(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                              ),
                              onPressed: (){},
                            ),
                          ),
                          const SizedBox(height: 6,),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                              ),
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.photo,
                                color: Colors.white,
                              ),
                              onPressed: (){},
                            ),
                          )
                        ],
                      )
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,),
                    child: TextFormField(
                        decoration: textFormDecoration.copyWith(
                          labelText: 'Full Name',
                          hintText: 'Enter your full name'
                        ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,),
                    child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: textFormDecoration.copyWith(
                            labelText: 'Email Address',
                            hintText: 'Enter your email Address'
                        ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,),
                    child: TextFormField(
                        decoration: textFormDecoration.copyWith(
                          labelText: 'Password',
                          hintText: 'Enter your password'
                        ),
                    ),
                  ),

                  HaveAccount(
                    actionLabel: 'Log In',
                    haveAccount: 'Already have an account? ',
                    onpressed: (){},
                  ),

                  AuthMainButton(
                    onPressed: (){},
                    mainButtonLabel: 'Sign Up',
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

