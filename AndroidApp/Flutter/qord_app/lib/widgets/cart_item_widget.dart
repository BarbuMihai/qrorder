import 'package:flutter/material.dart';
import 'package:qord_app/api/order_api/order_list.dart';
import 'package:qord_app/api/order_api/order_model.dart';
import 'package:provider/provider.dart';
import 'package:qord_app/api/order_api/order_list.dart';

class CartItem extends StatefulWidget {
  OrderModel orderModel;


  CartItem({this.orderModel});

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {


  @override
  Widget build(BuildContext context) {

    double totalPrice = widget.orderModel.quantity * widget.orderModel.item.itemPrice;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 6,
      ),
      child: Container(
        height: 100,
        child: Card(
          child: Center(
            child: ListTile(
              isThreeLine: true,
              leading: Container(
                width: 25,
                height: 25,
                child: IconButton(
                  onPressed: (){
                    context.read<OrderList>().removeItem(widget.orderModel);
                    if (context.read<OrderList>().orderList.length == 0){
                      Navigator.pop(context);
                    }
                  },
                  icon: Icon(Icons.close),
                  color: Colors.black54,

                ),
              ),
              trailing: Column(
                children: [
                  Text(widget.orderModel.quantity.toString() + ' X ' + widget.orderModel.item.itemPrice.toString() + ' Lei'),
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: Text(' = ' + totalPrice.toString() + ' Lei'),
                  ),
                  Text('(Tax incl.)',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
              title: Text(
                widget.orderModel.item.itemName
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          border: Border.all(
                            color: Colors.greenAccent,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      // color: Colors.greenAccent,
                      child: GestureDetector(
                        child: Icon(Icons.remove,
                          color: Colors.white,
                        ),
                        onTap: () {
                          context.read<OrderList>().removeQuantity(widget.orderModel);
                          setState(() {
                            if(context.read<OrderList>().checkQuantity(widget.orderModel) == 0){
                              context.read<OrderList>().removeItem(widget.orderModel);
                              if (context.read<OrderList>().orderList.length == 0){
                                Navigator.pop(context);
                              }
                            }
                          });
                        },
                      ),
                    ),
                  ),
                  Text(widget.orderModel.quantity.toString(),
                  style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          border: Border.all(
                            color: Colors.greenAccent,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),

                      child: GestureDetector(
                        child: Icon(Icons.add,
                          color: Colors.white,
                        ),
                        onTap: () {
                          context.read<OrderList>().addQuantity(widget.orderModel);
                          setState(() {
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
