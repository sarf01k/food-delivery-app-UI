import 'package:delivery_app/cart_page.dart';
import 'package:delivery_app/home.dart';
import 'package:delivery_app/models.dart';
import 'package:delivery_app/orders_page.dart';
import 'package:delivery_app/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => App(),
      child: MaterialApp(
        title: 'Delivery App',
        theme: ThemeData(fontFamily: 'Poppins'),
        home: const Pages(),
      ),
    )
  );
}

class Pages extends StatefulWidget {
  const Pages({super.key});

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  int _currentIndex = 0;
  final screens = [const HomeScreen(), const Cart(), const Orders(), const Settings()];
  @override
  Widget build(BuildContext context) {
    return Consumer<App>(
      builder: (context, value, child) {
        return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        showUnselectedLabels: true,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w500
        ),
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w600
        ),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            activeIcon: Image.asset('assets/icons/home-filled.png', color: Color(0xFFAF6FE2)),
            icon: Image.asset('assets/icons/home.png')
          ),
          BottomNavigationBarItem(
            label: 'Cart',
            activeIcon: Image.asset('assets/icons/shopping-cart-filled.png', color: Color(0xFFAF6FE2)),
            icon: Image.asset('assets/icons/shopping-cart.png')
          ),
          BottomNavigationBarItem(
            label: 'Orders',
            activeIcon: Image.asset('assets/icons/task-square-filled.png', color: Color(0xFFAF6FE2)),
            icon: Image.asset('assets/icons/task-square.png')
          ),
          BottomNavigationBarItem(
            label: 'Settings',
            activeIcon: Image.asset('assets/icons/settings-filled.png', color: Color(0xFFAF6FE2)),
            icon: Image.asset('assets/icons/settings.png')
          )
        ],
      )
    );
      }
    );
  }
}