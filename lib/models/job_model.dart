import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart'; // Add this for unique IDs

part 'job_model.g.dart';

@HiveType(typeId: 0)
class Job extends HiveObject {
  @HiveField(0)
  final String id; // Add this field

  @HiveField(1)
  final String position;

  @HiveField(2)
  final String companyName;

  @HiveField(3)
  final String jobLocation;

  @HiveField(4)
  final String jobStatus;

  @HiveField(5)
  final String jobType;

  @HiveField(6)
  final DateTime jobDate;

  Job({
    String? id, // Allow nullable id for new jobs
    required this.position,
    required this.companyName,
    required this.jobLocation,
    required this.jobStatus,
    required this.jobType,
    required this.jobDate,
  }) : id = id ?? const Uuid().v4(); // Generate ID if not provided
}
