import 'package:flutter/material.dart';
import 'package:newrestapp/component/product.dart';
import 'package:newrestapp/module/productprovider.dart';
import 'package:newrestapp/pages/cart_page.dart';
import 'package:newrestapp/util/util.dart';
import 'package:provider/provider.dart';

class Product_detail extends StatefulWidget {
  final dynamic prize;
  final dynamic image;
  final String name;
  final String dis;

  Product_detail({
    Key? key,
    required this.image,
    required this.dis,
    required this.name,
    required this.prize,
  }) : super(key: key);

  @override
  State<Product_detail> createState() => _Product_detailState();
}

class _Product_detailState extends State<Product_detail> {
  int quantity = 1;

  void increment() {
    setState(() {
      quantity++;
    });
  }

  void decrement() {
    setState(() {
      if (quantity > 0) {
        quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Productprovider =
        Provider.of<ProductProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                child: Text("Go to Cart"),
                value: "cart",
                
              ),
              PopupMenuItem(
                child: Text("Share Now"),
                value: "share",
              ),
            ],
            onSelected: (value) {
              if (value == "cart") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: ((context) => CartPage())),
                );
              } else if (value == "share") {
               
               
              }
            },
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              alignment: Alignment.center,
              child: Image.network(
                widget.image,
                fit: BoxFit.fill,
                height: MediaQuery.of(context).size.height * 0.3,
              ),
            ),
            Text(
              widget.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(widget.dis),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Price: " + widget.prize.toString(),
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        increment();
                      },
                      icon: Icon(
                        Icons.add,
                        size: 30,
                      ),
                    ),
                    Text(
                      '$quantity',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    IconButton(
                      onPressed: () {
                        decrement();
                      },
                      icon: Icon(
                        Icons.remove,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            MyBotton(
              onTap: () {
                var prod = product(
                  productCount: quantity,
                  name: widget.name,
                  price: widget.prize,
                  child: widget.image,
                );
                Productprovider.addToCart(prod);
              },
              text: "Add to Cart",
            )
          ],
        ),
      ),
    );
  }
}
