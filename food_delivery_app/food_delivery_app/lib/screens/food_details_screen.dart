import 'package:flutter/material.dart';

class FoodDetailsScreen extends StatelessWidget {
  final String foodName;

  // Constructor to accept the foodName
  FoodDetailsScreen({required this.foodName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(foodName),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Center(
        child: Text('Details about $foodName', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
