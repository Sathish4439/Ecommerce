import 'package:flutter/material.dart';
import 'package:newrestapp/component/product.dart';

class ProductProvider extends ChangeNotifier {
  List<product> _Products = [];

  List<product> get Products => _Products;

  List<product> _favprod = [];
  List<product> get favoriteprod => _favprod;

  void addToCart(product product) {
    Products.add(product);
    notifyListeners();
  }

  void addTofav(product product) {
    favoriteprod.add(product);
    notifyListeners();
  }

  void removefromCart(product product) {
    Products.remove(product);
    notifyListeners();
  }
  void removefromFav(product product) {
    favoriteprod.remove(product);
    notifyListeners();
  }

  void addproduct(product prod, int quantity) {
    for (int i = 1; i <= quantity; i++) {
      Products.add(prod);
    }
  }

  void removeproduct(product prod, int quantity) {
    for (int i = 1; i <= quantity; i++) {
      Products.remove(prod);
    }
  }
}
