import 'dart:io';

import 'package:http/http.dart';
import 'dart:convert';

class RestApi {
  // String endpoint = 'http://10.0.2.2:8000/';
  String endpoint = 'http://192.168.0.103:8000/';
  String restaurantApi = 'rest/';
  int statusCode;

  // In order for this to work, in "\android\app\src\main\AndroidManifest.xml"
  // there needs to a tag named android:usesCleartextTraffic="true" in application
  // 10.0.2.2 is the host to connect from
  Future<Map> getRestaurantDetails(String tableCode) async {
    try {
      Response res = await get(endpoint + restaurantApi + tableCode);
      statusCode = res.statusCode;
      if(statusCode == 200) {
        Map response_data = json.decode(res.body);
        // print(response_data);
        return response_data;
      }
      else{
        return {'status': statusCode};
      }
    }
    on SocketException {
      statusCode = 408;
      return {'status': 408}; // Request Timeout
    }

  }
}