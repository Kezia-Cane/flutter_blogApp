// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:blog_app/presentation/widgets/auth_field.dart';
import 'package:blog_app/presentation/widgets/auth_gradientButton.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            AuthField(hintText: 'Name'),
            SizedBox(
              height: 15,
            ),
            AuthField(hintText: 'Email'),
            SizedBox(
              height: 15,
            ),
            AuthField(hintText: 'Password'),
            AuthGradientButton()
          ],
        ),
      ),
    );
  }
}
