import 'package:flutter/material.dart';
import 'package:newrestapp/pages/auth/forgotpasswardpage.dart';
import 'package:newrestapp/pages/contentbox.dart';

import 'package:newrestapp/util/linkbox.dart';
import 'package:newrestapp/util/util.dart';

class Signuppage extends StatelessWidget {
  const Signuppage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    void validateForm() {
      if (formKey.currentState!.validate()) {
        // Valid form, navigate to main page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Passwordpage(),
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
                      "Log in",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 20),
                  

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

                  // Forgot password
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
                                builder: (context) => Passwordpage(),
                              ),
                            );
                          },
                          child: Text(
                            "Forgot your password? ",
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

                  // Sign Up button
                  Center(
                    child: MyBotton(
                      onTap: validateForm,
                      text:"LOG IN",
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  // Or continue with text
                  Center(
                    child: Text(" or sign up with social account"),
                  ),
                  const SizedBox(height: 20),

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
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
