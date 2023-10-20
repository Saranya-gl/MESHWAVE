import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
  ));
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9D8C5), // Background color
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Username input field
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF269493), // Box color
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Username',
                    contentPadding: EdgeInsets.all(15),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 20), // Spacing between input fields

              // Password input field
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF269493), // Box color
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    contentPadding: EdgeInsets.all(15),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 20), // Spacing between input fields

              // Login button
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF269493), // Box color
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  onPressed: () {
                    // Implement your login logic here
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),

              SizedBox(height: 10), // Spacing between login button and links

              // Forgot Password link
              GestureDetector(
                onTap: () {
                  // Implement your "Forgot Password" logic here
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(color: Color(0xFF269493)),
                ),
              ),

              // Sign Up link
              GestureDetector(
                onTap: () {
                  // Implement your "Sign Up" logic here
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Color(0xFF269493),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
