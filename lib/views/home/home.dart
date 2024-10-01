import 'package:flutter/material.dart';
import 'package:list_order/components/DrawerAppBar/drawer_app_bar.dart';
import 'package:list_order/utils/app_str.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStr.orders),
      ),
      drawer: const DrawerAppBar(),
      body: Center(child: Image.asset('assets/img/logo.jpg')),
    );
  }
}
