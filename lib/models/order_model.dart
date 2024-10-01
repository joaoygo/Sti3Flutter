import 'package:list_order/models/client_model.dart';
import 'package:list_order/models/address_model.dart';
import 'package:list_order/models/itens_model.dart';
import 'package:list_order/models/payment_model.dart';

import 'package:hive/hive.dart';

part 'order_model.g.dart';

@HiveType(typeId: 0)
class OrderModel {
  @HiveField(0)
  String? id;

  @HiveField(1)
  int? numero;

  @HiveField(2)
  DateTime? dataCriacao;

  @HiveField(3)
  String? dataAlteracao;

  @HiveField(4)
  String? status;

  @HiveField(5)
  int? desconto;

  @HiveField(6)
  int? frete;

  @HiveField(7)
  double? subTotal;

  @HiveField(8)
  double? valorTotal;

  @HiveField(9)
  ClientModel? cliente;

  @HiveField(10)
  AddressModel? enderecoEntrega;

  @HiveField(11)
  List<ItensModel>? itens;

  @HiveField(12)
  List<PaymentModel>? pagamento;

  OrderModel({
    this.id,
    this.numero,
    this.dataCriacao,
    this.dataAlteracao,
    this.status,
    this.desconto,
    this.frete,
    this.subTotal,
    this.valorTotal,
    this.cliente,
    this.enderecoEntrega,
    this.itens,
    this.pagamento,
  });

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    numero = (json['numero'] as num?)?.toInt();
    dataCriacao = json['dataCriacao'] != null
        ? DateTime.parse(json['dataCriacao'])
        : null;
    dataAlteracao = json['dataAlteracao'];
    status = json['status'];
    desconto = (json['desconto'] as num?)?.toInt();
    frete = (json['frete'] as num?)?.toInt();
    subTotal = (json['subTotal'] as num?)?.toDouble();
    valorTotal = (json['valorTotal'] as num?)?.toDouble();
    cliente =
        json['cliente'] != null ? ClientModel.fromJson(json['cliente']) : null;
    enderecoEntrega = json['enderecoEntrega'] != null
        ? AddressModel.fromJson(json['enderecoEntrega'])
        : null;

    if (json['itens'] != null) {
      itens = <ItensModel>[];
      json['itens'].forEach((v) {
        itens!.add(ItensModel.fromJson(v));
      });
    }

    if (json['pagamento'] != null) {
      pagamento = <PaymentModel>[];
      json['pagamento'].forEach((v) {
        pagamento!.add(PaymentModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['numero'] = numero;
    data['dataCriacao'] = dataCriacao?.toIso8601String();
    data['dataAlteracao'] = dataAlteracao;
    data['status'] = status;
    data['desconto'] = desconto;
    data['frete'] = frete;
    data['subTotal'] = subTotal;
    data['valorTotal'] = valorTotal;

    if (cliente != null) {
      data['cliente'] = cliente!.toJson();
    }
    if (enderecoEntrega != null) {
      data['enderecoEntrega'] = enderecoEntrega!.toJson();
    }
    if (itens != null) {
      data['itens'] = itens!.map((v) => v.toJson()).toList();
    }
    if (pagamento != null) {
      data['pagamento'] = pagamento!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
