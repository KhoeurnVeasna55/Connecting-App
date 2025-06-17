import 'package:connecting_app/l10n/app_localizations.dart';
import 'package:connecting_app/screen/call_screen.dart';
import 'package:connecting_app/screen/home_screen.dart';
import 'package:connecting_app/screen/profile_screen.dart';
import 'package:connecting_app/screen/schedule_screen.dart';
import 'package:connecting_app/screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations tran = AppLocalizations.of(context)!;

    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [HomeScreen(), const ScheduleScreen(),SearchScreen(),CallScreen(),ProfileScreen()],
      ),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            backgroundColor: context.theme.scaffoldBackgroundColor,
            selectedItemColor: Color(0xFF22B2E2),
            unselectedItemColor: Colors.grey,
            currentIndex: currentIndex,
            elevation: 10,
            type: BottomNavigationBarType.fixed,
            onTap: onTabTapped,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home_outlined),
                activeIcon: const Icon(Icons.home_outlined, size: 30),
                label: tran.home,
              ),
               BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today),
                activeIcon: Icon(Icons.calendar_today, size: 30),
                label: tran.schedule,
              ),
              BottomNavigationBarItem(
                icon: ClipOval(
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Color(0xFF22B2E2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.search_outlined,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ),
                label: '',
              ),
               BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_border,size: 30,),
                activeIcon: Icon(Icons.bookmark, size: 40),
                label: tran.keep,
              ),
               BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: tran.profile,
                activeIcon: Icon(Icons.person, size: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
