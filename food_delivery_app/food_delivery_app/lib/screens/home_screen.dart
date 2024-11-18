import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? selectedRestaurantIndex; // To track the selected restaurant

  final List<Map<String, dynamic>> restaurants = [
    {
      'name': 'Pizza Hut',
      'image': 'assets/images/pizza_hut_logo.jpg',
      'menuItems': [
        {
          'name': 'Pepperoni Pizza',
          'image': 'assets/images/pepperoni_pizza.jpg',
          'price': '\$12.99',
        },
        {
          'name': 'Veggie Pizza',
          'image': 'assets/images/veggie_pizza.jpg',
          'price': '\$10.99',
        },
      ],
    },
    {
      'name': 'McDonald\'s',
      'image': 'assets/images/mcdonalds_logo.jpg',
      'menuItems': [
        {
          'name': 'Big Mac',
          'image': 'assets/images/big_mac.jpg',
          'price': '\$9.99',
        },
        {
          'name': 'French Fries',
          'image': 'assets/images/french_fries.jpg',
          'price': '\$3.99',
        },
      ],
    },
    {
      'name': 'KFC',
      'image': 'assets/images/kfc_logo.jpg',
      'menuItems': [
        {
          'name': 'Fried Chicken',
          'image': 'assets/images/fried_chicken.jpg',
          'price': '\$10.99',
        },
        {
          'name': 'Coleslaw',
          'image': 'assets/images/coleslaw.jpg',
          'price': '\$2.99',
        },
      ],
    },
  ];

  // Mock user data
  final Map<String, String> user = {
    'name': 'Manogna',
    'email': 'manogna@gmail.com',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent[50],
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.lightBlueAccent,
        actions: [
          // Search button
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: SearchBarDelegate());
            },
          ),

          // Profile button (top right corner)
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Navigate to profile screen and pass user data
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(user: user),
                ),
              );
            },
          ),
        ],
      ),
      body: Row(
        children: [
          // Restaurant List on the left
          Expanded(
            flex: 2,
            child: ListView.builder(
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                final restaurant = restaurants[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: ListTile(
                    leading: Image.asset(
                      restaurant['image'],
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(restaurant['name']),
                    onTap: () {
                      setState(() {
                        selectedRestaurantIndex = index; // Update selected restaurant
                      });
                    },
                  ),
                );
              },
            ),
          ),

          // Restaurant Details on the right
          Expanded(
            flex: 3,
            child: selectedRestaurantIndex == null
                ? Center(child: Text('Select a restaurant to see details'))
                : _buildRestaurantDetails(selectedRestaurantIndex!),
          ),
        ],
      ),
    );
  }

  // Method to build restaurant details
  Widget _buildRestaurantDetails(int index) {
    final restaurant = restaurants[index];
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Restaurant Name and Image
          Text(
            restaurant['name'],
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Image.asset(
            restaurant['image'],
            height: 150,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 20),
          Text(
            'Menu Items',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: restaurant['menuItems'].length,
              itemBuilder: (context, menuIndex) {
                final menuItem = restaurant['menuItems'][menuIndex];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: Image.asset(
                      menuItem['image'],
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(menuItem['name']),
                    subtitle: Text(menuItem['price']),
                  ),
                );
              },
            ),
          ),

          // Place Order Button
          SizedBox(height: 20), // Space between menu and button
          ElevatedButton(
            onPressed: () {
              // Action to be performed when button is clicked
              _placeOrder(context, restaurant['name']);
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              backgroundColor: Colors.lightBlueAccent,
            ),
            child: Text(
              'Place Order',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  // Method to handle place order action
  void _placeOrder(BuildContext context, String restaurantName) {
    // Replace this with your desired functionality,
    // e.g., navigate to an order confirmation screen or show a message
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Order Placed'),
        content: Text('Your order has been placed at $restaurantName!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}

// Profile screen displaying user information
class ProfileScreen extends StatelessWidget {
  final Map<String, String> user;

  ProfileScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'User Information',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Name: ${user['name']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Email: ${user['email']}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom search delegate for handling search functionality
class SearchBarDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text("Search Results for: $query"),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = ['Pizza Hut', 'McDonald\'s', 'KFC', 'Subway']; // Sample search suggestions

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]),
          onTap: () {
            query = suggestions[index];
            showResults(context);
          },
        );
      },
    );
  }
}
