import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:qord_app/widgets/loading_widget.dart';

class TestScaffold extends StatelessWidget {

  static const route = '/test';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoadingScreen(
          color: Color(0xff444444),
        ),
      ),
    );
  }
}