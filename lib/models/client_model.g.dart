// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ClientModelAdapter extends TypeAdapter<ClientModel> {
  @override
  final int typeId = 1;

  @override
  ClientModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ClientModel(
      id: fields[0] as String?,
      cnpj: fields[1] as String?,
      cpf: fields[2] as String?,
      nome: fields[3] as String?,
      razaoSocial: fields[4] as String?,
      email: fields[5] as String?,
      dataNascimento: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ClientModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.cnpj)
      ..writeByte(2)
      ..write(obj.cpf)
      ..writeByte(3)
      ..write(obj.nome)
      ..writeByte(4)
      ..write(obj.razaoSocial)
      ..writeByte(5)
      ..write(obj.email)
      ..writeByte(6)
      ..write(obj.dataNascimento);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClientModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
