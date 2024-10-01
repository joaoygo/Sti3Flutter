// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itens_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItensModelAdapter extends TypeAdapter<ItensModel> {
  @override
  final int typeId = 3;

  @override
  ItensModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItensModel(
      id: fields[0] as String?,
      idProduto: fields[1] as String?,
      nome: fields[2] as String?,
      quantidade: fields[3] as int?,
      valorUnitario: fields[4] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, ItensModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.idProduto)
      ..writeByte(2)
      ..write(obj.nome)
      ..writeByte(3)
      ..write(obj.quantidade)
      ..writeByte(4)
      ..write(obj.valorUnitario);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItensModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
