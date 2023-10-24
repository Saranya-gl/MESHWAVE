import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SettingsPage(),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.notifications), // Icon for Notification Settings
            title: Text("Notification Settings"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              // Navigate to notification settings page
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle), // Icon for Account Settings
            title: Text("Account Settings"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              // Navigate to account settings page
            },
          ),
          ListTile(
            leading: Icon(Icons.privacy_tip), // Icon for Privacy Settings
            title: Text("Privacy Settings"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              // Navigate to privacy settings page
            },
          ),
          ListTile(
            leading: Icon(Icons.info), // Icon for About Us
            title: Text("About Us"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              // Navigate to about us page
            },
          ),
        ],
      ),
    );
  }
}
