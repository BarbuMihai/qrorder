import 'package:flutter/material.dart';
import 'package:qord_app/widgets/alternative_scan_widget.dart';
import 'package:qord_app/widgets/main_scan_widget.dart';


class TestScaffold extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Expanded(
                child: Image.asset(
                  "assets/app_photos/tomato_thin.png",
                ),
              ),
            ],
          ),
          AlternativeScanWidget(
            buttonsColor: Color(0xf2a2a2a),
          ),
          Row(
            children: [
              Expanded(
                child: Image.asset(
                  'assets/app_photos/cropped_donut.png',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
