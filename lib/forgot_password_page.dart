import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ForgotPasswordPage(),
    );
  }
}

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      backgroundColor: Color(0xFFF9D8C5), // Set the background color
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/forgot_password_image.jpg', // Replace with your image asset path
                height: 20, // Adjust the image height as needed
              ),
              SizedBox(height: 20),
              Text(
                'Forgot Password',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF20485A), // Set the text color
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Username or Phone Number',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add your logic to send a reset password link here
                  // Typically, this would involve sending an email to the user with a reset link
                  // You can also navigate to a confirmation page
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF20485A), // Set the button color
                ),
                child: Text('Reset Password'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
