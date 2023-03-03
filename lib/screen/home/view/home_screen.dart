import 'package:add_to_cart/screen/home/modal/Product_modal.dart';
import 'package:add_to_cart/screen/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? homeProvider;

  @override
  Widget build(BuildContext context) {
    homeProvider = Provider.of<HomeProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white30,
        appBar: AppBar(
          // leading: IconButton(onPressed: (){}, icon: Icon(Icons.add)),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "cart");
              },
              icon: Icon(Icons.add_shopping_cart),
            ),
          ],
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white24,
          title: Text(
            "MY Cart",
            style: TextStyle(fontSize: 25, color: Colors.grey.shade300),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                child: Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 8,
                        crossAxisCount: 2),
                    itemCount: homeProvider!.Productlist.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          ProductModal p1 = ProductModal(
                            images: homeProvider!.Productlist[index].images,
                            ProductName:
                                homeProvider!.Productlist[index].ProductName,
                            Price: homeProvider!.Productlist[index].Price,
                          );
                          Navigator.pushNamed(context, "detalis",
                              arguments: p1);
                        },
                        child: Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey.shade400,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${homeProvider!.Productlist[index].images}",
                                style: TextStyle(fontSize: 100),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                "${homeProvider!.Productlist[index].ProductName}",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${homeProvider!.Productlist[index].Price}",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.deepPurpleAccent,
                                    fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
