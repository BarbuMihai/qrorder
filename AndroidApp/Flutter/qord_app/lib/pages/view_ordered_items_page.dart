import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qord_app/api/order_api/order_list.dart';
import 'package:qord_app/api/order_api/order_model.dart';

import 'package:qord_app/widgets/ordered_item_widget.dart';


class ViewOrdered extends StatelessWidget {

  static const route = '/ordered';

  @override
  Widget build(BuildContext context) {

    List<OrderModel> ord = context.read<OrderList>().alreadyOrdered;
    double totalOrdered = 0;

    for (int i = 0; i < ord.length; i++){
      totalOrdered += ord[i].quantity * ord[i].item.itemPrice;
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.fastfood_outlined),
            SizedBox(width: 8),
            Text('Ordered Items'),
          ],
        ),
        backgroundColor: Color(0xff123456),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close),
        ),
      ),

      body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: ord.map((item) {
                  return OrderedItem(ordermodel: item);
                }).toList(),
              ),
              Container(
                  width: 350,
                  child: Divider(thickness: 2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Total: ',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  Text(totalOrdered.toStringAsFixed(2) + ' Lei',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
      ),
    );
  }
}
