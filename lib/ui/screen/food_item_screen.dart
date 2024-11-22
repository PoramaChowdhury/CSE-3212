import 'package:flutter/material.dart';
import 'package:practice/ui/model/item.dart';
import 'package:practice/ui/widget/food_item.dart';

class FoodItemListScreen extends StatefulWidget {
  @override
  _FoodItemListScreenState createState() => _FoodItemListScreenState();
}

class _FoodItemListScreenState extends State<FoodItemListScreen> {
  final List<FoodItem> foodItems = [
    FoodItem(
      title: 'Ovenbake Pasta',
      price: '250',
      description: 'Pasta',
      imageUrl: 'asset/image/bakedpasta.jpg',
    ),
    FoodItem(
      title: 'Chicken Fry',
      price: '180',
      description: 'Crispy chicken fry',
      imageUrl: 'asset/image/chickenfry.jpg',
    ),
    FoodItem(
      title: 'Garlic Chicken',
      price: '220',
      description: 'Garlic-flavored chicken',
      imageUrl: 'asset/image/garlicChicken.jpg',
    ),
    FoodItem(
      title: 'Kabab',
      price: '300',
      description: 'Spicy grilled kabab',
      imageUrl: 'asset/image/kabab.jpg',
    ),
    FoodItem(
      title: 'Pasta',
      price: '150',
      description: 'Classic pasta',
      imageUrl: 'asset/image/pasta.jpg',
    ),
  ];

  Map<String, int> itemQuantities = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Food Items',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueGrey, Colors.lightBlueAccent],
            ),
          ),
        ),
        elevation: 9,
        centerTitle: true,
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        toolbarHeight: 80,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: foodItems.length,
          itemBuilder: (context, index) {
            final foodItem = foodItems[index];
            final itemCount = itemQuantities[foodItem.title] ?? 0;
            return FoodItemCard(
              foodItem: foodItem,
              itemCount: itemCount,
              onAdd: _addItem,
              onDelete: _removeItem,
            );
          },
        ),
      ),
    );
  }

  void _addItem(FoodItem foodItem) {
    setState(() {
      if (itemQuantities.containsKey(foodItem.title)) {
        itemQuantities[foodItem.title] = itemQuantities[foodItem.title]! + 1;
      } else {
        itemQuantities[foodItem.title] = 1;
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${foodItem.title} added to cart',
          style: const TextStyle(color: Colors.black),
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }

  void _removeItem(FoodItem foodItem) {
    setState(() {
      if (itemQuantities.containsKey(foodItem.title) &&
          itemQuantities[foodItem.title]! > 0) {
        itemQuantities[foodItem.title] = itemQuantities[foodItem.title]! - 1;
        if (itemQuantities[foodItem.title] == 0) {
          itemQuantities.remove(foodItem.title);
        }
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${foodItem.title} removed from cart',
          style: const TextStyle(color: Colors.black),
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}
