import 'dart:async';
import 'package:http/http.dart';
import 'dart:convert';

class RestApi {

  // String endpoint = "http://qrorder.go.ro/";
  String endpoint = 'http://10.0.2.2:8000/';
  // String endpoint = 'http://127.0.0.1:8000/';
  // String endpoint = 'http://192.168.0.103:8000/';

  String restaurantDetailsApi = 'rest/';

  String orderApi = 'orderapi/';
  String requestPaymentLink = 'payment/';

  int statusCode;

  static const int restaurant_details_timeout = 3000;
  static const int post_data_packet_timeout = 6000;

  // In order for this to work, in "\android\app\src\main\AndroidManifest.xml"
  // there needs to a tag named android:usesCleartextTraffic="true" in application
  // 10.0.2.2 is the host to connect from
  Future<Map> getRestaurantDetails(String tableCode) async {
    for (int i = 0; i < 10; i++) {
      try {
        Uri table_url = Uri.parse(endpoint + restaurantDetailsApi + tableCode);
        Response getRes = await get(table_url)
            .timeout(const Duration(milliseconds: restaurant_details_timeout));
        statusCode = getRes.statusCode;
        if (statusCode == 200) {
          Map response_data = json.decode(getRes.body);
          return response_data;
        }
        else {
          statusCode = getRes.statusCode;
          return null;
        }
      }
      on TimeoutException {
        print('Attempt: ' + i.toString());
      }
    }
    statusCode = 408; // Request Timeout
    return null;
  }

  Future<Map> sendOrderToServer(String jsonOrderList) async {
    try {
      Uri post_url =  Uri.parse(endpoint + orderApi);
      Response postResp = await post(post_url, body: jsonOrderList)
          .timeout(const Duration(milliseconds: post_data_packet_timeout));
      statusCode = postResp.statusCode;
      if (statusCode == 200){
        return json.decode(postResp.body);
      }
      else {
        statusCode = postResp.statusCode;
        return null;
      }
    }
    on TimeoutException {
      statusCode = 408;
      return null;
    }
  }

  Future<String> requestPayment(int orderId, String paymentMethod) async{
    try {
      Uri post_url =  Uri.parse(endpoint + orderApi + requestPaymentLink);

      Map paymentRequestBody = {
        'order_id' : orderId,
        'payment_method': paymentMethod,
      };

      Response postResp = await post(
          post_url,
          body: json.encode(paymentRequestBody),
          ).timeout(const Duration(milliseconds: post_data_packet_timeout));

      statusCode = postResp.statusCode;
      if (statusCode == 200){
        return postResp.body;
      }
      else {
        statusCode = postResp.statusCode;
        return null;
      }
    }
    on TimeoutException {
      statusCode = 408;
      return null;
    }
  }
}

// void main() async{
//   RestApi r = RestApi();
//   await r.requestPayment(40, 'Cash');
//   print(r.statusCode);
// }
