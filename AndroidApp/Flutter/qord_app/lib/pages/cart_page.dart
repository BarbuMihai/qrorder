import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

import 'package:qord_app/api/rest/rest_api.dart';
import 'package:qord_app/api/order_api/order_model.dart';
import 'package:qord_app/api/order_api/order_list.dart';
import 'package:qord_app/pages/waiting_lobby_page.dart';
import 'package:qord_app/widgets/cart_item_widget.dart';
import 'package:qord_app/pages/loading_page.dart';

import 'package:qord_app/api/rest/statusCodes.dart';


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
                          child: Text(totalPrice.toStringAsFixed(2) + ' Lei',
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
                                  Icon(Icons.restaurant_menu,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 10),
                                  Text('Place Order',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              onPressed: () async{
                                String ojs = context.read<OrderList>().createOrderListDataPacket();
                                RestApi r = RestApi();
                                LoadingPage.pushLoadingPage(context);
                                Map postResponse = await r.sendOrderToServer(ojs);
                                print('Post Response: ' + postResponse.toString());
                                Navigator.pop(context);
                                Navigator.pop(context);
                                if(r.statusCode == 200){
                                  context.read<OrderList>().orderAndEmpty();
                                  Navigator.pushNamed(context, WaitingLobby.route);
                                  context.read<OrderList>().orderId = postResponse['order_id'];
                                  print ("CURRENT ORDER ID = " + context.read<OrderList>().orderId.toString());

                                }
                                else {
                                  Toast.show(
                                      'Error: '
                                          + r.statusCode.toString()
                                          + ' '
                                          + StatusCodes.codes[r.statusCode],
                                      context,
                                      duration: Toast.LENGTH_LONG,
                                      gravity:  Toast.BOTTOM,
                                      backgroundRadius: 20
                                  );
                                }
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
