import 'package:fashion/screens/bottomnavbar/homepage.dart';
import 'package:fashion/screens/bottomnavbar/profile.dart';
import 'package:fashion/screens/bottomnavbar/shoppingcart.dart';
import 'package:flutter/material.dart';



class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

int current = 0;

List screens = [HomePage(), ShoppingCart(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: 'Basket'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile'
          ),
        ],
        currentIndex: current,
        onTap: (index) {
          setState(() {
            current = index;
          });
        },
      ),
      body: screens[current],
    );
  }
}