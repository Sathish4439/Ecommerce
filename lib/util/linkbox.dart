import 'package:flutter/material.dart';

class Linkbox extends StatelessWidget {
  final String img;
  void Function()? onTap;
  Linkbox({super.key, required this.img, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(19)),
          height: 50,
          width: 50,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.network(img),
          ),
        ),
      ),
    );
  }
}
