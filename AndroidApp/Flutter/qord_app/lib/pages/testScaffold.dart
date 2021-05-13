import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:qord_app/api/json_handle/menu_item.dart';
import 'package:qord_app/api/json_handle/test.dart';
import 'package:qord_app/pages/loading_page.dart';
import 'file:///C:/PROJEKTE/Licenta/AndroidApp/Flutter/qord_app/lib/widgets/food_item_widget.dart';
import 'package:qord_app/api/json_handle/menu.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:qord_app/widgets/boxed_text_widget.dart';

class TestScaffold extends StatefulWidget {
  static Map itm = {
    "restaurant_name": "MBB's Burger & More",
    "table_index": 8,
    "smoking_allowed": false,
    "restaurant_description": "Bringing the real Burger tradition to life",
    "menu_categories": [
      {
        "menu_category_name": "Burger",
        "items_list": [
          {
            "item_name": "BBQBurger",
            "item_calories": 600,
            "item_weight": 600,
            "item_price": 40,
            "ingredients": ["Bread", "Angus", "Sare", "Mayo", "Pickles"],
            "allergen": ["Eggs", "Wheat"]
          },
          {
            "item_name": "Onion Burger",
            "item_calories": 12,
            "item_weight": 23,
            "item_price": 124,
            "ingredients": [],
            "allergen": []
          }
        ]
      },
      {"menu_category_name": "Pizza", "items_list": []},
      {
        "menu_category_name": "Desert",
        "items_list": [
          {
            "item_name": "Beef desert",
            "item_calories": 400,
            "item_weight": 200,
            "item_price": 21,
            "ingredients": [],
            "allergen": []
          }
        ]
      },
      {
        "menu_category_name": "Main Course",
        "items_list": [
          {
            "item_name": "Somon Fille",
            "item_calories": 300,
            "item_weight": 200,
            "item_price": 35,
            "ingredients": [],
            "allergen": ["Fish"]
          }
        ]
      },
      {"menu_category_name": "Salads", "items_list": []},
      {"menu_category_name": "Coffee", "items_list": []},
      {"menu_category_name": "Soup", "items_list": []}
    ]
  };
  static const route = '/test';

  @override
  _TestScaffoldState createState() => _TestScaffoldState();
}

class _TestScaffoldState extends State<TestScaffold> {

  Widget BoxedText(text, color){
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: color,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Text(
            text,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Menu m = Menu(menuJSON: TestScaffold.itm);
  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
        8, //left,
        8, //top,
        8,//right,
        0//bottom)
    ),
      child: ExpansionTileCard(
        isThreeLine: true,
        baseColor: Colors.white,
        expandedColor: Colors.white,
        key: cardA,
        leading: CircleAvatar(
          backgroundColor: Colors.green,
          child: IconButton(
            icon: const Icon(Icons.add, color: Colors.white,),
            tooltip: 'Add Item to Order',
            onPressed: () {

            },
          ),
        ),
        title: Text(m.restaurantName,
        style: TextStyle(color: Colors.black),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Bread, Angus, Sare, Mayo, Pickles',
              style: TextStyle(color: Colors.black45)
            ),
            Text("40 Lei"),
          ],
        ),
        children: [
          Container(
            width: 300,
            child: Divider(
              thickness: 1.0,
              height: 1.0,
            ),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            ],
          )
        ),
      ],
    ),
    ),
    );
  }
}