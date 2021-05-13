import 'package:flutter/material.dart';
import 'package:qord_app/api/rest_api.dart';

import 'package:qord_app/pages/alternative_scan_page.dart';
import 'package:qord_app/pages/welcome_qord_page.dart';
import 'package:qord_app/pages/menu_page.dart';

import 'loading_page.dart';

class WriteCode extends StatelessWidget {

  static const route = '/writeManually';

  RestApi restObj = new RestApi();

  @override
  Widget build(BuildContext context) {
    void submit_button(text) async{
      print(text);
      LoadingPage.pushLoadingPage(context);
      Map server_response = await restObj.getRestaurantDetails(text);
      Navigator.pop(context);
      if (restObj.statusCode == 200){
        print("RESPONSE = " + server_response.toString());
        Navigator.pop(context);
        Navigator.popAndPushNamed(
          context,
          MenuPage.route,
            arguments: {'response' : server_response}
        );
      }
      else{
        print('ERROR: ' + restObj.statusCode.toString());
        Navigator.pop(context);
        Navigator.popAndPushNamed(
            context,
            AlternativeScan.route,
            arguments: {'error_code': restObj.statusCode}
        );
      }
    }

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
                    submit_button(qr_text);
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

