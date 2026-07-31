import 'package:aurabajar/aura_widgets/aura_bottom_nav_bar.dart';
import 'package:aurabajar/aura_widgets/aura_button.dart';
import 'package:aurabajar/aura_widgets/aura_title.dart';
import 'package:aurabajar/screens/all_products_screen.dart';
import 'package:aurabajar/screens/categories_screen.dart';
import 'package:aurabajar/screens/home_screen.dart';
import 'package:aurabajar/screens/my_orders_screen.dart';
import 'package:aurabajar/screens/user_account_screen.dart';
import 'package:aurabajar/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double progress = 70.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AuraTitle(title: "My Account"),
        actions: [
          Icon(Icons.favorite_border),
          SizedBox(width: 20),
          Badge.count(
            count: 3,
            backgroundColor: AppColors.primary,
            textColor: AppColors.onPrimary,
            child: Icon(Icons.shopping_cart_outlined),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            spacing: 12,
            children: [
              // free shipping
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.withAlpha(20),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  spacing: 20,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.done),
                            SizedBox(width: 8),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "You are ",
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "৳ 603",
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: " away from free shipping!",
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Icon(Icons.local_shipping_outlined),
                      ],
                    ),
                    LinearProgressIndicator(
                      value: progress / 100,
                      minHeight: 8,
                      backgroundColor: Colors.green.shade100,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Colors.green,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ],
                ),
              ),
              // items
              Column(
                spacing: 12,
                children: [
                  cartItem("boAt Rockerz 450 Pro", "2,399", "1"),
                  cartItem("Realme Buds T300", "1,699", "2"),
                  cartItem("Smart Watch", "2,499", "3"),
                ],
              ),
              // coupon
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: BoxBorder.all(color: AppColors.grey.withAlpha(40)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      spacing: 12,
                      children: [
                        Icon(Icons.discount),
                        Text(
                          "Have a coupon code?",
                          style: TextStyle(fontSize: 15, color: AppColors.grey),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Apply",
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // calculation
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: BoxBorder.all(color: AppColors.grey.withAlpha(40)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  spacing: 12,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Subtotals (3 items)",
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColors.black,
                          ),
                        ),
                        Text(
                          "৳ 6,597",
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Shipping Charge",
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColors.black,
                          ),
                        ),
                        Text(
                          "৳ 60",
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Discount",
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColors.black,
                          ),
                        ),
                        Text(
                          "- ৳ 300",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // checkout button
              AuraButton(onPressed: () {}, text: "Proceed To Checkout"),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AuraBottomNavBar(
        currentIndex: 4,
        onTap: (index) {
          if (index == 4) return;
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
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const AllProductsScreen()),
              );
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

  Container cartItem(String name, String price, String imageNo) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: BoxBorder.all(color: AppColors.grey.withAlpha(40)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        spacing: 20,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://picsum.photos/200?random=$imageNo",
                ),
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                AuraTitle(title: name),
                AuraTitle(title: "৳ $price"),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsetsGeometry.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            border: BoxBorder.all(
                              color: AppColors.grey.withAlpha(40),
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "-",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsetsGeometry.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            border: BoxBorder.symmetric(
                              horizontal: BorderSide(
                                color: AppColors.grey.withAlpha(40),
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "1",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsetsGeometry.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            border: BoxBorder.all(
                              color: AppColors.grey.withAlpha(40),
                            ),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "+",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 32),
                    Icon(Icons.delete, color: AppColors.grey, size: 28),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
