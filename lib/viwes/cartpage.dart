import 'package:adv_test_app/model/api_model.dart';
import 'package:adv_test_app/provider/api_provider.dart';
import 'package:adv_test_app/provider/count_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    ApiModel args = ModalRoute.of(context)!.settings.arguments as ApiModel;
    var provider = Provider.of<ApiProvider>(context);
    var countprovider = Provider.of<CountProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Page / Saved Items"),
      ),
      body: (provider.cart.isNotEmpty)
          ? ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ListTile(
                        leading: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(args.image),
                            ),
                          ),
                        ),
                        title: Text("${args.title}"),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("price \$ ${args.price}"),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color:
                                          Colors.transparent.withOpacity(0.2),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                      ),
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        countprovider.increase();
                                      },
                                      icon: Icon(Icons.add),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 40,
                                    width: 50,
                                    color: Colors.transparent.withOpacity(0.1),
                                    child: Text(
                                        "${countprovider.countModel.count}"),
                                  ),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color:
                                          Colors.transparent.withOpacity(0.2),
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        countprovider.decrease();
                                      },
                                      icon: Icon(Icons.remove),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 60,
                        width: double.infinity,
                        color: Colors.transparent.withOpacity(0.2),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                  "Total Amount = ${args.price * countprovider.countModel.count}"),
                              ElevatedButton(
                                onPressed: () {
                                  provider.cart.removeAt(index);
                                },
                                child: Text("Remove"),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
              itemCount: provider.cart.length,
            )
          : Center(
              child: Text("Your Cart is empty"),
            ),
    );
  }
}
