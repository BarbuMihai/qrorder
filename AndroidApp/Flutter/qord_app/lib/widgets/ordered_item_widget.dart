import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qord_app/api/order_api/order_model.dart';

class OrderedItem extends StatelessWidget {
  OrderModel ordermodel;


  OrderedItem({this.ordermodel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        width: double.infinity,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      ordermodel.item.itemName,
                      style: TextStyle(
                        fontSize: 20, letterSpacing: 0.2
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(ordermodel.item.itemPrice.toString() + ' Lei',
                      style: TextStyle(color: Colors.orange),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 10),
                    Text(ordermodel.item.ingredients.join(', '),
                      style: TextStyle(
                          letterSpacing: 0.2
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 10),
                    Text(ordermodel.quantity.toString() +
                        ' X ' +
                        ordermodel.item.itemPrice.toString() +
                        ' = ' +
                        (ordermodel.quantity * ordermodel.item.itemPrice).toStringAsFixed(2) +
                        ' Lei',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
