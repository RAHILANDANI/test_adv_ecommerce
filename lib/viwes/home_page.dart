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
    getdata(context);
    super.initState();
  }

  getdata(BuildContext context) {
    Provider.of<ApiProvider>(context, listen: false).fetchdatafromapi();
  }

  @override
  Widget build(BuildContext context) {
    CarouselController buttonCarouselController = CarouselController();
    var provider = Provider.of<ApiProvider>(context);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "AR SHOP",
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('cart');
                },
                icon: Icon(
                  Icons.shopping_cart,
                  size: 24,
                ),
              ),
            ),
          ],
          bottom: TabBar(
            tabs: <Widget>[
              Text("All Products"),
              Text("Womens Clothes"),
              Text("Jewelery"),
              Text("Electonics"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
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
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(context, 'details',
                                            arguments: e);
                                      },
                                      child: Card(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text("Price - ${e.price}"),
                                        ElevatedButton(
                                          onPressed: () {},
                                          child: Text("Add to cart"),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ))
                          .toList()),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                  children: provider.dataofapi
                      .map((e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, 'details',
                                        arguments: e);
                                  },
                                  child: Column(
                                    children: [
                                      Card(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(e.image),
                                                  fit: BoxFit.fill)),
                                          height: 130,
                                          width: double.infinity,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(e.title),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("Price - ${e.price}"),
                                    ElevatedButton(
                                      onPressed: () {
                                        provider.cart.add(e);
                                      },
                                      child: Text("Add to cart"),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ))
                      .toList()),
            ),
            Container(
              color: Colors.blue,
              height: 30,
            ),
            Container(
              color: Colors.yellow,
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
