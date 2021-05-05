import 'package:flutter/material.dart';
import 'package:barcode_scan_fix/barcode_scan.dart';


class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {

  String scan_result;

  Future<String> return_qr_scan_result() async {
    String codeScanner = await BarcodeScanner.scan();
    return codeScanner;
  }

  @override
  void initState() async {
    super.initState();
    scan_result = await BarcodeScanner.scan();
    setState(() {
      print(scan_result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Text('Scan $scan_result'),
      ),
    );
  }
}
