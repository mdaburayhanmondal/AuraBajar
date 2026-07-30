import 'package:aurabajar/aura_widgets/aura_bottom_nav_bar.dart';
import 'package:aurabajar/aura_widgets/aura_section_header.dart';
import 'package:aurabajar/aura_widgets/aura_title.dart';
import 'package:aurabajar/screens/my_orders_screen.dart';
import 'package:aurabajar/theme/app_theme.dart';
import 'package:flutter/material.dart';

class UserAccountScreen extends StatefulWidget {
  const UserAccountScreen({super.key});

  @override
  State<UserAccountScreen> createState() => _UserAccountScreenState();
}

class _UserAccountScreenState extends State<UserAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AuraTitle(title: "My Account"),
        actions: [
          InkWell(onTap: () {}, child: Icon(Icons.settings, size: 28)),
          SizedBox(width: 20),
        ],
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 12),
        child: Column(
          children: [
            SizedBox(height: 20),
            // section 1
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://www.rayhansenpai.dev/_next/image?url=%2Frayhan-senpai-2.jpg&w=750&q=75",
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                Column(
                  spacing: 4,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AuraTitle(title: "Md. Abu Rayhan Mondal"),
                    Text(
                      "+880 1317 546595",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "mdaburayhanmondal@gmail.com",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Icon(Icons.keyboard_arrow_right_outlined),
              ],
            ),
            Divider(height: 30, color: AppColors.grey.withAlpha(40)),
            // section 2
            Column(
              spacing: 12,
              children: [
                AuraSectionHeader(
                  sectionTitle: "My Orders",
                  linkText: "View All",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyOrdersScreen()),
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    orderStatus(Icons.note_add_outlined, "Processing"),
                    orderStatus(Icons.local_shipping_outlined, "Shipped"),
                    orderStatus(Icons.check_circle, "Delivered"),
                    orderStatus(Icons.highlight_remove_outlined, "Cancelled"),
                  ],
                ),
              ],
            ),
            Divider(height: 30, color: AppColors.grey.withAlpha(40)),
            // section 3
            Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: AuraTitle(title: "Account Settings"),
                ),
                SizedBox(height: 10),
                settingLink("Edit Profile", Icons.person),
                Divider(height: 10, color: AppColors.grey.withAlpha(40)),
                settingLink("Addresses", Icons.location_on_outlined),
                Divider(height: 10, color: AppColors.grey.withAlpha(40)),
                settingLink("Payment Methods", Icons.payment),
                Divider(height: 10, color: AppColors.grey.withAlpha(40)),
                settingLink("Change Password", Icons.lock_outline),
                Divider(height: 10, color: AppColors.grey.withAlpha(40)),
                settingLink("Help & Support", Icons.question_mark_rounded),
                Divider(height: 10, color: AppColors.grey.withAlpha(40)),
                settingLink("About Us", Icons.info_outline),
                Divider(height: 10, color: AppColors.grey.withAlpha(40)),
                settingLink("Logout", Icons.logout),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: AuraBottomNavBar(current: 4),
    );
  }

  Column orderStatus(IconData icon, String status) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            border: BoxBorder.all(color: AppColors.grey.withAlpha(40)),
            borderRadius: BorderRadiusGeometry.circular(33),
          ),
          child: Icon(icon, size: 50),
        ),
        Text(status, style: TextStyle(fontSize: 15)),
      ],
    );
  }

  InkWell settingLink(String text, IconData icon) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon),
              SizedBox(width: 20),
              Text(
                text,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Icon(Icons.keyboard_arrow_right_outlined),
        ],
      ),
    );
  }
}
