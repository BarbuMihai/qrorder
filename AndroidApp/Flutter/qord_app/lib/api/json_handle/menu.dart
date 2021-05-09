import 'menu_category.dart';

class Menu {
  String restaurantName = '';
  int tableIndex = 0;
  bool smoke = false;
  String restaurantDescription  = '';
  List<MenuCategory> menuCateg = [];

  Map menuJSON;

  Menu({this.menuJSON}){
    restaurantName = menuJSON['restaurant_name'];
    tableIndex = menuJSON['table_index'];
    smoke = menuJSON['smoking_allowed'];
    restaurantDescription = menuJSON['restaurant_description'];

    List<Object> categ_list = menuJSON['menu_categories'];

    for (int i = 0; i < categ_list.length; i++){
      menuCateg.add( new MenuCategory.fromJson(categ_list[i]));
    }
  }

  Menu.fromJson(Map<String, dynamic> json) {
    restaurantName = json['restaurant_name'];
    tableIndex = json['table_index'];
    smoke = json['smoking_allowed'];
    restaurantDescription = json['restaurant_description'];

    List<Object> categ_list = json['menu_categories'];

    for (int i = 0; i < categ_list.length; i++){
      menuCateg.add( new MenuCategory.fromJson(categ_list[i]));
    }
  }

  List<String> menuCategories(){

    List<String> categ_names = [];
    for (int i = 0; i < menuCateg.length; i++){
      categ_names.add(menuCateg[i].categoryName);
    }
    return categ_names;
  }

}

