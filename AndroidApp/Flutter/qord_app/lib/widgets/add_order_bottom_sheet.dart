import 'package:flutter/material.dart';
import 'package:qord_app/api/json_handle/menu_item.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:qord_app/api/order_api/order_list.dart';
import 'package:qord_app/api/order_api/order_model.dart';

class OrderBottomSheet extends StatefulWidget{

  MenuItem selectedItem;

  // OrderBottomSheet({this.selectedItem});
  OrderBottomSheet({Key key, this.selectedItem}) : super(key: key);

  @override
  _OrderBottomSheetState createState() => _OrderBottomSheetState();

}

class _OrderBottomSheetState extends State<OrderBottomSheet>{


  int itemCount = 1;
  bool isZero = false;
  Color enabledColor = Colors.greenAccent;
  Color disabledColor = Colors.grey;

  void increment(){
    setState(() {
      if(isZero == true){
        isZero = false;
      }
      itemCount++;
    });
  }

  void decrement(){
    if (itemCount > 0){
      itemCount--;
    }

    setState(() {
      if (itemCount > 0){
        isZero = false;
      }
      else {
        isZero = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircleAvatar(
                backgroundColor: isZero ?  disabledColor : enabledColor,
                child: TextButton(
                  child: Icon(Icons.remove,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    decrement();
                  },
                ),
              ),
            ),
            Text(itemCount.toString(),
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircleAvatar(
                backgroundColor: Colors.greenAccent,
                child: TextButton(
                  child: Icon(Icons.add,
                  color: Colors.white,
                  ),
                  onPressed: () {
                    increment();
                  },
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: isZero ?  disabledColor : enabledColor ,
                    border: Border.all(
                      color: isZero ?  disabledColor : enabledColor,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: TextButton(
                      onPressed: () {
                        if (isZero == false){
                          OrderModel om = OrderModel(
                            item: widget.selectedItem,
                            quantity: itemCount,
                          );
                          // Provider.of<OrderList>(context, listen: false);
                          context.read<OrderList>().addToList(om);
                          // print(context.read<OrderList>().orderList.length);
                          Navigator.pop(context);
                        }
                      },
                      child: Text('Add to Order',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),

                  ),
              ),
            )
          ],
        ),
      ),
    );
  }

}
