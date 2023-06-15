import 'dart:convert';

import 'package:f_app_api/services/api/Auth/login.dart';
import 'package:f_app_api/services/contaners/Login_screen/ElevatedButtonLogin.dart';
import 'package:f_app_api/services/contaners/TextFelidCustom.dart';
import 'package:f_app_api/services/extan/navigitor/pushEXT.dart';
import 'package:f_app_api/views/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 32),
        child: ListView(
          children: [
            Center(
              child: Text(
                "Log in ",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade200),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 320,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                color: Colors.blue.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  TextFieldCustom(
                    hint: "example@gmail.com",
                    label: "Email",
                    icon: Icons.email,
                    controller: emailController,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFieldCustom(
                    hint: "******",
                    label: "Password",
                    icon: Icons.lock,
                    isPassword: true,
                    controller: passwordController,
                  ),
                  SizedBox(
                    height: 64,
                  ),
                  ElevatedButtonLogin(
                      emailController: emailController,
                      passwordController: passwordController),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextButton(
              onPressed: () {
                context.pushpage(const SignUpScreen());
              },
              child: const Text(
                "Sign up",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Colors.blue,
                ),
              ),
            ),
            

            Text(""),
          ],
        ),
      ),
    );
  }
}
