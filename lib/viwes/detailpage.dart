import 'package:adv_test_app/model/api_model.dart';
import 'package:adv_test_app/provider/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ApiProvider>(context);
    ApiModel args = ModalRoute.of(context)!.settings.arguments as ApiModel;
    return Scaffold(
      appBar: AppBar(
        title: Text("${args.title}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(args.image),
                ),
              ),
            ),
            Text("${args.title}"),
            Text(
              "Description",
              style: TextStyle(fontSize: 30, color: Colors.grey),
            ),
            SizedBox(
              height: 10,
            ),
            Text("${args.description}"),
            SizedBox(
              height: 30,
            ),
            Text(
              "Price \$ ${args.price}",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                provider.cart.add(args);
                Navigator.pushNamed(context, 'cart', arguments: args);
              },
              child: Text("Add to cart"),
            )
          ],
        ),
      ),
    );
  }
}
