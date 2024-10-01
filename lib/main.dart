import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:list_order/theme/themes.dart';
import 'package:list_order/utils/hive_initialize.dart';
import 'package:list_order/views/home/home.dart';

void main() async {
  await Hive.initFlutter();
  await HiveInitializer.registerAdapters();
  await HiveInitializer.initHive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const Home(),
      debugShowCheckedModeBanner: false,
      theme: Themes().theme,
    );
  }
}
