import 'package:aurabajar/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AuraNewArrivals extends StatefulWidget {
  const AuraNewArrivals({super.key, required this.product});

  final Map product;

  @override
  State<AuraNewArrivals> createState() => _AuraNewArrivalsState();
}

class _AuraNewArrivalsState extends State<AuraNewArrivals> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColors.grey.withAlpha(10),
          borderRadius: BorderRadius.circular(12),
          border: BoxBorder.all(color: AppColors.grey.withAlpha(40)),
        ),
        padding: EdgeInsetsGeometry.all(2),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                height: 120,
                width: double.infinity,
                padding: EdgeInsetsGeometry.all(2),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.product["image"]),
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 120,
                width: double.infinity,
                padding: EdgeInsetsGeometry.symmetric(horizontal: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    Text(
                      widget.product['name'],
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "\$${widget.product['sellPrice']}",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
