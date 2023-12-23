import 'package:adv_test_app/provider/api_provider.dart';
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
    var provider = Provider.of<ApiProvider>(context);
    return Scaffold(
      body: Column(children: [
        Container(
          height: 60,
          width: double.infinity,
          child: Column(
            children: [
              Row(
                children: [],
              )
            ],
          ),
        )
      ]),
    );
  }
}
