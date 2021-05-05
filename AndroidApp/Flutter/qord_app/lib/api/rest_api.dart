import 'package:http/http.dart';
import 'dart:convert';

class RestApi {

  String endpoint = 'http://192.168.0.103:8000/';
  String restaurantApi = 'rest/';
  int statusCode;

  // In order for this to work, in "\android\app\src\main\AndroidManifest.xml"
  // there needs to a tag named android:usesCleartextTraffic="true" in application
  // 10.0.2.2 is the host to connect from
  Future<Map> getRestaurantDetails(String tableCode) async {
    Response res = await get(endpoint + restaurantApi + tableCode);
    statusCode = res.statusCode;
    if(statusCode == 200) {
      Map response_data = json.decode(res.body);
      // print(response_data);
      return response_data;
    }
    else{
      return {'error': statusCode};
    }
  }
}