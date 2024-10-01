import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_order/utils/app_colors.dart';
import 'package:list_order/utils/app_str.dart';
import 'package:list_order/views/home/home.dart';
import 'package:list_order/views/orders/orders.dart';
import 'package:list_order/views/reports/reports.dart';

class DrawerAppBar extends StatelessWidget {
  const DrawerAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
            ),
            child: Text(AppStr.menu),
          ),
          GestureDetector(
            onTap: () => Get.to(const Home()),
            child: const ListTile(
              title: Text(AppStr.home),
            ),
          ),
          GestureDetector(
            onTap: () => Get.to(const Orders()),
            child: const ListTile(
              title: Text(AppStr.pedidos),
            ),
          ),
          GestureDetector(
            onTap: () => Get.to(const Reports()),
            child: const ListTile(
              title: Text(AppStr.relatorios),
            ),
          ),
        ],
      ),
    );
  }
}
