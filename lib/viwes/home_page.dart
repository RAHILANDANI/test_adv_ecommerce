import 'package:adv_test_app/model/api_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/api_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CarouselController buttonCarouselController = CarouselController();
    var provider = Provider.of<ApiProvider>(context);
    return Scaffold(
      drawer: Drawer(
        child: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Text(
                  "AR Shop",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, 'cart');
                },
                title: Text("Cart Page"),
              ),
              ListTile(
                onTap: () {},
                title: Text("Liked items"),
              ),
              ListTile(
                onTap: () {},
                title: Text("Setting"),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          "AR SHOP",
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
                size: 24,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.transparent.withOpacity(0.07),
                ),
                height: 50,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text("Search"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(Icons.search),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: CarouselSlider(
                items: provider.image
                    .map((e) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(e),
                              fit: BoxFit.fill,
                            ),
                          ),
                          height: 300,
                          width: double.infinity,
                        ))
                    .toList(),
                carouselController: buttonCarouselController,
                options: CarouselOptions(
                  autoPlayAnimationDuration: Duration(seconds: 3),
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                  aspectRatio: 2.0,
                  initialPage: 2,
                ),
              ),
            ),
            Column(
              children: provider.dataofapi
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Card(
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, 'detail',
                                      arguments: e);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(e.image),
                                          fit: BoxFit.fill)),
                                  height: 130,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                            Text(e.title),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Price - ${e.price}"),
                                ElevatedButton(
                                  onPressed: () {
                                    provider.cart.add(e);
                                    Navigator.pushNamed(context, 'cart',
                                        arguments: e);
                                  },
                                  child: Text("Add to cart"),
                                )
                              ],
                            )
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
