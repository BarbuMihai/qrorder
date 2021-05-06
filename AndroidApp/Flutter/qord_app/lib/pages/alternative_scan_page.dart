import 'package:flutter/material.dart';
import 'package:qord_app/widgets/alternative_scan_widget.dart';

class AlternativeScan extends StatelessWidget {

  static const route = '/alternativeScan';

  @override
  Widget build(BuildContext context) {

    final Map error_code = ModalRoute.of(context).settings.arguments;

    return Container(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    child: Image.asset(
                      'assets/app_photos/crushed_ice_shadow.png'
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text('OOPS!',
                  style: TextStyle(
                      fontSize: 20,
                  ),
                ),
                Text('Seems like the Qr you just scanned is invalid!\n',
                style: TextStyle(
                  fontSize: 16,
                ),
                ),
                Text('ERROR CODE : ' + error_code['error_code'].toString())
              ],
            ),
            AlternativeScanWidget(
              buttonsColor: Color(0xff2b2b2b),
            ),

          ],

        ),
      ),
    );
  }
}


