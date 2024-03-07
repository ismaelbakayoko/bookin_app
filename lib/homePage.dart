import 'package:flutter/material.dart';
import 'package:ismo_travel_app/AjouterLieuPage.dart';
import 'package:ismo_travel_app/CustomizeLieuPage.dart';
import 'package:ismo_travel_app/ListeLieuxPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu),
          actions: [
            Icon(Icons.notification_add),
            Icon(Icons.search),
          ],
          title: Text('Acceuil'),
          centerTitle: true,
        ),
        body: const [
          ListeLieuPage(),
          AjouterLieuPage(),
          CustomizeLieuPage(),
        ][_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.pink,
            unselectedItemColor: Colors.grey,
            currentIndex: _selectedIndex,
            onTap: (value) => setState(() {
                  _selectedIndex = value;
                }),
            iconSize: 40,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.public_outlined), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.control_point_outlined), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu_outlined,
                  ),
                  label: ""),
            ]));
  }
}
