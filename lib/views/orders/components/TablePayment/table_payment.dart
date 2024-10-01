import 'package:flutter/material.dart';
import 'package:list_order/models/order_model.dart';
import 'package:list_order/utils/app_colors.dart';
import 'package:list_order/utils/app_str.dart';

class TablePayment extends StatelessWidget {
  final OrderModel data;

  const TablePayment({super.key, required this.data});

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
                    child: Text(
                      'Pagamento',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ))),
            TableCell(
                child: Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text(
                      'Parcela',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ))),
            TableCell(
                child: Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text(
                      'Valor',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ))),
          ],
        ),
        ...List.generate(
            data.pagamento?.length ?? 0,
            (index) => TableRow(children: [
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        data.pagamento?[index].nome.toString() ?? AppStr.empty,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  TableCell(
                      child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            data.pagamento?[index].parcela.toString() ??
                                AppStr.empty,
                            textAlign: TextAlign.center,
                          ))),
                  TableCell(
                      child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            data.pagamento?[index].valor.toString() ??
                                AppStr.empty,
                            textAlign: TextAlign.center,
                          ))),
                ])),
      ],
    );
  }
}
