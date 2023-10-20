import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
            backgroundColor: Color(0xFFF9D8C5),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wrap_text),
            label: "Statements",
            backgroundColor: Color(0xFFF9D8C5),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_important_rounded),
            label: "Notifications",
            backgroundColor: Color(0xFFF9D8C5),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: "Analytics",
            backgroundColor: Color(0xFFF9D8C5),
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(
        'FishBook',
        style: TextStyle(
          color: Color(0xFFF20485A),
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Color(0xFFF9D8C5),
      centerTitle: true,
      elevation: 0.5,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(10),
          child: SvgPicture.asset('assets/icons/Vector.svg'),
          height: 28,
          width: 28,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xFFF9D8C5),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      actions: [Dashboard()],
    );
  }

  GestureDetector Dashboard() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.all(10),
        child: SvgPicture.asset('assets/icons/gg_profile.svg'),
        height: 36,
        width: 36,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xFFF9D8C5),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
