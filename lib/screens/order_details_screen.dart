import 'package:aurabajar/aura_widgets/aura_linked_text.dart';
import 'package:aurabajar/aura_widgets/aura_subtitle.dart';
import 'package:aurabajar/aura_widgets/aura_title.dart';
import 'package:aurabajar/theme/app_theme.dart';
import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  double progress = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AuraTitle(title: "Order Details"),
        actions: [Icon(Icons.support_agent, size: 28), SizedBox(width: 20)],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: BoxBorder.all(color: AppColors.grey.withAlpha(70)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AuraSubtitle(subtitle: "Order ID"),
                              AuraTitle(title: "#DB123456"),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green.withAlpha(60),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text("Delivered"),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 114,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: LinearProgressIndicator(
                                value: progress / 100,
                                minHeight: 4,
                                backgroundColor: Colors.green.withAlpha(50),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.green.shade400,
                                ),
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            // row on stack
                            Positioned(
                              top: 22,
                              left: 0,
                              right: 0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  buildProcess(
                                    "Placed",
                                    "20th May",
                                    Icons.mail_outline,
                                  ),
                                  buildProcess(
                                    "Confirmed",
                                    "20th May",
                                    Icons.check_box_outlined,
                                  ),
                                  buildProcess(
                                    "Shipped",
                                    "21st May",
                                    Icons.local_shipping_outlined,
                                  ),
                                  buildProcess(
                                    "Delivered",
                                    "23rd May",
                                    Icons.check,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                // order items
                Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: AuraTitle(title: "Order Items"),
                ),
                SizedBox(height: 20),
                Column(
                  spacing: 12,
                  children: [
                    buildOrderItem(
                      "boAt Rockerz 450 Pro",
                      "Black",
                      "2,399",
                      1,
                      1,
                    ),
                    buildOrderItem("Realme Buds T300", "Green", "1,699", 1, 2),
                    buildOrderItem("Smart Watch", "Jet Black", "2,499", 1, 3),
                  ],
                ),
                SizedBox(height: 12),
                // price details
                Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: AuraTitle(title: "Price Details"),
                ),
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
                      Divider(color: AppColors.grey.withAlpha(40), height: 0),
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
                    ],
                  ),
                ),
                SizedBox(height: 10),
                // payment method
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: BoxBorder.all(color: AppColors.grey.withAlpha(40)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AuraTitle(title: "Payment Method"),
                      Row(
                        children: [
                          Text(
                            "bKash",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
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
                    ],
                  ),
                ),
                SizedBox(height: 10),
                // delivery address
                Container(
                  padding: EdgeInsets.all(12),
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
                            const SizedBox(width: 4),
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
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  border: BoxBorder.all(
                                    color: AppColors.primary,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: AuraLinkedText(
                                  text: "View On Map",
                                  onTap: () {},
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                // CTAs
                Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          border: BoxBorder.all(color: AppColors.primary),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 8,
                          children: [
                            Icon(
                              Icons.refresh,
                              color: AppColors.primary,
                              size: 28,
                            ),
                            Text(
                              "Reorder",
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          border: BoxBorder.all(color: AppColors.primary),
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.primary,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 8,
                          children: [
                            Icon(
                              Icons.save_alt_outlined,
                              color: AppColors.white,
                              size: 28,
                            ),
                            Text(
                              "Download Invoice",
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column buildProcess(String status, String date, IconData icon) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: status == "Delivered" ? Colors.green : AppColors.white,
            border: BoxBorder.all(color: Colors.green),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Icon(
            icon,
            color: status == "Delivered" ? AppColors.white : AppColors.grey,
          ),
        ),
        Column(
          children: [
            Text(
              status,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            Text(date, style: TextStyle(fontSize: 15, color: AppColors.grey)),
          ],
        ),
      ],
    );
  }

  Row buildOrderItem(
    String name,
    String color,
    String price,
    int qty,
    int imageNo,
  ) {
    return Row(
      spacing: 20,
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://picsum.photos/200?random=$imageNo"),
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              border: BoxBorder.fromLTRB(
                bottom: BorderSide(color: AppColors.grey.withAlpha(40)),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AuraTitle(title: name),
                    AuraSubtitle(subtitle: color),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AuraTitle(title: "৳ $price"),
                    AuraSubtitle(subtitle: "QTY: $qty"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
