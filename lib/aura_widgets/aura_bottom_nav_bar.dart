import 'package:aurabajar/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AuraBottomNavBar extends StatefulWidget {
  const AuraBottomNavBar({super.key});

  @override
  State<AuraBottomNavBar> createState() => _AuraBottomNavBarState();
}

class _AuraBottomNavBarState extends State<AuraBottomNavBar> {
  int selected = 0;

  void setSelected(int idx) {
    setState(() {
      selected = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: selected,
      onTap: setSelected,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.black,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 28),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.category, size: 28),
          label: "Categories",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search, size: 28),
          label: "Search",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.event_note, size: 28),
          label: "Orders",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, size: 28),
          label: "Account",
        ),
      ],
    );
  }
}
