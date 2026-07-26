import 'package:aurabajar/aura_widgets/aura_button.dart';
import 'package:aurabajar/aura_widgets/aura_new_arrivals.dart';
import 'package:aurabajar/aura_widgets/aura_section_header.dart';
import 'package:aurabajar/aura_widgets/aura_subtitle.dart';
import 'package:aurabajar/aura_widgets/featured_product_card.dart';
import 'package:aurabajar/data/banners.dart';
import 'package:aurabajar/data/categories.dart';
import 'package:aurabajar/data/products.dart';
import 'package:aurabajar/theme/app_theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int categoryCount = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Aura',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              TextSpan(
                text: 'Bajar',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.secondary,
                ),
              ),
            ],
          ),
        ),
        centerTitle: false,
        actions: [
          Badge.count(
            count: 3,
            backgroundColor: AppColors.primary,
            textColor: AppColors.onPrimary,
            child: Icon(Icons.shopping_cart_outlined),
          ),
          SizedBox(width: 20),
        ],
        bottom: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 50),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: TapRegion(
              onTapOutside: (_) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: InkWell(
                    onTap: () {},
                    child: Icon(Icons.search_outlined, size: 32),
                  ),
                  hintText: "Search for products...",
                  hintStyle: TextStyle(color: Colors.grey),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: AppColors.primary),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: AppColors.secondary),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          children: [
            SizedBox(height: 4),
            // banner carousel
            CarouselSlider(
              items: banners
                  .map(
                    (banner) => Stack(
                      alignment: AlignmentGeometry.bottomLeft,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(banner),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadiusGeometry.circular(12),
                          ),
                        ),
                        Positioned(
                          left: 10,
                          bottom: 10,
                          child: AuraButton(
                            onPressed: () {},
                            text: "Shop Now",
                            width: 140,
                            height: 40,
                            outlined: true,
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                height: 150,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 5),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              ),
            ),
            SizedBox(height: 10),
            // categories section
            Column(
              children: [
                AuraSectionHeader(
                  sectionTitle: "Categories",
                  linkText: "View All",
                  onTap: () {},
                ),
                SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categoryCount + 1,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 70,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: index == categoryCount
                              ? InkWell(
                                  splashColor: Colors.transparent,
                                  onTap: () {},
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    spacing: 10,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: AppColors.grey
                                            .withAlpha(50),
                                        radius: 28,
                                        child: Icon(
                                          Icons.more_horiz_rounded,
                                          size: 30,
                                        ),
                                      ),
                                      AuraSubtitle(subtitle: "More"),
                                    ],
                                  ),
                                )
                              : InkWell(
                                  splashColor: Colors.transparent,
                                  onTap: () {},
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    spacing: 10,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: AppColors.grey,
                                        backgroundImage: NetworkImage(
                                          homeCategories[index]["image"]!,
                                        ),
                                        radius: 28,
                                      ),
                                      AuraSubtitle(
                                        subtitle:
                                            homeCategories[index]['name']!,
                                        maxLines: 1,
                                        textOverflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            // featured products
            Column(
              spacing: 4,
              children: [
                AuraSectionHeader(
                  sectionTitle: "Featured Products",
                  linkText: "View All",
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  child: Center(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: featuredProducts.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {},
                        child: FeaturedProductCard(
                          image: featuredProducts[index]['image'],
                          name: featuredProducts[index]['name'],
                          originalPrice:
                              featuredProducts[index]['originalPrice'],
                          sellPrice: featuredProducts[index]['sellPrice'],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            // new arrivals
            Column(
              children: [
                AuraSectionHeader(
                  sectionTitle: "New Arrivals",
                  linkText: "View All",
                  onTap: () {},
                ),
                SizedBox(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 105,
                      crossAxisCount: 1,
                    ),
                    itemCount: newArrivals.length,
                    itemBuilder: (context, index) => Center(
                      child: AuraNewArrivals(product: newArrivals[index]),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
