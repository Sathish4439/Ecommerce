import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newrestapp/pages/auth/signuppage.dart';
import 'package:newrestapp/pages/contentbox.dart';
import 'package:newrestapp/pages/miainpage.dart';

import 'package:newrestapp/util/linkbox.dart';
import 'package:newrestapp/util/util.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final nameController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    void validateForm() {
      if (formKey.currentState!.validate()) {
        // Valid form, navigate to main page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Mainpage(),
          ),
        );
      } else {
        // Invalid form, show error message or handle accordingly
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please enter valid credentials')),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Icon and Text
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 8),
                    child: Text(
                      "Sign up",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ContentBox(
                    controller: nameController,
                    obscure: false,
                    hintText: "Name",
                    icon: Icon(Icons.mail),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Name';
                      }
                      return null;
                    },
                  ),

                  // Email field
                  ContentBox(
                    controller: emailController,
                    obscure: false,
                    hintText: "Email/Phone..",
                    icon: Icon(Icons.mail),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email/phone';
                      }
                      return null;
                    },
                  ),

                  // Password field
                  ContentBox(
                    controller: passwordController,
                    obscure: true,
                    hintText: "Password",
                    icon: Icon(Icons.lock),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),

                  // Sign In button
                  Center(child: MyBotton(text: "SIGN UP", onTap: validateForm)),

                  Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Signuppage(),
                          ),
                        );
                      },
                      child: Text(
                        "Already have an account?",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.red,
                    )
                  ],
                ),
              ),

                  const SizedBox(
                    height: 20,
                  ),

                  // Or continue with text
                  Center(
                    child: Text(
                      " or sign in with social account",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),

                  // Social media login buttons
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Linkbox(
                          onTap: () {},
                          img:
                              "https://cdn-icons-png.flaticon.com/128/281/281764.png",
                        ),
                        Linkbox(
                          onTap: () {},
                          img:
                              "https://cdn-icons-png.flaticon.com/128/733/733547.png",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ContentBox extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscure;
  final Icon? icon;
  final String? Function(String?)? validator; // Add validator property

  ContentBox({
    Key? key,
    required this.icon,
    required this.controller,
    required this.hintText,
    required this.obscure,
    this.validator, // Update constructor to accept validator
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        // Use TextFormField instead of TextField
        obscureText: obscure,
        controller: controller,
        validator: validator, // Set validator property
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white, // Set white background color
          hintText: hintText,
          prefixIcon: icon, // Uncomment this line if you want to use the icon
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
        ),
      ),
    );
  }
}
