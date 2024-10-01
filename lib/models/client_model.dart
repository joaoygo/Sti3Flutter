import 'package:hive/hive.dart';

part 'client_model.g.dart';

@HiveType(typeId: 1)
class ClientModel {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? cnpj;

  @HiveField(2)
  String? cpf;

  @HiveField(3)
  String? nome;

  @HiveField(4)
  String? razaoSocial;

  @HiveField(5)
  String? email;

  @HiveField(6)
  String? dataNascimento;

  ClientModel({
    this.id,
    this.cnpj,
    this.cpf,
    this.nome,
    this.razaoSocial,
    this.email,
    this.dataNascimento,
  });

  ClientModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cnpj = json['cnpj'];
    cpf = json['cpf'];
    nome = json['nome'];
    razaoSocial = json['razaoSocial'];
    email = json['email'];
    dataNascimento = json['dataNascimento'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cnpj'] = cnpj;
    data['cpf'] = cpf;
    data['nome'] = nome;
    data['razaoSocial'] = razaoSocial;
    data['email'] = email;
    data['dataNascimento'] = dataNascimento;
    return data;
  }
}
