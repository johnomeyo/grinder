import 'dart:convert';

class Job {
  final String position;
  final String companyName;
  final String jobLocation;
  final String jobStatus;
  final String jobType;

  Job({
    required this.position,
    required this.companyName,
    required this.jobLocation,
    required this.jobStatus,
    required this.jobType,
  });

  // Convert Job object to a map (for JSON storage)
  Map<String, dynamic> toMap() {
    return {
      'position': position,
      'companyName': companyName,
      'jobLocation': jobLocation,
      'jobStatus': jobStatus,
      'jobType': jobType,
    };
  }

  // Convert Job object to a JSON string
  String toJson() => json.encode(toMap());

  // Create a Job object from a map
  factory Job.fromMap(Map<String, dynamic> map) {
    return Job(
      position: map['position'],
      companyName: map['companyName'],
      jobLocation: map['jobLocation'],
      jobStatus: map['jobStatus'],
      jobType: map['jobType'],
    );
  }

  // Create a Job object from a JSON string
  factory Job.fromJson(String source) => Job.fromMap(json.decode(source));
}
