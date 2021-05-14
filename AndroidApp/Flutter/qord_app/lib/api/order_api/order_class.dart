import 'package:flutter/cupertino.dart';
import 'package:qord_app/api/json_handle/menu_item.dart';

class OrderItem {
  MenuItem item;
  int quantity;
}

class FinalOrder extends ChangeNotifier{
  List<OrderItem> order_list = [];

  void add_item(OrderItem oi){
    order_list.add(oi);
    notifyListeners();
  }
}

