import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/auth_widgets.dart';
import '../widgets/snackbar.dart';



class CustomerLoginScreen extends StatefulWidget {
  const CustomerLoginScreen({Key? key}) : super(key: key);

  @override
  State<CustomerLoginScreen> createState() => _CustomerLoginScreenState();
}

class _CustomerLoginScreenState extends State<CustomerLoginScreen> {
  late String email;
  late String password;
  bool processing = false;

  final  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final  GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  bool passwordVisible = false;

  void logIn() async {
    setState(() {
      processing = true;
    });

    if (_formKey.currentState!.validate()) {
        try {
          await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);


          _formKey.currentState!.reset();

          Navigator.pushReplacementNamed(context, '/customer_home_screen');
        } on FirebaseAuthException catch (e) {
          setState(() {
            processing = false;
          });
          if (e.code == 'user-not-found') {
            setState(() {
              processing = false;
            });
            MyMessageHandler.showSnackBar(
                _scaffoldKey, "No user found for that email.");

          } else if (e.code == 'wrong-password') {
            setState(() {
              processing = false;
            });
            MyMessageHandler.showSnackBar(
                _scaffoldKey, "Wrong password provided for that user.");
          }
        }

    } else {
      setState(() {
        processing = false;
      });
      MyMessageHandler.showSnackBar(
          _scaffoldKey, "please fill all fields");

    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldKey,
      child: Scaffold(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AuthHeaderLabel(headerLabel: 'Login In',),

                      const SizedBox(height: 50,),

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

                      TextButton(
                          onPressed: (){},
                          child: const Text(
                            'Forget Password ?',
                            style: TextStyle(
                              fontSize: 18,
                              fontStyle: FontStyle.italic
                            ),
                          ),
                      ),

                      HaveAccount(
                        actionLabel: 'Sign Up',
                        haveAccount: 'Don\'t Have Account? ',
                        onpressed: (){
                          Navigator.pushReplacementNamed(context, '/customer_signup');
                        },
                      ),

                      processing == true ?
                      const Center(child: CircularProgressIndicator(color: Colors.purple,)) :
                      AuthMainButton(
                        onPressed: (){

                          logIn();
                        },
                        mainButtonLabel: 'Log In',
                      )

                    ],
                  ),
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