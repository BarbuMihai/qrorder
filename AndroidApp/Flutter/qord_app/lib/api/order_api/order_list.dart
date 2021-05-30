import 'package:qord_app/api/order_api/order_model.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';

class OrderList with ChangeNotifier, DiagnosticableTreeMixin{

  List<OrderModel> orderList = [];
  List<OrderModel> alreadyOrdered = [];
  String tableCode = '';
  int orderId = 0;

  void setOrderId(int recievedID){
    orderId = recievedID;
  }

  void addToList(OrderModel om){
    bool foundFlag = false;
    for(int i = 0; i < orderList.length; i++){
      if (orderList[i].item == om.item){
        orderList[i].quantity++;
        foundFlag = true;
        break;
      }
    }
    if (!foundFlag){
      orderList.add(om);
    }
    notifyListeners();
  }


  void removeItem(OrderModel om){
    orderList.remove(om);
    notifyListeners();
  }

  void addQuantity(OrderModel om){
    for(int i = 0; i < orderList.length; i++){
      if(orderList[i].item == om.item){
        orderList[i].quantity++;
      }
    }
    notifyListeners();
  }

  void removeQuantity(OrderModel om){
    for(int i = 0; i < orderList.length; i++){
      if(orderList[i].item == om.item){
        if (orderList[i].quantity > 0){
          orderList[i].quantity--;
        }
      }
    }
    notifyListeners();
  }

  int checkQuantity(OrderModel om) {
    for(int i = 0; i < orderList.length; i++){
      if(orderList[i].item == om.item){
        return orderList[i].quantity;
      }
    }
  }

  void orderAndEmpty(){
    for(int i=0; i < orderList.length; i++){
      alreadyOrdered.add(orderList[i]);
    }
    orderList.clear();
    notifyListeners();
  }

  String createOrderListDataPacket(){
    Map data_packet = {};
    List<Map> order_list = [];
    Map order_obj = {};

    if (orderId != 0){
     data_packet['order_id'] = orderId;
    }
    data_packet['table_index'] = tableCode;
    for(int i = 0; i < orderList.length; i++){
      order_obj = {
        'item_name': orderList[i].item.itemName,
        'quantity': orderList[i].quantity,
      };
      order_list.add(order_obj);
      // order_obj = {};
    }
    data_packet['food_items'] = order_list;
    print('DATA PACKET: ' + data_packet.toString());
    return json.encode(data_packet);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('order', orderList.length));
  }
}