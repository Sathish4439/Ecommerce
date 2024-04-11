import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newrestapp/module/productprovider.dart';
import 'package:provider/provider.dart';

class Favirotepage extends StatelessWidget {
  const Favirotepage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProductProvider>(
        builder: (context, productprovider, child) {
          final item = productprovider.favoriteprod;
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Favorite",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: item.length,
                      itemBuilder: (context, index) {
                        final products = item[index];
                        var count = products.productCount;
                        if (count == null) {
                          count = 1;
                        }
                        
                        return ListTile(
                          leading: Image.network(products.child),
                          title: Text(
                            products.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Price : " + products.price.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text(
                                "Qty : " + count.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ],
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              productprovider.removefromFav(products);
                            },
                            icon: Icon(Icons.cancel, size: 20),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
