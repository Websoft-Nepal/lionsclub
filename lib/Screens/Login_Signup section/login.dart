import 'package:flutter/material.dart';
import 'package:lionsclub/main.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Container(
              width: 300,
              child: TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Username',
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(
                    Icons.person,
                    color: sColor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Container(
              width: 300,
              child: TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(
                    Icons.lock,
                    color: sColor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
        ),
        Center(
        child: ElevatedButton(
        onPressed: () {
    // Add your sign-in logic here
    print('Sign In button pressed');
    },
    style: ElevatedButton.styleFrom(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    primary: sColor,
      onPrimary: Colors.white, // Text color
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.0), // Button border radius
    ),
    ),
    child: Text('Sign In'),
    ),
    ),

    //     TextButton(
    //       onPressed: () {
    //         },
    //       child: RichText(
    // text: TextSpan(
    // text: 'Don\'t have an account? ',
    // style: DefaultTextStyle.of(context).style,
    // children: <TextSpan>[
    // TextSpan(
    // text: 'Sign up',
    // style: TextStyle(
    // color: zColor, // Set the desired color
    // fontWeight: FontWeight.bold,
    // ),
    // ),
    //   ],
    // ),
    //       ),
    //     )
    ]
    );
  }
}
