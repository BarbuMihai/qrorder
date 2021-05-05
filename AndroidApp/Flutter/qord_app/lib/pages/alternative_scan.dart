import 'package:flutter/material.dart';

class AlternativeScan extends StatelessWidget {
  int error_code;

  AlternativeScan({this.error_code});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // decoration: BoxDecoration(border: Border.all(color: Colors.blue, width: 5)),
                  child: Image.asset(
                    'assets/broken_qr.jpg',
                    fit: BoxFit.cover,
                    height: 300, // set your height
                    width: 300, // and width here
                  ),
                ),
                SizedBox(height: 50,),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text("OOPS!",
                        style: TextStyle(
                          fontSize: 22
                        )
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Seems like the QR code you just scanned is invalid.'),
                    SizedBox(
                      height: 5,
                    ),
                    Text("ERROR: " + error_code.toString()),
                    SizedBox(height: 70,),
                    Row(
                      children: [
                        Column(
                          children: [
                            FloatingActionButton(
                                onPressed: () {},
                                child: const Icon(Icons.qr_code_scanner_outlined),
                              backgroundColor: Colors.orangeAccent,
                            ),
                            SizedBox(height: 3,),
                            Text("Scan QR")
                          ],
                        ),
                        SizedBox(width: 70,),
                        Column(
                          children: [
                            FloatingActionButton(
                                onPressed: () {},
                                child: Icon(Icons.edit),
                              backgroundColor: Colors.orangeAccent,
                            ),
                            SizedBox(height: 3,),
                            Text("Write QR")
                          ],
                        )
                      ],
                    ),
                  ],
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}


