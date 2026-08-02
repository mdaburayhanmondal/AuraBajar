import 'package:aurabajar/aura_widgets/aura_button.dart';
import 'package:aurabajar/aura_widgets/aura_subtitle.dart';
import 'package:aurabajar/aura_widgets/aura_title.dart';
import 'package:aurabajar/data/banners.dart';
import 'package:aurabajar/theme/app_theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.product});
  final Map product;
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {},
            child: Badge.count(
              count: 3,
              backgroundColor: AppColors.primary,
              child: Icon(Icons.shopping_cart_outlined, size: 28),
            ),
          ),
          SizedBox(width: 20),
        ],
        forceMaterialTransparency: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  CarouselSlider(
                    items: banners
                        .map(
                          (banner) => Stack(
                            alignment: AlignmentGeometry.topLeft,
                            children: [
                              Container(
                                width: 300,
                                height: 300,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      widget.product['image'],
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadiusGeometry.circular(
                                    12,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 8,
                                left: 8,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    "-${(((widget.product["originalPrice"] - widget.product["sellPrice"]) / widget.product["originalPrice"]) * 100).toStringAsFixed(0)}%",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                    options: CarouselOptions(
                      height: 320,
                      aspectRatio: 1 / 1,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      // autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ],
              ),
              Column(
                spacing: 4,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AuraTitle(title: widget.product["name"]),
                      Row(children: [Icon(Icons.share), SizedBox(width: 20)]),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "\$${widget.product['sellPrice']}",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "\$${widget.product["originalPrice"]}",
                        style: TextStyle(
                          fontSize: 15,
                          decoration: TextDecoration.lineThrough,
                          color: AppColors.grey,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "${(((widget.product["originalPrice"] - widget.product["sellPrice"]) / widget.product["originalPrice"]) * 100).toStringAsFixed(2)}%",
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(),
              Column(
                spacing: 4,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Icon((Icons.headphones)),
                            SizedBox(width: 8),
                            Text(
                              "Super Extra Bass",
                              style: TextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Icon((Icons.timelapse)),
                            SizedBox(width: 8),
                            Text(
                              "Up to 15H Playback",
                              style: TextStyle(fontSize: 13),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Icon((Icons.headphones_outlined)),
                            SizedBox(width: 8),
                            Text(
                              "Soft Padded Ear Cushions",
                              style: TextStyle(fontSize: 13),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Icon((Icons.shield_moon_rounded)),
                            SizedBox(width: 8),
                            Text(
                              "1 Year Warranty",
                              style: TextStyle(fontSize: 13),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(),
              Column(
                spacing: 4,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuraTitle(title: "Description"),
                  AuraSubtitle(
                    subtitle:
                        "Enjoy powerful sound and deep bass with boAt Rockerz 450 Pro. Designed for comfort and long-lasting performance. Perfect for music lovers on the go.",
                  ),
                  Column(
                    spacing: 4,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Brand",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Text(":"),
                                SizedBox(width: 10),
                                Text("boAt"),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Model",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Text(":"),
                                SizedBox(width: 10),
                                Text("Rockerz 450 Pro"),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Battery Life",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Text(":"),
                                SizedBox(width: 10),
                                Text("Up to 15 hours"),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Connectivity",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Text(":"),
                                SizedBox(width: 10),
                                Text("Bluetooth 5.0"),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Warranty",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Text(":"),
                                SizedBox(width: 10),
                                Text("1 Year"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                spacing: 10,
                children: [
                  Expanded(
                    flex: 1,
                    child: AuraButton(
                      onPressed: () {},
                      text: "Add Order",
                      outlined: true,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: AuraButton(onPressed: () {}, text: "Buy Now"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
