import 'package:hive/hive.dart';

part 'job_model.g.dart'; // Ensure this file is generated using build_runner

@HiveType(typeId: 0)
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

  @HiveField(5)
  final DateTime jobDate; // Change Widget to DateTime

  Job({
    required this.position,
    required this.companyName,
    required this.jobLocation,
    required this.jobStatus,
    required this.jobType,
    required this.jobDate,
  });
}
