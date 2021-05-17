import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qord_app/api/order_api/order_model.dart';
import 'package:qord_app/api/order_api/order_list.dart';

import 'package:qord_app/pages/cart_page.dart';

class GoToCart extends StatefulWidget {
  @override
  _GoToCartState createState() => _GoToCartState();
}

class _GoToCartState extends State<GoToCart> {
  @override
  Widget build(BuildContext context) {

  Color avg = Color(0xff483426);
  Color buttonColor = Colors.green;

    List<OrderModel> cartItems = context.watch<OrderList>().orderList;
    int cartTotalItems = 0;
    for (int i = 0; i < cartItems.length; i++){
      cartTotalItems += cartItems[i].quantity;
    }

    if (cartTotalItems != 0){
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 65,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: buttonColor,
                          border: Border.all(
                            color: buttonColor,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: TextButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(1.5
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: CircleAvatar(
                                  backgroundColor: buttonColor,
                                  child: Text(cartTotalItems.toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              Text('Go to Cart',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, CartPage.route);
                          }
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }
    else {
      return Container();
    }
  }
}
