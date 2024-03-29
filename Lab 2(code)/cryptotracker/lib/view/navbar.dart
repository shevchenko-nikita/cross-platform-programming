import 'package:flutter/material.dart';

import 'home.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;

  List<Widget> pages = [
    Home(),
    Home(),
    Home(),
  ];

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: pages.elementAt(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            onTap: ((value) {
              setState(() {
                _currentIndex = value;
              });
            }),
            items: [
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/home.png',
                    height: myHeight * 0.03,
                  ),
                  label: '',
                  activeIcon: Image.asset(
                    'assets/icons/home_selected.png',
                    height: myHeight * 0.03,
                  )),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/favorite.png',
                    height: myHeight * 0.03,
                  ),
                  label: '',
                  activeIcon: Image.asset(
                    'assets/icons/favorite_selected.png',
                    height: myHeight * 0.03,
                  )),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/profile.png',
                    height: myHeight * 0.03,
                  ),
                  label: '',
                  activeIcon: Image.asset(
                    'assets/icons/profile_selected.png',
                    height: myHeight * 0.03,
                  )),
            ]),
      ),
    );
  }
}
