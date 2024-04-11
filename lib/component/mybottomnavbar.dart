import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  final void Function(int)? onTabChange;

  MyBottomNavBar({Key? key, required this.onTabChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double iconSize = screenWidth > 600 ? 30 : 20;
    double textSize = screenWidth > 600 ? 14 : 10;
    EdgeInsetsGeometry tabPadding =
        EdgeInsets.symmetric(vertical: 8, horizontal: 16);

    return GNav(
      onTabChange: (value) => onTabChange!(value),
      color: Colors.white,
      backgroundColor: Colors.transparent,
      tabBorderRadius: screenWidth > 600 ? 20 : 10,
      tabMargin: EdgeInsets.symmetric(vertical: 1, horizontal: 1),
      tabs: [
        GButton(
          iconSize: iconSize,
          textStyle: TextStyle(fontSize: textSize),
          padding: tabPadding,
          hoverColor: Colors.grey,
          icon: Icons.home_outlined,
          semanticLabel: "",
          iconActiveColor: Colors.red,
          iconColor: Colors.grey,
        ),
        GButton(
          iconSize: iconSize,
          textStyle: TextStyle(fontSize: textSize),
          padding: tabPadding,
          icon: Icons.shop_outlined,
          semanticLabel: "",
          iconActiveColor: Colors.red,
          iconColor: Colors.grey,
          
        ),
        GButton(
          iconSize: iconSize,
          textStyle: TextStyle(fontSize: textSize),
          padding: tabPadding,
          iconActiveColor: Colors.red,
          iconColor: Colors.grey,
          text: "",
           icon: Icons.shopping_cart_checkout_rounded,
        ),
        GButton(
          iconSize: iconSize,
          textStyle: TextStyle(fontSize: textSize),
          padding: tabPadding,
          iconActiveColor: Colors.red,
          iconColor: Colors.grey,
          text: "",
           icon: Icons.favorite_outline,
        ),
        GButton(
          iconSize: iconSize,
          textStyle: TextStyle(fontSize: textSize),
          padding: tabPadding,
          iconActiveColor: Colors.red,
          iconColor: Colors.grey,
          text: "",
           icon: Icons.person,
        )
      ],
    );
  }
}
