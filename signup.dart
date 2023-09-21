import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool agreeToTerms = false;
  String selectedRole = ''; // To store the selected role

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            margin: EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedRole = 'Owner';
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: selectedRole == 'Owner'
                                ? Color.fromARGB(255, 68, 186, 225)
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Text(
                                'Owner',
                                style: TextStyle(
                                  color: selectedRole == 'Owner'
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text('👑', style: TextStyle(fontSize: 24)),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedRole = 'Crew Member';
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: selectedRole == 'Crew Member'
                                ? Color.fromARGB(255, 68, 186, 225)
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Text(
                                'Crew Member',
                                style: TextStyle(
                                  color: selectedRole == 'Crew Member'
                                      ? Color.fromARGB(255, 254, 254, 254)
                                      : Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text('👷‍♂️', style: TextStyle(fontSize: 24)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Full Name',
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
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      prefixIcon: Icon(Icons.phone),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Set Password',
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      Checkbox(
                        value: agreeToTerms,
                        onChanged: (value) {
                          setState(() {
                            agreeToTerms = value!;
                          });
                        },
                      ),
                      Text('Remember me'),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Add your sign-up logic here
                      // Navigate to the next screen upon successful sign-up
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue, // Change the button color as needed
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.person_add,
                            size: 24), // Add your desired icon
                        SizedBox(
                            width: 8), // Add spacing between the icon and text
                        Text('Create Account', style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
