import 'package:flutter/material.dart';
import 'package:qord_app/api/json_handle/menu_category.dart';
import 'package:qord_app/widgets/food_item_widget.dart';

class FoodItemsPage extends StatelessWidget {
  MenuCategory menuCateg;

  FoodItemsPage({this.menuCateg});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: menuCateg.categoryItems.map((e) {
        return CategoryCard(
          item: e,
        );
      }).toList(),
    );
  }
}
