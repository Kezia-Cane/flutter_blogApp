// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:blog_app/presentation/pages/signup_page.dart';
import 'package:blog_app/presentation/widgets/auth_field.dart';
import 'package:blog_app/presentation/widgets/auth_gradientButton.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const LoginPage());
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<LoginPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              AuthField(
                hintText: 'Email',
                controller: emailController,
              ),
              SizedBox(
                height: 15,
              ),
              AuthField(
                hintText: 'Password',
                controller: passwordController,
                passwordAsterisk: true,
              ),
              SizedBox(
                height: 20,
              ),
              AuthGradientButton(
                buttonText: 'Login',
              ),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, SignUpPage.route());
                },
                child: RichText(
                    text: TextSpan(
                        text: 'Don\'t have an account? ',
                        style: Theme.of(context).textTheme.titleMedium,
                        children: [
                      TextSpan(
                          text: 'Sign Up',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  color: AppPallete.gradient2,
                                  fontWeight: FontWeight.bold))
                    ])),
              )
            ],
          ),
        ),
      ),
    );
  }
}
