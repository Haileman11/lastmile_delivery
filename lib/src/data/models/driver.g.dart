// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DriverModelAdapter extends TypeAdapter<DriverModel> {
  @override
  final int typeId = 0;

  @override
  DriverModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DriverModel(
      id: fields[0] as String,
      name: fields[1] as String,
      phoneNumber: fields[2] as String,
      isAvailable: fields[3] as bool,
      status: fields[4] as String,
      email: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DriverModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.phoneNumber)
      ..writeByte(3)
      ..write(obj.isAvailable)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.email);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DriverModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
