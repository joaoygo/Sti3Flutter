import 'package:hive/hive.dart';

part 'itens_model.g.dart';

@HiveType(typeId: 3)
class ItensModel {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? idProduto;

  @HiveField(2)
  String? nome;

  @HiveField(3)
  int? quantidade;

  @HiveField(4)
  double? valorUnitario;

  ItensModel({
    this.id,
    this.idProduto,
    this.nome,
    this.quantidade,
    this.valorUnitario,
  });

  ItensModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idProduto = json['idProduto'];
    nome = json['nome'];
    quantidade = json['quantidade'];
    valorUnitario = (json['valorUnitario'] as num?)?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['idProduto'] = idProduto;
    data['nome'] = nome;
    data['quantidade'] = quantidade;
    data['valorUnitario'] = valorUnitario;
    return data;
  }
}
