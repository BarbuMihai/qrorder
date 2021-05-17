import 'package:qord_app/api/order_api/order_model.dart';
import 'package:flutter/foundation.dart';

class OrderList with ChangeNotifier, DiagnosticableTreeMixin{

  List<OrderModel> orderList = [];

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

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('order', orderList.length));
  }
}