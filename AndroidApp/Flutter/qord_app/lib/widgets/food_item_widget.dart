import 'package:flutter/material.dart';
import 'package:qord_app/api/json_handle/menu_item.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:qord_app/widgets/boxed_text_widget.dart';
import 'package:qord_app/api/order_api/order_class.dart';


class CategoryCard extends StatelessWidget {
  MenuItem item;

  CategoryCard({this.item});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();

    String ingredientsList = item.ingredients.join(', ');

    List<Widget> allergenColumn = [];
    if (item.allergens.length != 0){
      allergenColumn.add(
        Text('Allergens: '),
      );
      for(int i = 0; i < item.allergens.length; i++){
        allergenColumn.add(
            BoxedText(
                text: item.allergens[i],
                color: Colors.red
            ),
        );
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 6,
      ),
      child: ExpansionTileCard(
        // isThreeLine: true,
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
              //TODO Add functionality here

            },
          ),
        ),
        title: Row(
          children: [
            Text(item.itemName,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 2),
              child: Text(item.itemPrice.toString() + ' Lei',
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
          child: Text(ingredientsList,
              style: TextStyle(color: Colors.black45)
          ),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Weight:'),
                      BoxedText(
                        text: item.itemWeight.toString() + ' gr',
                        color: Colors.orange,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: allergenColumn,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Calories:'),
                      BoxedText(
                        text: item.itemCalories.toString() + " kcal",
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ],
              )
          ),
        ],
      ),
    );
  }
}
