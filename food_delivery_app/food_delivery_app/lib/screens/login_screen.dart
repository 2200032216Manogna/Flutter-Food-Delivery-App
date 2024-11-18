import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Global key for the form
  final _formKey = GlobalKey<FormState>();

  // Controllers to capture email and password input
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Sample method for login (can be replaced with actual authentication logic)
  void _login() {
    if (_formKey.currentState!.validate()) {
      // If the form is valid, display a Snackbar or perform login logic
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Logging in...'),
      ));

      // You can replace this with your authentication logic, e.g., API call
      String email = _emailController.text;
      String password = _passwordController.text;

      print('Email: $email');
      print('Password: $password');

      // Navigate to the HomeScreen after successful login
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent[50],
      appBar: AppBar(
        title: Text('Food Delivery App'),  // Title on the left
        backgroundColor: Colors.lightBlueAccent,
        actions: [
          // Action buttons on the top right
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/signup');  // Navigate to signup
            },
            child: Text(
              'Signup',
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: () {
              // Since it's the login screen, we can optionally show a message
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Already on the login screen!'),
              ));
            },
            child: Text(
              'Login',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Email Field
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),

              // Password Field
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,  // Hide password input
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24.0),

              // Login Button
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  backgroundColor: Colors.lightBlueAccent,
                ),
                child: Text('Login', style: TextStyle(fontSize: 18)),
              ),

              // Optional Sign-Up or Forgot Password links
              TextButton(
                onPressed: () {
                  // Implement sign-up or forgot password functionality here
                  print('Forgot password tapped');
                },
                child: Text('Forgot Password?', style: TextStyle(color: Colors.lightBlueAccent)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}