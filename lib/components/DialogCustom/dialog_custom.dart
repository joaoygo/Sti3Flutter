import 'package:flutter/material.dart';
import 'package:list_order/utils/app_colors.dart';

class DialogCustom extends StatelessWidget {
  final String title;
  final List<Widget>? children;
  final double? width;
  const DialogCustom({
    super.key,
    required this.title,
    this.children,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: width ?? MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(color: AppColors.primaryColor),
              child: Center(
                child: Text(title),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(3),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: children ?? [],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
