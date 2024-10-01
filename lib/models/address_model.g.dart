// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddressModelAdapter extends TypeAdapter<AddressModel> {
  @override
  final int typeId = 2;

  @override
  AddressModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddressModel(
      id: fields[0] as String?,
      endereco: fields[1] as String?,
      numero: fields[2] as String?,
      cep: fields[3] as String?,
      bairro: fields[4] as String?,
      cidade: fields[5] as String?,
      estado: fields[6] as String?,
      complemento: fields[7] as String?,
      referencia: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AddressModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.endereco)
      ..writeByte(2)
      ..write(obj.numero)
      ..writeByte(3)
      ..write(obj.cep)
      ..writeByte(4)
      ..write(obj.bairro)
      ..writeByte(5)
      ..write(obj.cidade)
      ..writeByte(6)
      ..write(obj.estado)
      ..writeByte(7)
      ..write(obj.complemento)
      ..writeByte(8)
      ..write(obj.referencia);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
