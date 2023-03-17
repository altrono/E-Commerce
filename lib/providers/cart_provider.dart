import 'package:flutter/material.dart';

class Product {
  String name;
  double price;
  int qty = 1;
  int qntty;
  List imagesUrl;
  String documentId;
  String suppId;

    Product({
      required this.name,
      required this.price,
      required this.qntty,
      required this.qty,
      required this.suppId,
      required this.documentId,
      required this.imagesUrl
    });

   void increase() {
     qty++;
   }

  void decrease() {
    qty--;
  }



}


class Cart extends ChangeNotifier {

  final List<Product> _list = [];

  List<Product> get getItems => _list;

  int? get count => _list.length;

  void addItem(
    String name,
    double price,
    int qty,
    int qntty,
    List imagesUrl,
    String documentId,
    String suppId,
  ) {
    final product = Product(
        name: name,
        price: price,
        qntty: qntty,
        qty: qty,
        suppId: suppId,
        documentId: documentId,
        imagesUrl: imagesUrl
    );

    _list.add(product);
    notifyListeners();

  }

  void increment(Product product) {
    product.increase();
    notifyListeners();
  }

  void reduceByOne(Product product) {
    product.decrease();
    notifyListeners();
  }

}