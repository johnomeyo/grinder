import 'package:hive/hive.dart';

part 'job_model.g.dart'; // This file will be generated by Hive

@HiveType(typeId: 0) // Each model needs a unique typeId
class Job extends HiveObject {
  @HiveField(0)
  final String position;

  @HiveField(1)
  final String companyName;

  @HiveField(2)
  final String jobLocation;

  @HiveField(3)
  final String jobStatus;

  @HiveField(4)
  final String jobType;

  Job({
    required this.position,
    required this.companyName,
    required this.jobLocation,
    required this.jobStatus,
    required this.jobType,
  });
}
