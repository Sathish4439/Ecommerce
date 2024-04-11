import 'package:flutter/material.dart';
import 'package:newrestapp/module/productprovider.dart';
import 'package:newrestapp/pages/Add_new_Address.dart';
import 'package:newrestapp/pages/Adress.dart';
import 'package:newrestapp/pages/auth/loginpage.dart';
import 'package:newrestapp/pages/cridicartd.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ProductProvider(),
    child:const  MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:AddNewAddress(),
    );
  }
}
