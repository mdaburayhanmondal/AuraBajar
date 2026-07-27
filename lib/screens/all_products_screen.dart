import 'package:aurabajar/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({super.key});

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Products"),
        actions: [
          InkWell(onTap: () {}, child: Icon(Icons.search, size: 28)),
          SizedBox(width: 10),
          InkWell(
            onTap: () {},
            child: Badge.count(
              count: 3,
              backgroundColor: AppColors.primary,
              child: Icon(Icons.shopping_cart_outlined, size: 28),
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}
