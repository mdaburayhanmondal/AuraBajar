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
    );
  }
}
