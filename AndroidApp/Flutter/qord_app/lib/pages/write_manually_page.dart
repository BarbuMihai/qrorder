import 'package:flutter/material.dart';
import 'package:qord_app/api/rest_api.dart';

import 'package:qord_app/pages/alternative_scan_page.dart';
import 'package:qord_app/pages/welcome_qord_page.dart';

class WriteCode extends StatelessWidget {

  static const route = '/writeManually';

  RestApi restObj = new RestApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Image.asset(
              'assets/app_photos/cropped_donut.png'
            ),
          ),
          Container(
            width: 250,
            child: Column(
              children: [
                Text("Enter Code Manually:",
                style: TextStyle(
                  fontFamily: 'Georgia',
                  fontSize: 18,
                  color: Color(0xff3b3b3b),
                ),
                ),
                SizedBox(height: 10),
                TextField(
                  onSubmitted: (qr_text) async {
                      print(qr_text);
                      Map server_response = await restObj.getRestaurantDetails(qr_text);
                      if (restObj.statusCode == 200){
                        print("RESPONSE = " + server_response.toString());
                        Navigator.popAndPushNamed(
                            context,
                            ApplicationWelcome.route,
                        );
                      }
                      else{
                        print('ERROR: ' + restObj.statusCode.toString() );
                        Navigator.popAndPushNamed(
                            context,
                            AlternativeScan.route,
                            arguments: {'error_code': restObj.statusCode}
                        );
                      }
                    },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        Image.asset(
          'assets/app_photos/tomato_thin.png'
        ),
        ],
      ),
    );
  }
}

