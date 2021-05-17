import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:qord_app/pages/welcome_qord_page.dart';
import 'package:qord_app/pages/alternative_scan_page.dart';
import 'package:qord_app/pages/write_manually_page.dart';
import 'package:qord_app/pages/menu_page.dart';
import 'package:qord_app/pages/testScaffold.dart';
import 'package:qord_app/pages/loading_page.dart';
import 'package:qord_app/pages/cart_page.dart';

import 'package:provider/provider.dart';

import 'package:qord_app/api/order_api/order_list.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => OrderList()),
    ],
    child: MaterialApp(
      initialRoute: MenuPage.route,
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        scaffoldBackgroundColor: const Color(0xffcbcbcb),
        fontFamily: 'Georgia'
      ),
      routes: {
        CartPage.route: (context) => CartPage(),
        LoadingPage.route: (context) => LoadingPage(),
        TestScaffold.route: (context) => TestScaffold(),
        MenuPage.route: (context) => MenuPage(),
        ApplicationWelcome.route: (context) => ApplicationWelcome(),
        AlternativeScan.route: (context) => AlternativeScan(),
        WriteCode.route: (context) => WriteCode(),
      },
    ),
  ),

  );
}


