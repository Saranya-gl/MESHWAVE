import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/Crewmember_deails.dart';
import 'package:flutter_application_1/page/Owner_details.dart';
import 'package:flutter_application_1/page/workmanagement.dart';

import '../page/settings_page.dart';





class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    
    return Drawer(
      child: Material(
        color: Color.fromRGBO(50, 75, 205, 1),
        child: ListView(
          children: <Widget>[  
            
            
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Owner Details',
                    icon: Icons.people,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Crew Member Details',
                    icon: Icons.people,
                    onClicked: () => selectedItem(context, 2),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Transaction',
                    icon: Icons.payment,
                    onClicked: () => selectedItem(context, 3),
                  ),
                   const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Work Management',
                    icon: Icons.manage_accounts,
                    onClicked: () => selectedItem(context, 4),
                  ),
                  
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Payment',
                    icon: Icons.money,
                    onClicked: () => selectedItem(context, 5),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Settings',
                    icon: Icons.settings,
                    onClicked: () => selectedItem(context, 6),
                  ),
                ],
              ),
      ),
            );
      
  }

  

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => InputPage(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CrewDet(),
        ));
        break;
        case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => EditablePage(),
        ));
        break;
        case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => EditablePage(),
        ));
        break;
        case 5:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => EditablePage(),
        ));
        break;
        
        case 6:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SettingsPage(),
        ));
        break;
    }
  }
}
