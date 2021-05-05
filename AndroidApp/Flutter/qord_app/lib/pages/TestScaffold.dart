import 'package:flutter/material.dart';
import 'package:qord_app/widgets/alternative_scan_widget.dart';
import 'package:qord_app/widgets/main_scan_widget.dart';


class TestScaffold extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff1b72d),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(

            child: Image.asset(
              'assets/app_photos/carrot_food_croped.png',
            ),
          ),
          SizedBox(height: 100,),
          MainScanWidget(
            buttonsColor: Color(0xffffffff),
          ),
          SizedBox(height: 50,)
        ],
      ),
    );
  }
}
