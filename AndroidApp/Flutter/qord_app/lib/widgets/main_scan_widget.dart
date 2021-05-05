import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:barcode_scan_fix/barcode_scan.dart';
import 'package:qord_app/api/rest_api.dart';
import 'package:qord_app/pages/alternative_scan.dart';


class MainScanWidget extends StatelessWidget {
  // Color backgroundColor = Color(0xFFFFCF6F);
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
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                child: TextButton(
                    onPressed: () async {
                      String qr_scan = await return_qr_scan_result();
                      print(qr_scan);
                      Map server_response = await restObj.getRestaurantDetails(qr_scan);
                      if (restObj.statusCode == 200){
                        print("RESPONSE = " + server_response.toString());
                      }
                      else{
                        print('ERROR 404');
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
            ],
          ),
        ],
      ),
    );
  }
}
