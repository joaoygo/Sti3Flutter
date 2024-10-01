import 'package:hive/hive.dart';

part 'payment_model.g.dart';

@HiveType(typeId: 4)
class PaymentModel {
  @HiveField(0)
  String? id;

  @HiveField(1)
  int? parcela;

  @HiveField(2)
  double? valor;

  @HiveField(3)
  String? codigo;

  @HiveField(4)
  String? nome;

  PaymentModel({
    this.id,
    this.parcela,
    this.valor,
    this.codigo,
    this.nome,
  });

  PaymentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parcela = json['parcela'];
    valor = (json['valor'] as num?)?.toDouble();
    codigo = json['codigo'];
    nome = json['nome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['parcela'] = parcela;
    data['valor'] = valor;
    data['codigo'] = codigo;
    data['nome'] = nome;
    return data;
  }
}
