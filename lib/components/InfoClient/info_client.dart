import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:list_order/models/order_model.dart';
import 'package:list_order/utils/app_colors.dart';

class InfoClient extends StatelessWidget {
  final OrderModel data;
  const InfoClient({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text("Dados do cliente",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor)),
          Text("Cliente: ${data.cliente?.nome}"),
          Text("Documento: ${data.cliente?.cpf}"),
          Text(
              "Data Nascimento: ${DateFormat('dd/MM/yyyy').format(DateTime.parse(data.cliente?.dataNascimento ?? ''))}"),
          Text("Email: ${data.cliente?.email}"),
        ]),
      ),
    );
  }
}
