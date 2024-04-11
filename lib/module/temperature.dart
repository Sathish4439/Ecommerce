import 'package:flutter/material.dart';
import 'package:newrestapp/component/product.dart';
import 'package:newrestapp/module/productprovider.dart';
import 'package:newrestapp/module/module.dart';
import 'package:newrestapp/pages/productdetail.dart';
import 'package:newrestapp/util/util.dart';
import 'package:provider/provider.dart';

class Temperature extends StatelessWidget {
  final dynamic id;
  final dynamic title;
  final double price;
  final dynamic description;
  final Category category;
  final dynamic image;
  final Rating rating;

  const Temperature({
    Key? key,
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => Product_detail(
                      dis: description,
                      image: image,
                      name: title,
                      prize: rating.count))));
        },
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(), borderRadius: BorderRadius.circular(10)),
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 9,
                      width: MediaQuery.of(context).size.width / 5,
                      child: Image.network(
                        image,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Text(price.toString()),
                  ],
                ),
                Row(
                  children: [
                    Text("Rating : ${rating.rate.toStringAsFixed(1)}"),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                  ],
                ),
                Text(title),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Price : " + rating.count.toStringAsFixed(1)),
                    IconButton(
                        onPressed: () {
                          var prod =
                              product(name: title, price: price, child: image);
                          productProvider.addTofav(prod);
                        },
                        icon: Icon(Icons.favorite_outline))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
