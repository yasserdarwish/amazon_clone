import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/account/screens/account_screen.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentPage = 0;
  final double containerWidth = 42;
  final double containerBorderWidth = 5;

  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const Center(
      child: Text('Cart page'),
    ),
  ];

  void updatePage(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: GlobalVariables.selectedNavBarColor,
          unselectedItemColor: GlobalVariables.unselectedNavBarColor,
          iconSize: 28,
          currentIndex: _currentPage,
          onTap: updatePage,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                width: containerWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: _currentPage == 0
                          ? GlobalVariables.selectedNavBarColor
                          : GlobalVariables.backgroundColor,
                      width: containerBorderWidth,
                    ),
                  ),
                ),
                child: const Icon(Icons.home_outlined),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: containerWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: _currentPage == 1
                          ? GlobalVariables.selectedNavBarColor
                          : GlobalVariables.backgroundColor,
                      width: containerBorderWidth,
                    ),
                  ),
                ),
                child: const Icon(Icons.person_outline_outlined),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: containerWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: _currentPage == 2
                          ? GlobalVariables.selectedNavBarColor
                          : GlobalVariables.backgroundColor,
                      width: containerBorderWidth,
                    ),
                  ),
                ),
                child: badges.Badge(
                    position: badges.BadgePosition.topEnd(end: -10),
                    badgeContent: const Text('2'),
                    badgeStyle:
                        const badges.BadgeStyle(badgeColor: Colors.white),
                    child: const Center(
                        child: Icon(Icons.shopping_cart_outlined))),
              ),
              label: '',
            ),
          ]),
    );
  }
}
