import 'package:adv_test_app/model/api_model.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    ApiModel args = ModalRoute.of(context)!.settings.arguments as ApiModel;
    return Scaffold(
      body: Column(
        children: [
          Text("${args.id}"),
        ],
      ),
    );
  }
}
