import 'package:aurabajar/aura_widgets/aura_bottom_nav_bar.dart';
import 'package:aurabajar/aura_widgets/aura_button.dart';
import 'package:aurabajar/aura_widgets/aura_subtitle.dart';
import 'package:aurabajar/aura_widgets/aura_title.dart';
import 'package:aurabajar/screens/all_products_screen.dart';
import 'package:aurabajar/screens/categories_screen.dart';
import 'package:aurabajar/screens/home_screen.dart';
import 'package:aurabajar/screens/my_orders_screen.dart';
import 'package:aurabajar/screens/user_account_screen.dart';
import 'package:aurabajar/theme/app_theme.dart';
import 'package:flutter/material.dart';

class OrderPlacedScreen extends StatefulWidget {
  const OrderPlacedScreen({super.key});

  @override
  State<OrderPlacedScreen> createState() => _OrderPlacedScreenState();
}

class _OrderPlacedScreenState extends State<OrderPlacedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green.withAlpha(30),
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      spacing: 12,
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 100,
                        ),
                        Column(
                          children: [
                            AuraTitle(title: "Order Placed"),
                            AuraTitle(title: "Successfully!"),
                          ],
                        ),
                        AuraSubtitle(
                          subtitle:
                              "Thank you for your order. We have received your order and will process it soon.",
                          alignment: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                buildSprinkle(30, 130, Colors.orange),
                buildSprinkle(60, 70, Colors.green),
                buildSprinkle(50, 180, Colors.black),
                buildSprinkle(380, 70, Colors.green),
                buildSprinkle(400, 130, Colors.orange),
                buildSprinkle(380, 180, Colors.black),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: BoxBorder.all(color: AppColors.grey.withAlpha(70)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  spacing: 12,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AuraSubtitle(subtitle: "Order ID"),
                        AuraTitle(title: "#DB123456"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AuraSubtitle(subtitle: "Order Date"),
                        AuraSubtitle(subtitle: "20 May, 2025"),
                      ],
                    ),
                    Divider(color: AppColors.grey.withAlpha(40)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Amount",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "৳ 6,357",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AuraSubtitle(subtitle: "Payment Method"),
                        Text(
                          "bKash",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AuraTitle(title: "What's Next?"),
                    Container(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        spacing: 20,
                        children: [
                          Row(
                            spacing: 12,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.mail_outline, color: AppColors.grey),
                              Text(
                                "We have sent an order confirmation \nto your email.",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            spacing: 12,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.info_outline_rounded,
                                color: AppColors.grey,
                              ),
                              Text(
                                "You can check your order status \nfrom Orders section.",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            spacing: 12,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.contact_support,
                                color: AppColors.grey,
                              ),
                              Text(
                                "Our team will contact you if needed.",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                spacing: 12,
                children: [
                  AuraButton(onPressed: () {}, text: "Continue Shopping"),
                  AuraButton(
                    onPressed: () {},
                    text: "View My Orders",
                    outlined: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AuraBottomNavBar(
        currentIndex: null,
        onTap: (index) {
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

  Positioned buildSprinkle(double left, double top, Color color) {
    return Positioned(
      left: left,
      top: top,
      child: Container(width: 8, height: 8, color: color),
    );
  }
}
