import 'dart:convert';

import 'package:f_app_api/services/api/Auth/login.dart';
import 'package:f_app_api/views/Home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class ElevatedButtonLogin extends StatelessWidget {
  const ElevatedButtonLogin({
    super.key,
    required this.emailController,
    required this.passwordController, 
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;


  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 50,
        width: 200,
      
        child: ElevatedButton(
          
          onPressed: () async {
            final Map body = {
              "email": emailController.text,
              "password": passwordController.text,
            };
            final response = await loginUser(body: body);

            if (response.statusCode == 200) {
              final box = GetStorage();
              box.write("token", json.decode(response.body)["data"]["token"]);

              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                  (route) => false);
            }
          },
          child: Text(
            "Login",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class LabelScreen extends StatelessWidget {
  const LabelScreen({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      title,
      style: TextStyle(
          fontFamily: "TiltPrism", fontWeight: FontWeight.w900, fontSize: 30),
    ));
  }
}
