import 'package:flutter/material.dart';
import 'package:newrestapp/component/mybottomnavbar.dart';
import 'package:newrestapp/pages/cart_page.dart';
import 'package:newrestapp/pages/favrotepage.dart';
import 'package:newrestapp/pages/home_page.dart';
import 'package:newrestapp/pages/profilepage.dart';
import 'package:newrestapp/pages/shoppage.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  int _selectedindex = 0;

  void Mypagenav(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  final List _pages = const [
   Homepage(),
    ShopPage(),
    CartPage(),
    Favirotepage(),
    Profilepage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => Mypagenav(index),
      ),
      body: _pages[_selectedindex],
    );
  }
}
