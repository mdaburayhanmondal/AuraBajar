import 'package:aurabajar/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AuraFeaturedProductCard extends StatefulWidget {
  const AuraFeaturedProductCard({
    super.key,
    required this.image,
    required this.name,
    required this.originalPrice,
    required this.sellPrice,
  });

  final String image, name;
  final double originalPrice, sellPrice;
  @override
  State<AuraFeaturedProductCard> createState() =>
      _AuraFeaturedProductCardState();
}

class _AuraFeaturedProductCardState extends State<AuraFeaturedProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.grey.withAlpha(10),
        border: BoxBorder.all(color: AppColors.grey.withAlpha(40)),
        borderRadius: BorderRadiusGeometry.circular(12),
      ),
      margin: EdgeInsets.all(2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 6,
        children: [
          Center(
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusGeometry.circular(12),
                image: DecorationImage(
                  image: NetworkImage(widget.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Text(
            widget.name,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "\$${widget.sellPrice}",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${widget.originalPrice.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 10,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  Text(
                    "${(((widget.originalPrice - widget.sellPrice) / widget.originalPrice) * 100).toStringAsFixed(2)}%",
                    style: TextStyle(fontSize: 10, color: AppColors.primary),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
