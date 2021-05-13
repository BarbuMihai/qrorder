import 'menu.dart';

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


void main(){
  Menu m = Menu(menuJSON: item);
  print(m.menuCateg[0].categoryItems.length);
}