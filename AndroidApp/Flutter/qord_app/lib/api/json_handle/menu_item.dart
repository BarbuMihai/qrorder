class MenuItem {
  String itemName;
  int itemCalories;
  int itemWeight;
  int itemPrice;
  List<String> ingredients;
  List<String> allergens;

  Map item;

  MenuItem({this.item}){
   itemName = item['item_name'];
   itemCalories = item['item_calories'];
   itemWeight = item['item_weight'];
   itemPrice = item['item_price'];
   ingredients = item['ingredients'];
   allergens = item['allergen'];
  }

  MenuItem.fromJson(Map<String, dynamic> json) {
    itemName = json['item_name'];
    itemCalories = json['item_calories'];
    itemWeight = json['item_weight'];
    itemPrice = json['item_price'];
    ingredients = json['ingredients'].cast<String>();
    allergens = json['allergen'].cast<String>();
  }
}
