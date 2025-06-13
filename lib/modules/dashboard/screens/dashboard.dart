import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_task/models/collection_model.dart';
import 'package:test_task/modules/dashboard/screens/collection.dart';
import 'package:test_task/utils/app_colors.dart';
import 'package:test_task/utils/app_text_styles.dart';

import '../../../generated/assets.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black2,
      body: Collection(),
      bottomNavigationBar: bottomNavWidget(),
    );
  }

  Widget bottomNavWidget() {
    return BottomNavigationBar(
      currentIndex: 1,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.black3,

      selectedLabelStyle: AppTextStyles.lato(style: TextStyle(fontSize: 12)),
      unselectedItemColor: AppColors.grey3,
      selectedItemColor: Colors.white,
      unselectedLabelStyle: AppTextStyles.lato(style: TextStyle(fontSize: 12)),
      items: [
        navItem(image: Assets.iconsScan, label: "Scan"),
        navItem(image: Assets.iconsCollection, label: "Collection"),
        navItem(image: Assets.iconsShop, label: "Shop"),
        navItem(image: Assets.iconsSettings, label: "Settings"),
      ],
    );
  }

  BottomNavigationBarItem navItem({
    required String image,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: ImageIcon(AssetImage(image)),
      label: label,
    );
  }
}
