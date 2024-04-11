import 'package:flutter/material.dart';
import 'package:newrestapp/pages/contentbox.dart';
import 'package:newrestapp/pages/miainpage.dart';

import 'package:newrestapp/util/util.dart';

class Passwordpage extends StatelessWidget {
  const Passwordpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    void sendResetLink() {
      if (formKey.currentState!.validate()) {
        // Send password reset link functionality here
        // For demonstration purposes, navigate to the main page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Mainpage(),
          ),
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
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Please enter your email address. You will receive a link to create a new password via email.",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ContentBox(
                    controller: emailController,
                    obscure: false,
                    hintText: "Email/Phone..",
                    icon: Icon(Icons.mail),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email/phone';
                      } else if (!isValidEmail(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),

                  // Send button
                  Center(
                    child: MyBotton(
                      onTap: sendResetLink,
                      text: "SEND",
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

  bool isValidEmail(String email) {
    // Simple email validation logic
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}
