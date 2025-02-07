// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JobAdapter extends TypeAdapter<Job> {
  @override
  final int typeId = 0;

  @override
  Job read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Job(
      position: fields[0] as String,
      companyName: fields[1] as String,
      jobLocation: fields[2] as String,
      jobStatus: fields[3] as String,
      jobType: fields[4] as String,
      jobDate: fields[5] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Job obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.position)
      ..writeByte(1)
      ..write(obj.companyName)
      ..writeByte(2)
      ..write(obj.jobLocation)
      ..writeByte(3)
      ..write(obj.jobStatus)
      ..writeByte(4)
      ..write(obj.jobType)
      ..writeByte(5)
      ..write(obj.jobDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JobAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
