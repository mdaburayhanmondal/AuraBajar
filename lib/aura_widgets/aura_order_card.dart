import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../theme/app_theme.dart';
import 'aura_linked_text.dart';
import 'aura_subtitle.dart';
import 'aura_title.dart';

class AuraOrderCard extends StatelessWidget {
  const AuraOrderCard({super.key, required this.order});

  final Map order;

  @override
  Widget build(BuildContext context) {
    String formatDate(DateTime date) {
      String suffix(int day) {
        if (day >= 11 && day <= 13) return 'th';

        switch (day % 10) {
          case 1:
            return 'st';
          case 2:
            return 'nd';
          case 3:
            return 'rd';
          default:
            return 'th';
        }
      }

      return '${date.day}${suffix(date.day)} ${DateFormat('MMMM').format(date)} ${date.year}';
    }

    return Container(
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuraSubtitle(subtitle: "Order ID"),
                  AuraTitle(title: order["orderId"]),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: 24),
                  Text(formatDate(order['date'])),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color:
                      order["status"] == "Shipped" ||
                          order["status"] == "Delivered"
                      ? Colors.green.withAlpha(50)
                      : AppColors.primary.withAlpha(30),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  order["status"],
                  style: TextStyle(
                    color:
                        order["status"] == "Shipped" ||
                            order["status"] == "Delivered"
                        ? Colors.green
                        : AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${order["itemCount"]} items",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              AuraTitle(title: "৳${order["price"]}"),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://picsum.photos/200/200?random=1",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://picsum.photos/200/200?random=2",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://picsum.photos/200/200?random=3",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: AppColors.grey.withAlpha(30),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    "+1",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuraSubtitle(subtitle: "Payment Method"),
                  Text("bKash", style: TextStyle(fontSize: 15)),
                ],
              ),
              AuraLinkedText(text: "View Details", onTap: () {}),
            ],
          ),
        ],
      ),
    );
  }
}
