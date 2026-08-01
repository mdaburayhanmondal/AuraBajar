import 'package:aurabajar/aura_widgets/aura_bottom_nav_bar.dart';
import 'package:aurabajar/aura_widgets/aura_button.dart';
import 'package:aurabajar/aura_widgets/aura_linked_text.dart';
import 'package:aurabajar/aura_widgets/aura_subtitle.dart';
import 'package:aurabajar/aura_widgets/aura_title.dart';
import 'package:aurabajar/screens/all_products_screen.dart';
import 'package:aurabajar/screens/categories_screen.dart';
import 'package:aurabajar/screens/home_screen.dart';
import 'package:aurabajar/screens/my_orders_screen.dart';
import 'package:aurabajar/screens/user_account_screen.dart';
import 'package:aurabajar/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

enum PaymentMethod { bkash, nagad, cod, card }

class _CheckoutScreenState extends State<CheckoutScreen> {
  PaymentMethod _selectedMethod = PaymentMethod.bkash;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: AuraTitle(title: "Checkout")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          spacing: 12,
          children: [
            // delivery address
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: BoxBorder.all(color: AppColors.grey.withAlpha(40)),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                spacing: 12,
                children: [
                  Align(
                    alignment: AlignmentGeometry.centerLeft,
                    child: AuraTitle(title: "Delivery Address"),
                  ),
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: AlignmentGeometry.topCenter,
                          child: Icon(Icons.location_on_outlined, size: 28),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            spacing: 4,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Abu Rayhan",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              AuraSubtitle(subtitle: "Nakhalpara"),
                              AuraSubtitle(
                                subtitle: "Mohakhali, Tejgaon, Dhaka, 1215",
                              ),
                              AuraSubtitle(subtitle: "+880 1317 546595"),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: AuraLinkedText(text: "Change"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // payment methods
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: BoxBorder.all(color: AppColors.grey.withAlpha(40)),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                spacing: 12,
                children: [
                  Align(
                    alignment: AlignmentGeometry.centerLeft,
                    child: AuraTitle(title: "Payment Method"),
                  ),
                  RadioGroup(
                    groupValue: _selectedMethod,
                    onChanged: (PaymentMethod? value) {
                      if (value != null) {
                        setState(() {
                          _selectedMethod = value;
                        });
                      }
                    },
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Radio(
                                  value: PaymentMethod.bkash,
                                  activeColor: AppColors.primary,
                                ),
                                Text(
                                  "bKash",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    "https://static.vecteezy.com/system/resources/thumbnails/068/764/270/small_2x/bkash-logo-mobile-banking-app-icon-transparent-background-free-png.png",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Radio(
                                  value: PaymentMethod.nagad,
                                  activeColor: AppColors.primary,
                                ),
                                Text(
                                  "Nagad",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    "https://freelogopng.com/images/all_img/1679248787Nagad-Logo.png",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Radio(
                                  value: PaymentMethod.cod,
                                  activeColor: AppColors.primary,
                                ),
                                Text(
                                  "Cash on Delivery",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Radio(
                                  value: PaymentMethod.card,
                                  activeColor: AppColors.primary,
                                ),
                                Text(
                                  "Visa / Master Card",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              spacing: 8,
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "https://images.seeklogo.com/logo-png/14/2/visa-logo-png_seeklogo-149697.png",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Mastercard-logo.svg/3840px-Mastercard-logo.svg.png",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
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
                spacing: 16,
                children: [
                  Align(
                    alignment: AlignmentGeometry.centerLeft,
                    child: AuraTitle(title: "Order Summary"),
                  ),
                  Column(
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
                ],
              ),
            ),
            SizedBox(height: 12),
            Column(
              spacing: 16,
              children: [
                AuraButton(onPressed: () {}, text: "Place Order"),
                Row(
                  spacing: 8,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.lock_outline, color: AppColors.grey),
                    AuraSubtitle(
                      subtitle: "Your payment information is secured.",
                    ),
                  ],
                ),
              ],
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
}
