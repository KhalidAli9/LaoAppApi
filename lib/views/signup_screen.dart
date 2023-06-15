import 'package:f_app_api/services/api/Auth/createUser.dart';
import 'package:f_app_api/services/contaners/Login_screen/ElevatedButtonLogin.dart';
import 'package:f_app_api/services/contaners/signup_screen/ElecatedButtonSignup.dart';
import 'package:f_app_api/services/contaners/TextFelidCustom.dart';
import 'package:f_app_api/services/extan/navigitor/pushEXT.dart';
import 'package:f_app_api/views/Login_screen.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 16,
          ),
          const LabelScreen(title: "Sign up"),
          const SizedBox(
            height: 16,
          ),
          Center(
            child: Container(
              height: 400,
              width: MediaQuery.of(context).size.width * 0.95,
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
                    hint: "user123",
                    label: "User name",
                    icon: Icons.person,
                    onChanged: (value) {
                      print(value);
                      username = value;
                    },
                  ),
                  TextFieldCustom(
                    hint: "Fahad Alazmi",
                    label: "Name",
                    icon: Icons.supervised_user_circle,
                    controller: nameController,
                  ),
                  TextFieldCustom(
                    hint: "example@gmail.com",
                    label: "Email",
                    icon: Icons.email,
                    controller: emailController,
                  ),
                  TextFieldCustom(
                    hint: "AAaa1100229933",
                    label: "password",
                    icon: Icons.lock,
                    obscureText: true,
                    isPassword: true,
                    onChanged: (pass) {
                      password = pass;
                    },
                  ),
                  ElecatedButtonSignup(
                      emailController: emailController,
                      password: password,
                      username: username,
                      nameController: nameController),
                ],
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                context.pushpage(LoginScreen());
              },
              child:const  Text(
                "I have Account",
                style: TextStyle(
                  fontSize: 16,
                ),
              ))
        ],
      ),
    );
  }
  
  
}
