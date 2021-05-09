import 'package:flutter/material.dart';

import 'package:qord_app/pages/menu_page.dart';
import 'package:barcode_scan_fix/barcode_scan.dart';
import 'package:qord_app/api/rest_api.dart';
import 'package:qord_app/pages/alternative_scan_page.dart';
import 'package:qord_app/pages/welcome_qord_page.dart';


class MainScanWidget extends StatelessWidget {
  Color optionButtonColor;
  bool loading = false;

  MainScanWidget({Color buttonsColor}){
    optionButtonColor = buttonsColor;
  }

  RestApi restObj = new RestApi();

  Future<String> return_qr_scan_result() async {
    String codeScanner = await BarcodeScanner.scan();
    return codeScanner;
  }

  @override
  Widget build(BuildContext context) {

    void scan_button_function() async{
      String qr_scan = await return_qr_scan_result();
      print(qr_scan);
      loading = true;
      Map server_response = await restObj.getRestaurantDetails(qr_scan);
      loading = false;
      if (restObj.statusCode == 200){
        print(server_response);
        Navigator.pushNamed(
            context,
            MenuPage.route,
            arguments: {'response' : server_response}
        );
      }
      else{
        print('ERROR: ' + restObj.statusCode.toString() );
        Navigator.pushNamed(
          context,
          ApplicationWelcome.route,
        );
        Navigator.popAndPushNamed(
            context,
            AlternativeScan.route,
            arguments: {'error_code': restObj.statusCode}
        );
      }
    }

    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                child: TextButton(
                    onPressed: () {
                      scan_button_function();
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          child: Icon(
                            Icons.qr_code_scanner_outlined,
                            size: 70,
                            color: optionButtonColor,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text('Scan QR Code',
                          style: TextStyle(
                            color: optionButtonColor,
                          ),
                        ),
                      ],
                    )
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
