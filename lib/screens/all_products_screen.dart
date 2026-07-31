import 'package:aurabajar/aura_widgets/aura_bottom_nav_bar.dart';
import 'package:aurabajar/aura_widgets/aura_product_card.dart';
import 'package:aurabajar/aura_widgets/aura_title.dart';
import 'package:aurabajar/data/products.dart';
import 'package:aurabajar/screens/categories_screen.dart';
import 'package:aurabajar/screens/home_screen.dart';
import 'package:aurabajar/screens/my_orders_screen.dart';
import 'package:aurabajar/screens/user_account_screen.dart';
import 'package:aurabajar/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({super.key});

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  bool gridView = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: AuraTitle(title: "All Products"),
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
        bottom: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 20),
          child: Padding(
            padding: EdgeInsetsGeometry.all(4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 8,
                    children: [
                      Icon(Icons.filter_alt_outlined),
                      Text(
                        "Filter",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 8,
                    children: [
                      Text(
                        "Sort By",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        gridView = !gridView;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 8,
                      children: [
                        Icon(gridView ? Icons.grid_view : Icons.list),
                        Text(
                          gridView ? "Grid" : "List",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            mainAxisExtent: 300,
          ),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          clipBehavior: Clip.hardEdge,
          itemCount: allProducts.length,
          itemBuilder: (context, index) =>
              AuraProductCard(product: allProducts[index]),
        ),
      ),
      bottomNavigationBar: AuraBottomNavBar(
        currentIndex: 2,
        onTap: (index) {
          if (index == 2) return;
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const HomeScreen()),
              );
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => CategoriesScreen()),
              );
              break;
            case 2:
              break;
            case 3:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const MyOrdersScreen()),
              );
              break;
            case 4:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => UserAccountScreen()),
              );
              break;
          }
        },
      ),
    );
  }
}
