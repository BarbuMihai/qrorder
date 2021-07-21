import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:qord_app/api/order_api/order_list.dart';

import 'package:qord_app/pages/welcome_qord_page.dart';
import 'package:qord_app/pages/alternative_scan_page.dart';
import 'package:qord_app/pages/write_manually_page.dart';
import 'package:qord_app/pages/menu_page.dart';
import 'package:qord_app/pages/testScaffold.dart';
import 'package:qord_app/pages/loading_page.dart';
import 'package:qord_app/pages/cart_page.dart';
import 'package:qord_app/pages/waiting_lobby_page.dart';
import 'package:qord_app/pages/view_ordered_items_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => OrderList()),
    ],
    child: MaterialApp(
      // initialRoute: MenuPage.route,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffcbcbcb),
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      routes: {
        ViewOrdered.route: (context) => ViewOrdered(),
        WaitingLobby.route: (context) =>WaitingLobby(),
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


