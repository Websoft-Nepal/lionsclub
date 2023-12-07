import 'package:flutter/material.dart';
import 'package:lionsclub/main.dart';
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            SizedBox(height: 150,),
            Text('Sign Up',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: sColor),),
          ],
        ),
      ),
    );
  }
}
