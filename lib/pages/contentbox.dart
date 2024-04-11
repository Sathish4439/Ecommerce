import 'package:flutter/material.dart';

class ContentBox extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscure;
  final Icon? icon;
  final String? Function(String?)? validator; // Add validator property

  ContentBox({
    Key? key,
     this.icon,
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
          label: Text(hintText),
          filled: true,
          fillColor: Colors.white, // Set white background color
         // hintText: hintText,
          prefixIcon: icon, // Uncomment this line if you want to use the icon
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
        ),
      ),
    );
  }
}
