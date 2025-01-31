// import 'package:grinder/applied%20jobs/widgets/job_card.dart';

// var data = [
//   JobCard(
//     company: 'Lumis ',
//     position: 'Flutter Developer',
//     date: 'July 17, 2024',
//     location: 'Remote',
//     jobType: 'Full-time',
//     status: 'Applied',
//     onEdit: () {},
//   ),
//   JobCard(
//     position: 'Flutter Developer',
//     date: 'July 17, 2024',
//     location: 'Remote',
//     jobType: 'Full-time',
//     status: 'Interviewing',
//     onEdit: () {},
//     company: 'Google',
//   ),
//   JobCard(
//     company: 'Netflix ',
//     position: 'Flutter Developer',
//     date: 'July 17, 2024',
//     location: 'Remote',
//     jobType: 'Full-time',
//     status: 'Rejected',
//     onEdit: () {},
//   ),
//   JobCard(
//     company: 'Facebook',
//     position: 'Flutter Developer',
//     date: 'July 17, 2024',
//     location: 'Remote',
//     jobType: 'Full-time',
//     status: 'Interviewing',
//     onEdit: () {},
//   ),
// ];
import 'package:grinder/models/job_model.dart';
import 'package:grinder/services/crud_services.dart';

final jobService = CrudService();

List<Job> data = jobService.getAllJobs();

