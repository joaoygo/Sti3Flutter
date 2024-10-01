import 'package:flutter/material.dart';
import 'package:list_order/models/order_model.dart';
import 'package:list_order/utils/app_colors.dart';

class InfoAddress extends StatelessWidget {
  final OrderModel data;
  const InfoAddress({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text("Local de Entrega",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor)),
          Text("Endereco: ${data.enderecoEntrega?.endereco}"),
          Text("Numero: ${data.enderecoEntrega?.numero}"),
          Text("CEP: ${data.enderecoEntrega?.cep}"),
          Text("Bairro: ${data.enderecoEntrega?.bairro}"),
          Text("Cidade: ${data.enderecoEntrega?.cidade}"),
          Text("Estado: ${data.enderecoEntrega?.estado}"),
          Text("Complemento: ${data.enderecoEntrega?.complemento}"),
          Text("Referência: ${data.enderecoEntrega?.referencia}"),
        ]),
      ),
    );
  }
}
