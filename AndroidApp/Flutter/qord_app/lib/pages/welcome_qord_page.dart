import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:toast/toast.dart';
import 'package:barcode_scan_fix/barcode_scan.dart';

import 'package:qord_app/api/order_api/order_list.dart';
import 'file:///C:/PROJEKTE/Licenta/AndroidApp/Flutter/qord_app/lib/api/rest/rest_api.dart';
import 'package:qord_app/pages/alternative_scan_page.dart';
import 'package:qord_app/widgets/main_scan_widget.dart';


class  ApplicationWelcome extends StatefulWidget {

  static const route = '/';

  @override
  _ApplicationWelcomeState createState() => _ApplicationWelcomeState();
}

class _ApplicationWelcomeState extends State<ApplicationWelcome> {

  double imageContainerSize = 220;

  void toast_notify(String notify_message, bool outcome){
    if (outcome){
      Toast.show(
          notify_message,
          context,
          duration: Toast.LENGTH_SHORT,
          gravity:  Toast.BOTTOM,
          backgroundColor: Colors.green[400],
          backgroundRadius: 20
      );
    }
    else{
      Toast.show(
          notify_message,
          context,
          duration: Toast.LENGTH_LONG,
          gravity:  Toast.BOTTOM,
          backgroundColor: Colors.red[400],
          backgroundRadius: 20
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Qord",
                    style: TextStyle(
                      fontFamily: 'Restaurant',
                      fontSize: 40,
                    ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: Image.asset(
                    'assets/app_photos/desert.png'
                  ),
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(' The menu you used for years.\n Now on your phone. ',
                textAlign: TextAlign.center,
                style: TextStyle(
                fontSize: 18,
                fontFamily: 'Restaurant',
                  ),
                ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: imageContainerSize,
                child: Image.asset(
                    'assets/app_photos/carrot_food_cropped.png'
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MainScanWidget(
                        buttonsColor: Color(0xff2b2b2b),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


