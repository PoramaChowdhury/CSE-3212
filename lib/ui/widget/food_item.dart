import 'package:flutter/material.dart';
import 'package:practice/ui/model/item.dart';
import 'package:practice/ui/screen/food_item_detail_screen.dart';

class FoodItemCard extends StatelessWidget {
  final FoodItem foodItem;
  final int itemCount;
  final Function(FoodItem) onAdd;
  final Function(FoodItem) onDelete;

  const FoodItemCard({
    Key? key,
    required this.foodItem,
    required this.itemCount,
    required this.onAdd,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.blue.withOpacity(0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(10),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FoodItemDetailScreen(foodItem: foodItem),
                  ),
                );
              },
              child: Image.asset(
                foodItem.imageUrl,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            foodItem.title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Text(
                foodItem.price,
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 3),
              Text(
                foodItem.description,
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.add_circle, color: Colors.green),
                onPressed: () {
                  onAdd(foodItem);
                },
              ),
              if (itemCount > 0) Text('$itemCount', style: TextStyle(fontSize: 16)),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  if (itemCount > 0) {
                    onDelete(foodItem);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}