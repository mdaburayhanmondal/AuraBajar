import 'package:aurabajar/aura_widgets/aura_section_header.dart';
import 'package:aurabajar/aura_widgets/aura_subtitle.dart';
import 'package:aurabajar/data/categories.dart';
import 'package:aurabajar/theme/app_theme.dart';
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
            // categories section
            Column(
              children: [
                AuraSectionHeader(
                  sectionTitle: "Categories",
                  linkText: "View All",
                  onTap: () {},
                ),
                SizedBox(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categoryCount + 1,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 70,
                        child: Padding(
                          padding: const EdgeInsets.all(6),
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
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                      subtitle: homeCategories[index]['name']!,
                                      maxLines: 1,
                                      textOverflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                        ),
                      );
                    },
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
