import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qord_app/api/json_handle/menu.dart';
import 'package:qord_app/api/json_handle/menu_category.dart';
import 'package:qord_app/pages/food_items_page.dart';
import 'package:qord_app/widgets/go_to_cart_widget.dart';
import 'package:qord_app/api/order_api/order_list.dart';

class MenuPage extends StatefulWidget {

  static const route = '/menu';

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  Color indicatorColor = Color(0xffd20900);
  Color smokingNotAllowedColor = Color(0xffd20900);
  Color smokingAllowedColor = Colors.green;
  Color appBarColor = Color(0xff123456);
  Color darkenColor = Color(0x80000000);

  Menu menuObj;

  Map item = {
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
            "item_price": 40.0,
            "ingredients": [
              "Bread",
              "Angus",
              "Sare",
              "Mayo",
              "Pickles",
              "BBQ Sauce"
            ],
            "allergen": [
              "Eggs",
              "Wheat",
              "Milk"
            ]
          },
          {
            "item_name": "Onion Burger",
            "item_calories": 12,
            "item_weight": 23,
            "item_price": 24.0,
            "ingredients": [
              "Grilled Onions",
              "Bread",
              "Mayo",
              "Porc"
            ],
            "allergen": []
          },
          {
            "item_name": "Cheeseburger",
            "item_calories": 500,
            "item_weight": 400,
            "item_price": 30.0,
            "ingredients": [
              "Bread",
              "Mayo",
              "Cheese",
              "Beef",
              "Tomato"
            ],
            "allergen": []
          },
          {
            "item_name": "Hamburger",
            "item_calories": 450,
            "item_weight": 300,
            "item_price": 29.5,
            "ingredients": [],
            "allergen": []
          }
        ]
      },
      {
        "menu_category_name": "Pizza",
        "items_list": [
          {
            "item_name": "Diavola",
            "item_calories": 800,
            "item_weight": 500,
            "item_price": 35.0,
            "ingredients": [
              "Pizza dough",
              "Tomato Sauce",
              "Mushrooms",
              "Prosciutto",
              "Peperonni",
              "Jalapenos",
              "Chilli Sauce"
            ],
            "allergen": []
          }
        ]
      },
      {
        "menu_category_name": "Desert",
        "items_list": [
          {
            "item_name": "Beef desert",
            "item_calories": 400,
            "item_weight": 200,
            "item_price": 21.0,
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
            "item_price": 35.0,
            "ingredients": [],
            "allergen": [
              "Fish"
            ]
          }
        ]
      },
      {
        "menu_category_name": "Salads",
        "items_list": []
      },
      {
        "menu_category_name": "Coffee",
        "items_list": []
      },
      {
        "menu_category_name": "Soup",
        "items_list": []
      }
    ]
  };


  @override
  Widget build(BuildContext context) {

    final Map response = ModalRoute.of(context).settings.arguments;
    menuObj = Menu(menuJSON: response['response']);

    // Menu menuObj = Menu(menuJSON: item);

    List<String> categories = menuObj.menuCategories();
    List<MenuCategory> categInstances = menuObj.menuCateg;

    Widget smokeIndicator(){
      if(menuObj.smoke == false){
        return CircleAvatar(
          backgroundColor: smokingNotAllowedColor,
          child: Icon(
            Icons.smoke_free,
          ),
        );
      }
      else{
        return CircleAvatar(
          backgroundColor: smokingAllowedColor,
          child: Icon(
            Icons.smoking_rooms,
          ),
        );
      }
    }
    return Scaffold(
      body: WillPopScope(
        onWillPop: () {
          return showDialog(
              context: context,
              builder: (BuildContext context){
                return AlertDialog(
                  title: Text('Exit Menu ?'),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Text('Are you sure you want to exit the menu?'),
                        SizedBox(height: 8),
                        Text('Your whole delicious order list will be deleted.'),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: Text('Yes'),
                      onPressed: () {
                        context.read<OrderList>().orderAndEmpty();
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
            DefaultTabController(
              length: menuObj.menuCateg.length,
              child: CustomScrollView(
                slivers: <Widget>[
                SliverAppBar(
                  backgroundColor: appBarColor,
                  bottom: TabBar(
                    indicatorPadding: EdgeInsets.all(12),
                    indicatorColor: indicatorColor,
                    isScrollable: true,
                    tabs: categories.map((e) {
                      return Tab(
                        text: e,
                      );
                    }).toList(),
                  ),
                  automaticallyImplyLeading: false,
                  // backgroundColor: Color(0xffcbcbcb),
                  // centerTitle: true,
                  elevation: 0,
                  pinned: true,
                  snap: false,
                  floating: false,
                  stretch: true,
                  expandedHeight: 250.0,
                  actions: [
                    Container(
                      child: Row(
                        children: [
                          smokeIndicator(),
                          SizedBox(width: 10),
                      ],
                      ),
                    ),
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(menuObj.restaurantName,),
                        ),
                        Text(menuObj.restaurantDescription,
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.white.withOpacity(0.75),
                          ),
                        ),
                        SizedBox(height: 40,)
                      ],
                    ),
                    background: Container(
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                            darkenColor,
                            BlendMode.darken),
                        child: Image.asset(
                            'assets/app_photos/rest.jpg',
                            fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                  SliverFillRemaining(
                    child: TabBarView(
                          children:categInstances.map((e) {
                            return SingleChildScrollView(
                              child: FoodItemsPage(
                                menuCateg: e,
                              ),
                            );
                          }).toList(),
                      )
                    ),
              ]
              ),
            ),
            GoToCart(),
          ],
        ),
      ),
    );
  }
}
