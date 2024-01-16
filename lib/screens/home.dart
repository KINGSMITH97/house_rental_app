import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:house_rental_app/constants/colors.dart';
import 'package:house_rental_app/screens/hompage_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List pages = [
    const HomePage(),
    ListView(),
    ListView(),
    ListView(),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors().kPrimary.withOpacity(0.25),
              offset: const Offset(0, 20),
              blurRadius: 20,
            ),
          ],
          color: AppColors().kPrimary,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            selectedItemColor: AppColors().kWhite,
            unselectedItemColor: AppColors().kWhite,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: AppColors().kPrimary,
            type: BottomNavigationBarType.fixed,
            currentIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                activeIcon: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors().kGray200.withOpacity(0.3),
                  ),
                  child: const Icon(
                    FluentIcons.home_32_filled,
                    size: 28,
                  ),
                ),
                icon: const Icon(
                  FluentIcons.home_24_regular,
                  size: 28,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                activeIcon: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors().kGray200.withOpacity(0.3),
                  ),
                  child: const Icon(
                    FluentIcons.heart_32_filled,
                    size: 28,
                  ),
                ),
                icon: const Icon(
                  FluentIcons.heart_32_regular,
                  size: 28,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                activeIcon: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors().kGray200.withOpacity(0.3),
                  ),
                  child: const Icon(
                    FluentIcons.location_28_filled,
                    size: 28,
                  ),
                ),
                icon: const Icon(
                  FluentIcons.location_28_regular,
                  size: 28,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                activeIcon: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors().kGray200.withOpacity(0.3),
                  ),
                  child: const Icon(
                    FluentIcons.person_28_filled,
                    size: 28,
                  ),
                ),
                icon: const Icon(
                  FluentIcons.person_28_regular,
                  size: 28,
                ),
                label: "Home",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
