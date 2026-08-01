import 'package:aurabajar/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AuraBottomNavBar extends StatelessWidget {
  const AuraBottomNavBar({
    super.key,
    required this.currentIndex, // now nullable
    required this.onTap,
  });

  final int? currentIndex;
  final ValueChanged<int> onTap;

  static const _items = [
    (icon: Icons.home, label: "Home"),
    (icon: Icons.category, label: "Categories"),
    (icon: Icons.inventory, label: "All Products"),
    (icon: Icons.event_note, label: "Orders"),
    (icon: Icons.person, label: "Account"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 64,
        decoration: BoxDecoration(
          color:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor ??
              Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, -1),
            ),
          ],
        ),
        child: Row(
          children: List.generate(_items.length, (index) {
            final selected = currentIndex == index;
            final color = selected ? AppColors.primary : AppColors.black;
            final item = _items[index];

            return Expanded(
              child: InkWell(
                onTap: () => onTap(index),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(item.icon, size: 28, color: color),
                    const SizedBox(height: 2),
                    Text(
                      item.label,
                      style: TextStyle(fontSize: 12, color: color),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
