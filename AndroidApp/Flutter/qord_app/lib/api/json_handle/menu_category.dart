import 'menu_item.dart';

class MenuCategory {
  String categoryName = '';
  List<MenuItem> categoryItems = [];

  Map categoryObj;

  MenuCategory({this.categoryObj}) {
    categoryName = categoryObj["menu_category_name"];

    List<Object> list_items = categoryObj["items_list"];
    for (int i = 0; i < list_items.length; i++) {
      categoryItems.add(MenuItem.fromJson(list_items[i]));
    }
  }

  MenuCategory.fromJson(Map<String, dynamic> json) {
    categoryName = json["menu_category_name"];

    List<Object> list_items = json["items_list"];
    for (int i = 0; i < list_items.length; i++) {
      categoryItems.add(MenuItem.fromJson(list_items[i]));
    }
  }
}
