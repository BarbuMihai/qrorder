import 'package:flutter/material.dart';

import 'package:barcode_scan_fix/barcode_scan.dart';
import 'package:qord_app/api/rest_api.dart';

import 'package:qord_app/pages/welcome_qord_page.dart';
import 'package:qord_app/pages/alternative_scan_page.dart';
import 'package:qord_app/pages/write_manually_page.dart';
import 'package:qord_app/pages/menu_page.dart';
import 'package:qord_app/pages/loading_page.dart';


class AlternativeScanWidget extends StatelessWidget {
  Color optionButtonColor;

  AlternativeScanWidget({Color buttonsColor}){
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
      LoadingPage.pushLoadingPage(context);
      Map server_response = await restObj.getRestaurantDetails(qr_scan);
      Navigator.pop(context);
      if (restObj.statusCode == 200){
        print("RESPONSE = " + server_response.toString());

        Navigator.popAndPushNamed(
          context,
          MenuPage.route,
        );
      }
      if (restObj.statusCode != 200){
        print('ERROR ' + restObj.statusCode.toString());
        Navigator.popAndPushNamed(
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 1,
              child: TextButton(
                  onPressed: () async {
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
            Container(
                height: 90,
                child: VerticalDivider(
                    thickness: 2,
                )
            ),
            Expanded(
              flex: 1,
              child: TextButton(
                  onPressed: () async {
                    Navigator.pushNamed(
                        context,
                        WriteCode.route,
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: Icon(
                            Icons.edit,
                            size: 70,
                            color: optionButtonColor,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        'Write Manually',
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
      );
  }
}
