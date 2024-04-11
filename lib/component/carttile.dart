import 'package:flutter/material.dart';

class CartTile extends StatelessWidget {
  String image;
  CartTile({super.key,required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            child: Image.network(image),
          )
        ],
      ),
    );
  }
}
