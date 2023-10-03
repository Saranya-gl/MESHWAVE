import 'package:flutter/material.dart';

void main() {
  runApp(ForgotPasswordPage());
}

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  bool isLoading = false;

  void _sendEmail() {
    setState(() {
      isLoading = true;
      // Simulate sending an email (you can replace this with actual email sending logic).
      Future.delayed(Duration(seconds: 2), () {
        isLoading = false;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Password reset email sent.'),
        ));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20.0),

            // Username input field
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 16.0),

            // Email input field
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 16.0),

            // Send Email button
            ElevatedButton(
              onPressed: isLoading ? null : _sendEmail,
              child: Text('Send Email'),
            ),
            SizedBox(height: 16.0),

            // Loading spinner when sending email
            if (isLoading) CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
