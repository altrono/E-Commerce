import 'package:flutter/material.dart';

import '../widgets/auth_widgets.dart';


class CustomerRegisterScreen extends StatefulWidget {
  const CustomerRegisterScreen({Key? key}) : super(key: key);

  @override
  State<CustomerRegisterScreen> createState() => _CustomerRegisterScreenState();
}

class _CustomerRegisterScreenState extends State<CustomerRegisterScreen> {

  late String name;
  late String email;
  late String password;

  final  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool passwordVisible = false;


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
              child: Form(
                key: _formKey,
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
                          onChanged: (value) {
                            name = value;
                          },
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'please enter your full name';
                            }
                            return null;
                          },
                          decoration: textFormDecoration.copyWith(
                            labelText: 'Full Name',
                            hintText: 'Enter your full name'
                          ),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10,),
                      child: TextFormField(
                          onChanged: (value){
                            email = value;
                          },
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'please enter your email address';
                            } else if (val.isValidEmail() == false){
                              return 'invalid email';
                            } else if (val.isValidEmail() == true) {
                              return null;
                            }
                            return null;
                          },
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
                          onChanged: (value){
                            password = value;
                          },
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'please enter your password';
                            }
                            return null;
                          },
                          obscureText: passwordVisible ? false : true,
                          decoration: textFormDecoration.copyWith(
                            suffixIcon: IconButton(
                                onPressed: (){
                                  setState(() {
                                    passwordVisible = !passwordVisible;
                                  });
                                },
                                icon: Icon(passwordVisible ? Icons.visibility : Icons.visibility_off, color: Colors.purple,)),
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
                      onPressed: (){
                        if (_formKey.currentState!.validate()) {
                          print('All good');
                        } else {
                          print('Not Valid');
                        }
                      },
                      mainButtonLabel: 'Sign Up',
                    )

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(r'^([a-zA-Z0-9]+)([\-\_\.]*)([a-zA-Z0-9]*)[@][a-zA-Z0-9]{2,}[\.][a-zA-Z0-9]{2,3}[\.]*[a-z]*$').hasMatch(this);
  }
}