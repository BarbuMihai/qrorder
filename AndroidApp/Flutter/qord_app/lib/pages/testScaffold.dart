import 'package:flutter/material.dart';
import 'package:qord_app/pages/cart_page.dart';

class TestScaffold extends StatefulWidget {

  static const route = '/test';

  @override
  _TestScaffoldState createState() => _TestScaffoldState();
}

class _TestScaffoldState extends State<TestScaffold> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CartPage(),
    );
  }
}