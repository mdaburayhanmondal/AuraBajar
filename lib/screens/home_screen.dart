import 'package:aurabajar/theme/app_theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Aura',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              TextSpan(
                text: 'Bajar',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.secondary,
                ),
              ),
            ],
          ),
        ),
        centerTitle: false,
        actions: [
          Badge.count(
            count: 3,
            backgroundColor: AppColors.primary,
            textColor: AppColors.onPrimary,
            child: Icon(Icons.shopping_cart_outlined),
          ),
          SizedBox(width: 20),
        ],
        bottom: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 50),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: TapRegion(
              onTapOutside: (_) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: InkWell(
                    onTap: () {},
                    child: Icon(Icons.search_outlined, size: 32),
                  ),
                  hintText: "Search for products...",
                  hintStyle: TextStyle(color: Colors.grey),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: AppColors.primary),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: AppColors.secondary),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Container(decoration: BoxDecoration()),
    );
  }
}
