import 'package:flutter/material.dart';

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
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          onPressed: (){},
                          icon: const Icon(Icons.home_work, size: 40,),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
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
                        decoration: InputDecoration(
                            labelText: 'Full Name',
                            hintText: 'Enter your full names',
                            labelStyle: TextStyle(color: Colors.purple),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(color: Colors.purple, width: 1)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(color: Colors.deepPurpleAccent, width: 2)
                        )

                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,),
                    child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: 'Email address',
                            hintText: 'Enter your email',
                            labelStyle: TextStyle(color: Colors.purple),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(color: Colors.purple, width: 1)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(color: Colors.deepPurpleAccent, width: 2)
                        )

                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,),
                    child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            labelStyle: const TextStyle(color: Colors.purple),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(color: Colors.purple, width: 1)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(color: Colors.deepPurpleAccent, width: 2)
                        )

                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Already have an account?', style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),),
                      TextButton(
                          onPressed: (){},
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30.0),
                    child: Material(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(25),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        onPressed: (){},
                        child: Text('Sign Up', style: TextStyle(
                            fontSize: 24,
                            color: Colors.white, fontWeight: FontWeight.bold),),
                      ),
                    ),
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
