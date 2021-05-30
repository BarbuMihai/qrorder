import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qord_app/api/order_api/order_list.dart';
import 'package:qord_app/api/rest/rest_api.dart';
import 'package:qord_app/pages/menu_page.dart';

import 'package:qord_app/pages/view_ordered_items_page.dart';

class WaitingLobby extends StatefulWidget {

  static const route = '/waiting';

  @override
  _WaitingLobbyState createState() => _WaitingLobbyState();
}

class _WaitingLobbyState extends State<WaitingLobby> {
  Color buttonColor = Colors.green[500];
  Color deactivateColor = Colors.grey;
  bool requested = false;

  List<PaymentOptions> paymentOpt = [
    PaymentOptions(option: 'App', ico: Icon(Icons.phone_android_outlined, color: Colors.black54)),
    PaymentOptions(option: 'Card', ico: Icon(Icons.credit_card_outlined, color: Colors.black54)),
    PaymentOptions(option: 'Cash', ico: Icon(Icons.money, color: Colors.black54)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () {
          return showDialog(
              context: context,
              builder: (BuildContext context){
                return AlertDialog(
                  title: Text('Are you sure you want to exit ?'),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Text('Your have an order on the way.'),
                        SizedBox(height: 8),
                        Text('Even if you leave you will still be able to see your order when you come back.'),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: Text('Yes'),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: Text('No'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              }
          );
        },
        child: Stack(
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/app_photos/tomato_thin.png'
                ),

                SizedBox(height: 50),
                Text('Thank you for ordering with',
                  style: TextStyle(
                      fontFamily: 'Restaurant',
                      fontSize: 20,
                  ),
                ),
                Text('Qord',
                  style: TextStyle(
                    fontFamily: 'Restaurant',
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 100),
                Text('Your order is on the way',
                  style: TextStyle(
                    fontFamily: 'Restaurant',
                    fontSize: 16 ,
                  ),
                ),
                FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: requested ? deactivateColor: buttonColor,
                          border: Border.all(
                            color: requested ? deactivateColor: buttonColor,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                        ),
                        child: TextButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 5),
                                Text('Add more to your order',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            onPressed: () {
                              if(!requested){
                                Navigator.pop(context);
                              }
                            }
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: requested ? deactivateColor: buttonColor,
                            border: Border.all(
                              color: requested ? deactivateColor: buttonColor,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: PopupMenuButton(
                            onSelected: (value){
                              if (requested == false){
                              print(value.option);
                              return showDialog(
                                  context: context,
                                  builder: (BuildContext context){
                                    return AlertDialog(
                                      title: Row(
                                        children: [
                                          value.ico,
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text('Request ' + value.option + ' payment ? '),
                                        ],
                                      ),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: <Widget>[
                                            Text('Your Order will be closed',
                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Text('Yes'),
                                          onPressed: () {
                                            RestApi r = RestApi();
                                            r.requestPayment(
                                                context.read<OrderList>().orderId,
                                                value.option
                                            );
                                            setState(() {
                                              requested = true;
                                            });
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          child: Text('Choose Other'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  }
                                );
                              }
                            },
                            child: Row(
                              children: [
                                Icon(Icons.credit_card_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 8),
                                Text('Request Payment',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            itemBuilder: (context) =>
                            requested ? [].map((e) => PopupMenuItem(child: Container())).toList() :
                            paymentOpt.map((e) => PopupMenuItem(
                                value: e,
                                child: Row(
                                  children: [
                                    e.ico,
                                    SizedBox(width: 5),
                                    Text(e.option),
                                  ],
                                )
                              )
                            ).toList(),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: buttonColor,
                            border: Border.all(
                              color: buttonColor,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        child: TextButton(
                          child: Row(
                            children: [
                              Icon(Icons.fastfood_outlined,
                                color: Colors.white,
                              ),
                              SizedBox(width: 8),
                              Text('View Ordered Items',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          onPressed: () {
                            print('Already Ordered: ' + context.read<OrderList>().alreadyOrdered.toString());
                            print('Order List: ' + context.read<OrderList>().orderList.toString());
                            Navigator.pushNamed(context, ViewOrdered.route);
                          },
                        ),
                      ),
                    ],
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

class PaymentOptions{
  String option;
  Icon ico;

  PaymentOptions({this.option, this.ico});
}






