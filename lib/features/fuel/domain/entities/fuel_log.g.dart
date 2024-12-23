// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fuel_log.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FuelLogAdapter extends TypeAdapter<FuelLog> {
  @override
  final int typeId = 0;

  @override
  FuelLog read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FuelLog(
      date: fields[0] as DateTime,
      amount: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, FuelLog obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.amount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FuelLogAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
