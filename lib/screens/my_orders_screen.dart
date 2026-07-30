import 'package:aurabajar/aura_widgets/aura_bottom_nav_bar.dart';
import 'package:aurabajar/aura_widgets/aura_order_card.dart';
import 'package:aurabajar/theme/app_theme.dart';
import 'package:flutter/material.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            const Icon(Icons.search_outlined, size: 28),
            const SizedBox(width: 10),
            Badge.count(
              count: 3,
              backgroundColor: AppColors.primary,
              textColor: AppColors.onPrimary,
              child: const Icon(Icons.shopping_cart_outlined),
            ),
            const SizedBox(width: 20),
          ],
          bottom: TabBar(
            tabAlignment: TabAlignment.center,
            isScrollable: true,
            indicatorColor: AppColors.primary,
            labelColor: AppColors.primary,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'Processing'),
              Tab(text: 'Shipped'),
              Tab(text: 'Delivered'),
              Tab(text: 'Cancelled'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              child: SingleChildScrollView(
                child: Column(
                  spacing: 12,
                  children: [
                    //   order 1
                    AuraOrderCard(
                      order: {
                        "orderId": "#DB123456",
                        "date": DateTime(2026, 1, 1),
                        "status": "Processing",
                        "itemCount": 3,
                        "price": 4397,
                        "paymentMethod": "bKash",
                      },
                    ),
                    //   order 2
                    AuraOrderCard(
                      order: {
                        "orderId": "#DB123455",
                        "date": DateTime(2025, 5, 18),
                        "status": "Shipped",
                        "itemCount": 2,
                        "price": 2998,
                        "paymentMethod": "Nagad",
                      },
                    ),
                    //   order 3
                    AuraOrderCard(
                      order: {
                        "orderId": "#DB123454",
                        "date": DateTime(2025, 5, 15),
                        "status": "Delivered",
                        "itemCount": 4,
                        "price": 1299,
                        "paymentMethod": "bKash",
                      },
                    ),
                    //   order 4
                    AuraOrderCard(
                      order: {
                        "orderId": "#DB123453",
                        "date": DateTime(2025, 5, 10),
                        "status": "Cancelled",
                        "itemCount": 3,
                        "price": 1500,
                        "paymentMethod": "Nagad",
                      },
                    ),
                  ],
                ),
              ),
            ),
            Center(child: Text('Processing Orders')),
            Center(child: Text('Shipped Orders')),
            Center(child: Text('Delivered Orders')),
            Center(child: Text('Cancelled Orders')),
          ],
        ),
        bottomNavigationBar: const AuraBottomNavBar(current: 3),
      ),
    );
  }
}
