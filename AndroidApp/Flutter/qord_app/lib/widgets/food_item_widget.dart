import 'package:flutter/material.dart';
import 'package:qord_app/api/json_handle/menu_item.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:qord_app/widgets/boxed_text_widget.dart';



class CategoryCard extends StatelessWidget {
  MenuItem item;

  CategoryCard({this.item});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();

    String ingredientsList = item.ingredients.join(', ');
    List<String> allergensList = item.allergens;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpansionTileCard(
        isThreeLine: true,
        baseColor: Colors.white,
        expandedColor: Colors.white,
        key: cardA,
        leading: CircleAvatar(
          backgroundColor: Colors.greenAccent,
          child: IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            tooltip: 'Add Item to Order',
            onPressed: () {
            },
          ),
        ),
        title: Text(item.itemName,
          style: TextStyle(color: Colors.black),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(ingredientsList,
                style: TextStyle(color: Colors.black45)
            ),
            Text(item.itemPrice.toString() + ' Lei',
                style: TextStyle(color: Colors.black45),
            ),
          ],
        ),
        children: [
          Divider(
            thickness: 1.0,
            height: 1.0,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BoxedText(
                    text: item.itemWeight.toString() + ' gr',
                    color: Colors.orange,
                  ),
                  BoxedText(
                    text: item.itemCalories.toString() + " kcal",
                    color: Colors.blue,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: allergensList.map((allergen){
                      return BoxedText(
                        text: allergen,
                        color: Colors.red,
                      );
                    }).toList(),
                  ),
                ],
              )
          ),
        ],
      ),
    );
  }
}
