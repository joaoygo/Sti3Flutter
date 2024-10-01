import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:list_order/models/order_model.dart';
import 'package:list_order/utils/app_colors.dart';

class InfoOrder extends StatelessWidget {
  final OrderModel data;
  const InfoOrder({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Informações do pedido",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor)),
            Text("Numero: ${data.numero}"),
            Text(
                "Data Criação: ${DateFormat('dd/MM/yyyy').format(DateTime.parse(data.dataCriacao.toString()))}"),
            Text(
                "Data Alteração: ${DateFormat('dd/MM/yyyy').format(DateTime.parse(data.dataAlteracao.toString()))}"),
            Text("Status: ${data.status}"),
            Text("Desconto: ${data.desconto}"),
            Text("Subtotal: ${data.subTotal}"),
            Text("Total: ${data.valorTotal}"),
          ],
        ),
      ),
    );
  }
}
