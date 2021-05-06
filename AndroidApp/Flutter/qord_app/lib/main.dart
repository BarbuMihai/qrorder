import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:qord_app/pages/welcome_qord_page.dart';
import 'package:qord_app/pages/alternative_scan_page.dart';
import 'package:qord_app/pages/write_manually_page.dart';

import 'package:qord_app/pages/TestScaffold.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(
      scaffoldBackgroundColor: const Color(0xffcbcbcb),
      fontFamily: 'Georgia'
    ),
    routes: {
      ApplicationWelcome.route: (context) => ApplicationWelcome(),
      AlternativeScan.route: (context) => AlternativeScan(),
      WriteCode.route: (context) => WriteCode(),
    },
  ),

  );
}


