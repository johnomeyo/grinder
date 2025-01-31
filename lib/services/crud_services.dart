import 'package:grinder/models/job_model.dart';
import 'package:hive/hive.dart';

class CrudService {
  static const String _boxName = 'jobsBox';

  // Initialize Hive and open the box
  static Future<void> init() async {
    Hive.registerAdapter(JobAdapter());
    await Hive.openBox<Job>(_boxName);
  }

  // Add a job to Hive
  Future<void> addJob(Job job) async {
    final box = Hive.box<Job>(_boxName);
    await box.add(job);
  }

  // Get all jobs from Hive
  List<Job> getAllJobs() {
    final box = Hive.box<Job>(_boxName);
    return box.values.toList();
  }

  // Get a single job by index
  Job? getJob(int index) {
    final box = Hive.box<Job>(_boxName);
    return box.getAt(index);
  }

  // Update a job at a given index
  Future<void> updateJob(int index, Job updatedJob) async {
    final box = Hive.box<Job>(_boxName);
    await box.putAt(index, updatedJob);
  }

  // Delete a job by index
  Future<void> deleteJob(int index) async {
    final box = Hive.box<Job>(_boxName);
    await box.deleteAt(index);
  }

  // Clear all jobs
  Future<void> clearAllJobs() async {
    final box = Hive.box<Job>(_boxName);
    await box.clear();
  }
}
