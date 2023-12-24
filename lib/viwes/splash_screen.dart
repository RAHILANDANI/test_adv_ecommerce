import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/api_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState

    getdata(context).then(
      (value) => Timer(
        Duration(seconds: 3),
        () {
          Navigator.pushReplacementNamed(context, 'homepage');
        },
      ),
    );
    super.initState();
  }

  Future getdata(BuildContext context) async {
    await Provider.of<ApiProvider>(context, listen: false).fetchdatafromapi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(
          Icons.store_outlined,
          size: 300,
        ),
      ),
    );
  }
}
