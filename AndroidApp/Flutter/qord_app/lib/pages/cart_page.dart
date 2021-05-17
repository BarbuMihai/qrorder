import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qord_app/api/order_api/order_model.dart';
import 'package:qord_app/api/order_api/order_list.dart';
import 'package:qord_app/widgets/cart_item_widget.dart';


class CartPage extends StatefulWidget {

  static const route = '/cart';

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    double totalPrice = 0;

    List<OrderModel> cartItems = context.watch<OrderList>().orderList;

    // ignore: non_constant_identifier_names
    List<Widget> CartList(){
      List<Widget> wl = [];
      for(int i = 0; i < cartItems.length; i++){
        wl.add(CartItem(
          orderModel: cartItems[i],
        ));
      }
      return wl;
    }

    double totalPriceCalculator(){
      double total = 0;
        for(int i = 0; i < cartItems.length; i++){
          total += cartItems[i].item.itemPrice * cartItems[i].quantity;
        }
        return total;
    }

    totalPrice = totalPriceCalculator();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff123456),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close),
        ),
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.lunch_dining),
            ),
            Text('Cart'),
          ],
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: CartList(),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 100,
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 6,
                          ),
                          child: Row(
                            children: [
                              Text("Total",
                                style: TextStyle(
                                  fontSize: 24
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(6, 8, 2, 0),
                                child: Text('(Tax incl.)',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black45
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 6,
                          ),
                          child: Text(totalPrice.toString() + ' Lei',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.green,
                              border: Border.all(
                                color: Colors.green,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child: TextButton(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Place Order',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                //TODO Post Order to server
                              }
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
