import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modal/Product_modal.dart';
import '../provider/home_provider.dart';

class Addpro extends StatefulWidget {
  const Addpro({Key? key}) : super(key: key);

  @override
  State<Addpro> createState() => _AddproState();
}

class _AddproState extends State<Addpro> {
  HomeProvider? homeProvider;

  @override
  Widget build(BuildContext context) {
    homeProvider = Provider.of<HomeProvider>(context, listen: false);
    ProductModal p1 =
        ModalRoute.of(context)!.settings.arguments as ProductModal;
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.deepOrangeAccent.shade700,
        appBar: AppBar(
          backgroundColor: Colors.black26,
          centerTitle: true,
          title: Text(
            "Shopping Product",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text("${p1.images}", style: TextStyle(fontSize: 120)),
                SizedBox(
                  height: 10,
                ),
                Text("${p1.ProductName}",
                    style:
                        TextStyle(fontSize: 28, fontWeight: FontWeight.w800)),
                SizedBox(
                  height: 10,
                ),
                Text("${p1.Price}",
                    style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w400)),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {

                    homeProvider!.addCart(p1);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent),
                  child: Text(
                    "ADD TO CART",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
