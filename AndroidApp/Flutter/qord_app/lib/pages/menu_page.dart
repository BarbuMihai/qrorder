import 'package:flutter/material.dart';
import 'package:qord_app/widgets/alternative_scan_widget.dart';
import 'package:qord_app/widgets/main_scan_widget.dart';
import 'package:qord_app/api/json_handle/menu.dart';

class MenuPage extends StatelessWidget {

  static const route = '/menu';

  static Map r ={
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

  @override
  Widget build(BuildContext context) {

    // final Map response = ModalRoute.of(context).settings.arguments;
    // Menu menuObj = Menu(menuJSON: response['response']);

    Menu menuObj = Menu(menuJSON: r);
    List<String> categories = menuObj.menuCategories();
    List<Widget> widgets = categories.map((name) => new Text(name)).toList();

    return Scaffold(
      body: SafeArea(
          child: Center(
            child: Column(
              children: [
                // categories.map((item) => Text(item)).toList(),
              ],
            ),
          )),
    );
  }
}
