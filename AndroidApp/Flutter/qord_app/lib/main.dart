import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:qord_app/pages/TestScaffold.dart';

import 'package:qord_app/pages/welcome_qord.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(
      scaffoldBackgroundColor: const Color(0xffdedede),
    ),
    routes: {
      '/': (context) => ApplicationWelcome(),
      // '/scanPage': (context) => ScanQR(),
    },
    // routes: {
    //   '/': (context) => ApplicationWelcome(),
    //   '/scan': (context) => FetchServerData()
    // },
    ),
  );
}


