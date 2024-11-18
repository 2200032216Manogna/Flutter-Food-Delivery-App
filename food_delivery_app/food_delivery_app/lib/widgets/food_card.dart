import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final String foodName;
  final String imageUrl;
  final double price;

  FoodCard({required this.foodName, required this.imageUrl, required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(imageUrl),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(foodName, style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Text('\$$price', style: TextStyle(color: Colors.lightBlueAccent)),
          ElevatedButton(
            onPressed: () {},
            child: Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
