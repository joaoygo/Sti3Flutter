import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:list_order/components/DialogCustom/dialog_custom.dart';
import 'package:list_order/components/InfoAddress/info_address.dart';
import 'package:list_order/components/InfoClient/info_client.dart';
import 'package:list_order/components/InfoOrder/info_order.dart';
import 'package:list_order/controllers/order_controller.dart';
import 'package:list_order/models/order_model.dart';
import 'package:list_order/utils/app_colors.dart';
import 'package:list_order/utils/app_str.dart';
import 'package:list_order/utils/capitalize.dart';
import 'package:list_order/views/orders/components/TablePayment/table_payment.dart';
import 'package:list_order/views/orders/components/TableProduct/table_product.dart';

class TableCustom extends StatelessWidget {
  final Map<int, TableColumnWidth>? columnWidths;
  final List<String> titlesColumns;
  final OrderController data;

  const TableCustom({
    super.key,
    this.columnWidths,
    required this.titlesColumns,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Table(
        border: TableBorder.symmetric(
          inside: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        defaultColumnWidth: const FlexColumnWidth(1.0),
        columnWidths: columnWidths,
        children: [
          TableRow(
            decoration: const BoxDecoration(color: AppColors.secondaryColor),
            children: titlesColumns.map((title) {
              return TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              );
            }).toList(),
          ),
          ...List.generate(
              data.dataList.length,
              (index) => TableRow(
                      decoration: BoxDecoration(
                          color: index % 2 == 0
                              ? Colors.white
                              : Colors.grey.shade200),
                      children: [
                        TableCell(
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                    onTap: () {
                                      onTapDialog(
                                          context, data.dataList[index]);
                                    },
                                    onDoubleTap: () {
                                      onDoubleTapDialog(
                                          context, data.dataList[index]);
                                    },
                                    child: Text(
                                        data.dataList[index].numero.toString(),
                                        textAlign: TextAlign.center)))),
                        TableCell(
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    onTapDialog(context, data.dataList[index]);
                                  },
                                  onDoubleTap: () {
                                    onDoubleTapDialog(
                                        context, data.dataList[index]);
                                  },
                                  child: Text(
                                    DateFormat('dd/MM/yyyy').format(
                                        data.dataList[index].dataCriacao ??
                                            DateTime.now()),
                                    textAlign: TextAlign.center,
                                  ),
                                ))),
                        TableCell(
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    onTapDialog(context, data.dataList[index]);
                                  },
                                  onDoubleTap: () {
                                    onDoubleTapDialog(
                                        context, data.dataList[index]);
                                  },
                                  child: Text(
                                    data.dataList[index].cliente?.nome
                                            ?.split(' ')
                                            .first
                                            .toString() ??
                                        AppStr.empty,
                                    textAlign: TextAlign.center,
                                  ),
                                ))),
                        TableCell(
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    onTapDialog(context, data.dataList[index]);
                                  },
                                  onDoubleTap: () {
                                    onDoubleTapDialog(
                                        context, data.dataList[index]);
                                  },
                                  child: Text(
                                    capitalize(
                                        data.dataList[index].status.toString()),
                                    textAlign: TextAlign.center,
                                  ),
                                ))),
                        TableCell(
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    onTapDialog(context, data.dataList[index]);
                                  },
                                  onDoubleTap: () {
                                    onDoubleTapDialog(
                                        context, data.dataList[index]);
                                  },
                                  child: Text(
                                    data.dataList[index].valorTotal.toString(),
                                    textAlign: TextAlign.center,
                                  ),
                                )))
                      ]))
        ]);
  }

  void onDoubleTapDialog(BuildContext context, OrderModel data) {
    showDialog(
        context: context,
        builder: (context) =>
            DialogCustom(title: AppStr.paymentsDetails, children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                child: TableProduct(data: data),
              ),
              TablePayment(data: data),
            ]));
  }

  void onTapDialog(BuildContext context, OrderModel data) {
    showDialog(
        context: context,
        builder: (context) => DialogCustom(
              title: AppStr.orderDetails,
              children: [
                InfoOrder(data: data),
                InfoClient(data: data),
                InfoAddress(data: data),
              ],
            ));
  }
}
