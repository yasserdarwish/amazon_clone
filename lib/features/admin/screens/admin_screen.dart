import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/admin/screens/posts_screen.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _currentPage = 0;
  final double containerWidth = 42;
  final double containerBorderWidth = 5;

  List<Widget> pages = [
    const PostsScreen(),
    const Center(child: Text('Analytics page')),
    const Center(child: Text('Cart page')),
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
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            flexibleSpace: Container(
              decoration:
                  const BoxDecoration(gradient: GlobalVariables.appBarGradient),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/amazon_in.png',
                  height: 45,
                  width: 120,
                  color: Colors.black,
                ),
                const Text(
                  'Admin',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                )
              ],
            ),
          )),
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
                child: const Icon(Icons.analytics_outlined),
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
                child: const Icon(Icons.all_inbox_outlined),
              ),
              label: '',
            ),
          ]),
    );
  }
}
