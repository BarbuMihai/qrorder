import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:barcode_scan_fix/barcode_scan.dart';
import 'package:qord_app/api/rest_api.dart';
import 'package:qord_app/pages/alternative_scan.dart';


class AlternativeScanWidget extends StatelessWidget {
  // Color backgroundColor = Color(0xFFFFCF6F);
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
    return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 180.0,
              height: 150.0,
              child: TextButton(
                  onPressed: () async {
                    String qr_scan = await return_qr_scan_result();
                    print(qr_scan);
                    Map server_response = await restObj.getRestaurantDetails(qr_scan);
                    if (restObj.statusCode == 200){

                      print("RESPONSE = " + server_response.toString());
                    }
                    if (restObj.statusCode != 200){
                      print('ERROR ' + restObj.statusCode.toString());

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AlternativeScan(
                              error_code: restObj.statusCode,
                            )
                        ),
                      );
                    }
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
                height: 100,
                child: VerticalDivider(
                    thickness: 2,
                )
            ),
            SizedBox(
              width: 180.0,
              height: 150.0,
              child: TextButton(
                  onPressed: () async {
                    String qr_scan = await return_qr_scan_result();
                    print(qr_scan);
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
