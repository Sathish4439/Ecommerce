import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:newrestapp/module/module.dart';


import 'package:newrestapp/module/productprovider.dart';
import 'package:newrestapp/module/temperature.dart';
import 'package:newrestapp/util/util.dart';

import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<dynamic> productlist = [];

  Future<void> getProducts() async {
    String url = 'https://fakestoreapi.com/products';
    var res = await http.get(Uri.parse(url));

    setState(() {
      if (res.statusCode == 200) {
        productlist = jsonDecode(res.body);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: () {
                        //search the product
                      }, icon: Icon(Icons.search_rounded,size: 30,color: CupertinoColors.black,))),
              Text("Welcome back!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    // sliver app bar
                    SliverAppBar(
                      expandedHeight: 200,
                      leading: MyDrawer(),
                      floating: false,
                      pinned: false,
                      flexibleSpace: FlexibleSpaceBar(
                       
                        background: Container(
                          height: 100,
                          child: carosal,
                        ),
                      ),
                    ),

                    // sliver items
                    SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 2,
                        crossAxisSpacing: 2,
                        mainAxisExtent: 350,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return Temperature(
                            id: productlist[index]["id"],
                            title: productlist[index]["title"],
                            price: productlist[index]["price"].toDouble(),
                            description: productlist[index]["description"],
                            category: getCategoryFromString(
                                productlist[index]["category"]),
                            image: productlist[index]["image"],
                            rating: Rating(
                              rate: productlist[index]["rating"]["rate"]
                                  .toDouble(),
                              count: productlist[index]["rating"]["count"],
                            ),
                          );
                        },
                        childCount: productlist.length,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Category getCategoryFromString(String categoryString) {
  switch (categoryString.toLowerCase()) {
    case "electronics":
      return Category.ELECTRONICS;
    case "jewelery":
      return Category.JEWELRY;
    case "men's clothing":
      return Category.MEN_S_CLOTHING;
    case "women's clothing":
      return Category.WOMEN_S_CLOTHING;
    default:
      throw Exception("Invalid category: $categoryString");
  }
}

