import 'package:flutter/material.dart';

void main() => runApp(const SettingsPage());

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _phoneNumber = '1234567890'; // Replace with the actual phone number
  String _email = 'user@example.com'; // Replace with the actual email

  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  bool _isEditingPhone = false;
  bool _isEditingEmail = false;

  @override
  void initState() {
    super.initState();
    _phoneController.text = _phoneNumber;
    _emailController.text = _email;
  }

  List<Widget> getAccountSettingsActions() {
    return [
      ListTile(
        leading: Icon(Icons.phone),
        title: _isEditingPhone
            ? TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  hintText: 'Phone Number',
                ),
              )
            : Text(_phoneNumber),
        onTap: () {
          setState(() {
            _isEditingPhone = true;
          });
        },
      ),
      ListTile(
        leading: Icon(Icons.email),
        title: _isEditingEmail
            ? TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
              )
            : Text(_email),
        onTap: () {
          setState(() {
            _isEditingEmail = true;
          });
        },
      ),
      ListTile(
        leading: Icon(Icons.exit_to_app),
        title: const Text("Sign Out"),
        onTap: () {
          // Implement sign out logic
        },
      ),
    ];
  }

  List<Widget> getSecuritySettingsActions() {
    return [
      ListTile(
        leading: Icon(Icons.lock),
        title: const Text("Change Password"),
        onTap: () {
          // Implement change password logic
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final accountSettingsActions = getAccountSettingsActions();
    final securitySettingsActions = getSecuritySettingsActions();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('App Settings '),
        ),
        body: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Account Settings',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate.fixed(accountSettingsActions),
            ),
            const SliverToBoxAdapter(
              child: Divider(),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Security Settings',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate.fixed(securitySettingsActions),
            ),
          ],
        ),
      ),
    );
  }
}
