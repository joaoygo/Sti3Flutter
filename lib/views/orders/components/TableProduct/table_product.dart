import 'package:flutter/material.dart';
import 'package:list_order/models/order_model.dart';
import 'package:list_order/utils/app_colors.dart';
import 'package:list_order/utils/app_str.dart';

class TableProduct extends StatelessWidget {
  final OrderModel data;

  const TableProduct({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        0: FixedColumnWidth(160),
        1: FixedColumnWidth(50),
        2: FixedColumnWidth(70),
      },
      children: [
        const TableRow(
          decoration: BoxDecoration(color: AppColors.secondaryColor),
          children: [
            TableCell(
                child: Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text('Produto',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 10)))),
            TableCell(
                child: Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text('QNTD',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        )))),
            TableCell(
                child: Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text(
                      'Valor Unit.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ))),
          ],
        ),
        ...List.generate(
            data.itens?.length ?? 0,
            (index) => TableRow(children: [
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        data.itens?[index].nome.toString() ?? AppStr.empty,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        data.itens?[index].quantidade.toString() ??
                            AppStr.empty,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        data.itens?[index].valorUnitario.toString() ??
                            AppStr.empty,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ]))
      ],
    );
  }
}
