import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatelessWidget {

  static const route = '/loading';
  
  // LoadingPage({this.color});

  static void pushLoadingPage(BuildContext context){
    Navigator.push(
      context,
      // LoadingPage.route,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => LoadingPage(),
        transitionDuration: Duration(seconds: 0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitCircle(
          color: Color(0xff2b2b2b),
          size: 100.0,
        ),
      ),
    );
  }
}