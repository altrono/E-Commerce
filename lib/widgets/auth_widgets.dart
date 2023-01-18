import 'package:flutter/material.dart';

class AuthMainButton extends StatelessWidget {
  final String mainButtonLabel;
  final Function() onPressed;
  const AuthMainButton({
    super.key,
    required this.onPressed,
    required this.mainButtonLabel
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Material(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(25),
        child: MaterialButton(
          minWidth: double.infinity,
          onPressed: onPressed,
          child: Text(mainButtonLabel, style: TextStyle(
              fontSize: 24,
              color: Colors.white, fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}

class HaveAccount extends StatelessWidget {
  final String haveAccount;
  final String actionLabel;
  final Function() onpressed;
  const HaveAccount({
    super.key,
    required this.actionLabel,
    required this.haveAccount,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(haveAccount, style:const TextStyle(fontStyle: FontStyle.italic, fontSize: 16),),
        TextButton(
          onPressed: onpressed,
          child: Text(
            actionLabel,
            style:const TextStyle(
              color: Colors.purple,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}

class AuthHeaderLabel extends StatelessWidget {
  final String headerLabel;
  const AuthHeaderLabel({
    super.key,
    required this.headerLabel
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            headerLabel,
            style:const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          IconButton(
            onPressed: (){
              Navigator.pushReplacementNamed(
                context,
                '/welcome_screen',
              );
            },
            icon: const Icon(Icons.home_work, size: 40,),
          ),
        ],
      ),
    );
  }
}


var textFormDecoration = InputDecoration(
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

);