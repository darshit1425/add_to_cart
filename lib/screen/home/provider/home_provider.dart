import 'package:flutter/material.dart';

import '../modal/Product_modal.dart';

class HomeProvider extends ChangeNotifier {
  List<ProductModal> Productlist = [

    ProductModal(Price: "120 ",images: "🍉", ProductName: "Watermelon", qty: 1),
    ProductModal(Price: "150", images: "🥭", ProductName: "Mango", qty: 1),
    ProductModal(Price: "100", images: "🍇", ProductName: "Graphs", qty: 1),
    ProductModal(Price: "60", images: "🥥", ProductName: "Coconut", qty: 1),
    ProductModal(Price: "40", images: "🥝", ProductName: "Kiwi", qty: 1),
    ProductModal(Price: "50", images: "🍊", ProductName: "Orange", qty: 1),
    ProductModal(Price: "80", images: "🍍", ProductName: "Pineapple", qty: 1),
    ProductModal(Price: "120", images: "🍓", ProductName: "Strawberry", qty: 1),
    ProductModal(Price: "160", images: "🍒", ProductName: "Cherries", qty: 1),
    ProductModal(Price: "25", images: "🍌", ProductName: "Banana", qty: 1),
  ];

  List<ProductModal> cartList = [];

  void addCart(ProductModal p1) {
    cartList.add(p1);
    notifyListeners();
  }

  void Update(int index, ProductModal p1) {
    Productlist[index] = p1;
    notifyListeners();
  }




}
