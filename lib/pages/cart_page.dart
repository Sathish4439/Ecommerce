import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newrestapp/module/productprovider.dart';
import 'package:newrestapp/pages/contentbox.dart';
import 'package:newrestapp/pages/cridicartd.dart';
import 'package:newrestapp/util/util.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  TextEditingController promocodecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My Bag",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Expanded(
              child: Consumer<ProductProvider>(
                builder: (context, productprovider, child) {
                  final items = productprovider.Products;
                  double totalPrice = 0;

                  for (var product in items) {
                    totalPrice += product.price * product.productCount!;
                  }

                  return ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final product = items[index];
                      var count = product.productCount ?? 1;

                      return ListTile(
                        leading: Image.network(product.child),
                        title: Text(
                          product.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Price : ${product.price}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "Qty : $count",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        trailing: PopupMenuButton(
                          itemBuilder: (BuildContext context) => [
                            PopupMenuItem(
                              child: Text("Add to favorite"),
                              value: "add",
                            ),
                            PopupMenuItem(
                              child: Text("Delete from list"),
                              value: "delete",
                            ),
                          ],
                          onSelected: (value) {
                            if (value == "add") {
                              productprovider.addTofav(product);
                            } else if (value == "delete") {
                              productprovider.removefromCart(product);
                            }
                          },
                          icon: Icon(Icons.more_vert),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Spacer(),
            ContentBox(
              icon: Icon(Icons.code),
              controller: promocodecontroller,
              hintText: "Enter your promocode",
              obscure: false,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total Amount"),
                Consumer<ProductProvider>(
                  builder: (context, productprovider, child) {
                    double totalPrice = 0;

                    for (var product in productprovider.Products) {
                      totalPrice += product.price * product.productCount!;
                    }

                    return Text(
                      totalPrice
                          .toStringAsFixed(2), // Display with 2 decimal places
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            MyBotton(
                text: "Ckeck out",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => MyCreditCardView())));
                }),
          ],
        ),
      ),
    );
  }
}
