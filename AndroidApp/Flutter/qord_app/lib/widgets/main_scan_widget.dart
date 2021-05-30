import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qord_app/pages/loading_page.dart';
import 'package:qord_app/pages/menu_page.dart';
import 'package:qord_app/pages/alternative_scan_page.dart';
import 'package:qord_app/pages/welcome_qord_page.dart';

import 'package:barcode_scan_fix/barcode_scan.dart';
import 'package:qord_app/api/order_api/order_list.dart';
import 'file:///C:/PROJEKTE/Licenta/AndroidApp/Flutter/qord_app/lib/api/rest/rest_api.dart';



class MainScanWidget extends StatelessWidget {
  Color optionButtonColor;

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
      context.read<OrderList>().tableCode = qr_scan;
      print(qr_scan);
      // pushLoadingScreen();
      LoadingPage.pushLoadingPage(context);
      Map server_response = await restObj.getRestaurantDetails(qr_scan);
      Navigator.pop(context);
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
