import 'package:add_to_cart/screen/home/modal/Product_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/home_provider.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  HomeProvider? homeProvider;

  @override
  Widget build(BuildContext context) {
    homeProvider = Provider.of<HomeProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.white24,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Shopping Product",
            style: TextStyle(),
          ),
        ),
        body: Consumer<HomeProvider>(
          builder: (context, value, child) => ListView.builder(
            itemCount: homeProvider!.cartList.length,
            itemBuilder: (context, index) => ListTile(
              leading: Text(
                "${homeProvider!.cartList[index].images}",
                style: TextStyle(fontSize: 50),
              ),
              title: Text(
                "${homeProvider!.cartList[index].ProductName}",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "${homeProvider!.cartList[index].Price}",
                style: TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      ProductModal p1 = ProductModal(
                          images: homeProvider!.Productlist[index].images,
                          ProductName:
                              homeProvider!.Productlist[index].ProductName,
                          Price: homeProvider!.Productlist[index].Price,
                          qty: homeProvider!.Productlist[index].qty! + 1);
                      homeProvider!.Update(index, p1);
                    },
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "${homeProvider!.Productlist[index].qty}",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      ProductModal p1 = ProductModal(
                          images: homeProvider!.Productlist[index].images,
                          ProductName:
                              homeProvider!.Productlist[index].ProductName,
                          Price: homeProvider!.Productlist[index].Price,
                          qty: homeProvider!.Productlist[index].qty! - 1);
                      homeProvider!.Update(index, p1);
                    },
                    icon: Icon(Icons.remove, size: 25, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
