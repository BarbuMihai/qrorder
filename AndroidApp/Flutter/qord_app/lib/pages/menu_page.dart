import 'package:flutter/material.dart';
import 'package:qord_app/api/json_handle/menu_category.dart';
import 'package:qord_app/api/json_handle/menu.dart';
import 'file:///C:/PROJEKTE/Licenta/AndroidApp/Flutter/qord_app/lib/widgets/food_item_widget.dart';

import 'package:qord_app/pages/food_items_page.dart';

class MenuPage extends StatelessWidget {

  static const route = '/menu';

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
            "ingredients": ['Somon'],
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
      body: DefaultTabController(
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
    );
  }
}

// class MenuPage extends StatefulWidget {
//   static const route = '/menu';
//
//   @override
//   _MenuPageState createState() => _MenuPageState();
// }
//
// class _MenuPageState extends State<MenuPage> with SingleTickerProviderStateMixin {
//   TabController controller;
//
//   @override
//   void initState() {
//     super.initState();
//     controller = TabController(length: 3, vsync: this);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: NestedScrollView(
//         headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//           return [
//             SliverAppBar(
//               pinned: false,
//               backgroundColor: Colors.white,
//               flexibleSpace: FlexibleSpaceBar(
//                 collapseMode: CollapseMode.pin,
//                 background: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Container(
//                       height: 200.0,
//                       width: double.infinity,
//                       color: Colors.grey,
//                       child: FlutterLogo(),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Text(
//                         'Business Office',
//                         style: TextStyle(fontSize: 25.0),
//                         textAlign: TextAlign.left,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Text(
//                         'Open now\nStreet Address, 299\nCity, State',
//                         style: TextStyle(fontSize: 15.0),
//                         textAlign: TextAlign.left,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 10.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: <Widget>[
//                           Icon(Icons.share),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 10.0),
//                             child: Icon(Icons.favorite),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               expandedHeight: 380.0,
//               bottom: TabBar(
//                 indicatorColor: Colors.black,
//                 labelColor: Colors.black,
//                 tabs: [
//                   Tab(text: 'POSTS'),
//                   Tab(text: 'DETAILS'),
//                   Tab(text: 'FOLLOWERS'),
//                 ],
//                 controller: controller,
//               ),
//             )
//           ];
//         },
//         body: ListView.builder(
//           itemCount: 100,
//           itemBuilder: (BuildContext context, int index) {
//             return Card(
//               color: index % 2 == 0 ? Colors.blue : Colors.green,
//               child: Container(
//                 alignment: Alignment.center,
//                 width: double.infinity,
//                 height: 100.0,
//                 child: Text(
//                   'Flutter is awesome',
//                   style: TextStyle(fontSize: 18.0),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
