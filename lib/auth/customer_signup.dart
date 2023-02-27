import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/auth_widgets.dart';
import '../widgets/snackbar.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;


class CustomerRegisterScreen extends StatefulWidget {
  const CustomerRegisterScreen({Key? key}) : super(key: key);

  @override
  State<CustomerRegisterScreen> createState() => _CustomerRegisterScreenState();
}

class _CustomerRegisterScreenState extends State<CustomerRegisterScreen> {

  late String name;
  late String email;
  late String password;
  late String profileImage;
  late String _uid;
  bool processing = false;

  final  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final  GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  bool passwordVisible = false;

  final ImagePicker _picker = ImagePicker();

  XFile? _imageFile;
  dynamic _pickedImageError;
  CollectionReference customers = FirebaseFirestore.instance.collection('customers');

  void _pickImageFromCamera() async {
    try {
      final pickedImage = await _picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 300,
        maxHeight: 300,
        imageQuality: 95,);
      setState(() {
        _imageFile = pickedImage;
      });
    } catch(e) {
      setState(() {
        _pickedImageError = e;
      });
      print(_pickedImageError);

    }
  }

  void _pickImageFromGallery() async {
    try {
      final pickedImage = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 300,
        maxHeight: 300,
        imageQuality: 95,);
      setState(() {
        _imageFile = pickedImage;
      });
    } catch(e) {
      setState(() {
        _pickedImageError = e;
      });
      print(_pickedImageError);
    }
  }

  void signUp() async {
    setState(() {
      processing = true;
    });

    if (_formKey.currentState!.validate()) {
      if (_imageFile != null) {
        try {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

          firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref('customer-images/$email.jpg');
          print('We are about to call storage');
          await ref.putFile(File(_imageFile!.path));
          _uid = FirebaseAuth.instance.currentUser!.uid;
          
          profileImage = await ref.getDownloadURL();
          print('We are about to call Cloud store');
          await customers.doc(_uid).set({
            'name': name,
            'email': email,
            'profileimage': profileImage,
            'phone': '',
            'address': '',
            'cid': _uid
          });
        
          _formKey.currentState!.reset();
          setState(() {
            _imageFile = null;
          });

          Navigator.pushReplacementNamed(context, '/customer_login');



        } on FirebaseAuthException catch (e) {
          setState(() {
            processing = false;
          });
          if (e.code == 'weak-password') {
            MyMessageHandler.showSnackBar(
                _scaffoldKey, "The password provided is too weak");
          } else if (e.code == 'email-already-in-use') {
            MyMessageHandler.showSnackBar(
                _scaffoldKey, "This email is already in use");
          }
        } catch(e) {
          setState(() {
            processing = false;
          });
          print(e);
        }

      } else {
        setState(() {
          processing = false;
        });
        MyMessageHandler.showSnackBar(
            _scaffoldKey, "please pick image first");
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

                    children: [
                      const AuthHeaderLabel(headerLabel: 'Sign Up',),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
                            child: CircleAvatar(
                              radius: 60, 
                              backgroundColor: Colors.purpleAccent,
                              backgroundImage: _imageFile == null ? null : FileImage(File(_imageFile!.path)),
                            ),
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
                                  onPressed: (){
                                    _pickImageFromCamera();
                                  },
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
                                  onPressed: (){
                                    _pickImageFromGallery();
                                  },
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
                        onpressed: (){
                          Navigator.pushReplacementNamed(context, '/supplier_login');
                        },
                      ),

                      processing == true ?
                      const CircularProgressIndicator(color: Colors.purple,) :
                      AuthMainButton(
                        onPressed: (){

                          signUp();
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
      ),
    );
  }
}




extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(r'^([a-zA-Z0-9]+)([\-\_\.]*)([a-zA-Z0-9]*)[@][a-zA-Z0-9]{2,}[\.][a-zA-Z0-9]{2,3}[\.]*[a-z]*$').hasMatch(this);
  }
}