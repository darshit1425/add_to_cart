import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'screen/home/provider/home_provider.dart';
import 'screen/home/view/add_product.dart';
import 'screen/home/view/cart.dart';
import 'screen/home/view/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => HomeScreen(),
          'cart': (context) => Cart(),
          'detalis': (context) => Addpro(),
        },
      ),
    ),
  );
}
