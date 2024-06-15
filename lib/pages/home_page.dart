import 'dart:core';
import 'package:app1/components/my_clothes_tile.dart';
import 'package:app1/components/my_current_location.dart';
import 'package:app1/components/my_description_box.dart';
import 'package:app1/components/my_tab_bar.dart';
import 'package:app1/models/clothes.dart';
import 'package:app1/models/shop.dart';
import 'package:app1/pages/clothes_page.dart';
import 'package:flutter/material.dart';
import 'package:app1/components/my_drawer.dart';
import 'package:app1/components/my_sliver_app_bar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  //tab contoller
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: ClothesCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // sort out and return a list of clothes item that belong to a specific
  List<Clothes> _filterMenuByCategory(
      ClothesCategory category, List<Clothes> fullMenu) {
    return fullMenu.where((clothes) => clothes.category == category).toList();
  }

  // return list clothes in given category
  List<Widget> getClothesInThisCategory(List<Clothes> fullMenu) {
    return ClothesCategory.values.map((category) {
      // get category menu
      List<Clothes> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          // get individual clothes
          final clothes = categoryMenu[index];

          // return clothes tile UI
          return ClothesTile(
            clothes: clothes,
            onTap: ()  => Navigator.push(
              context, MaterialPageRoute(
                builder: (context) => ClothesPage(clothes: clothes),
                ),
            ),
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            title: MyTabBar(tabController: _tabController),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),

                // my current location
                const MyCurrentLocation(),
                // description box
                const MyDescriptionBox(),
              ],
            ),
          ),
        ],
        body: Consumer<Shop>(
          builder: (context, shop, child) => TabBarView(
            controller: _tabController,
            children: getClothesInThisCategory(shop.clothes),
          ),
        ),
      ),
    );
  }
}
