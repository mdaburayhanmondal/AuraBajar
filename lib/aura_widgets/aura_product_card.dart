import 'dart:developer';

import 'package:aurabajar/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AuraProductCard extends StatefulWidget {
  const AuraProductCard({super.key, required this.product});
  final Map product;

  @override
  State<AuraProductCard> createState() => _AuraProductCardState();
}

class _AuraProductCardState extends State<AuraProductCard> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentGeometry.topRight,
      children: [
        Container(
          padding: EdgeInsets.all(6),
          width: double.infinity,
          decoration: BoxDecoration(
            border: BoxBorder.all(color: AppColors.grey.withAlpha(40)),
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            onTap: () {
              log("navigate to item details page");
            },
            child: Column(
              spacing: 8,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: NetworkImage(widget.product["image"]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 6,
                  children: [
                    Text(
                      widget.product['name'],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${widget.product['sellPrice']}",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "\$${widget.product["originalPrice"]}",
                          style: TextStyle(
                            fontSize: 15,
                            decoration: TextDecoration.lineThrough,
                            color: AppColors.grey,
                          ),
                        ),
                        Text(
                          "${(((widget.product["originalPrice"] - widget.product["sellPrice"]) / widget.product["originalPrice"]) * 100).toStringAsFixed(2)}%",
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 2,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.star, color: Colors.orangeAccent, size: 20),
                        Text(
                          "4.4",
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.secondary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "(200)",
                          style: TextStyle(fontSize: 16, color: AppColors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: InkWell(
            onTap: () {
              setState(() {
                isFavorite = !isFavorite;
              });
              log(isFavorite ? "added to wishlist" : "removed from wishlist");
            },
            child: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
              color: isFavorite ? AppColors.primary : AppColors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
