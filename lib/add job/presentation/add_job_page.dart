// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:grinder/models/job_model.dart';
import 'package:grinder/services/crud_services.dart';

class AddJobPage extends StatelessWidget {
  const AddJobPage({super.key});

  // Function to show the AlertDialog
  void _showAddJobDialog(BuildContext context) {
    final theme = Theme.of(context);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add Job", style: theme.textTheme.titleLarge),
          content: JobForm(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 25,
          children: [
            Image.asset(
              'assets/c1.png',
              height: size.height * 0.25,
            ),
            Text(
              "Found a job of interest?",
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Add it here so you can keep track of its progress.",
            ),
            OutlinedButton(
              onPressed: () => _showAddJobDialog(context),
              child: Text(
                "Start Tracking Progress",
                style: theme.textTheme.bodyLarge?.copyWith(
                  // color: theme.colorScheme.inversePrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class JobForm extends StatefulWidget {
  const JobForm({super.key});

  @override
  JobFormState createState() => JobFormState();
}

class JobFormState extends State<JobForm> {
  final _formKey = GlobalKey<FormState>();
  String? _position, _companyName, _jobLocation, _jobStatus, _jobType;

  final List<String> _jobTypes = [
    'Full-time',
    'Part-time',
    'Contract',
    'Internship'
  ];

  final List<String> _jobStatuses = [
    'Applied',
    'Interviewing',
    'Accepted',
    'Rejected'
  ];

  @override
  Widget build(BuildContext context) {
    final jobService = CrudService();

    return Container(
      padding: const EdgeInsets.all(16),
      constraints: const BoxConstraints(maxWidth: 400),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Position'),
                onSaved: (value) => _position = value,
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Please enter a position' : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Company Name'),
                onSaved: (value) => _companyName = value,
                validator: (value) => value?.isEmpty ?? true
                    ? 'Please enter the company name'
                    : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Job Location'),
                onSaved: (value) => _jobLocation = value,
                validator: (value) => value?.isEmpty ?? true
                    ? 'Please enter the job location'
                    : null,
              ),
              DropdownButtonFormField<String>(
                value: _jobStatus,
                decoration: const InputDecoration(labelText: 'Job Status'),
                onChanged: (value) {
                  setState(() {
                    _jobStatus = value;
                  });
                },
                onSaved: (value) => _jobStatus = value,
                items: _jobStatuses.map((status) {
                  return DropdownMenuItem<String>(
                    value: status,
                    child: Text(status),
                  );
                }).toList(),
                validator: (value) =>
                    value == null ? 'Please select a job status' : null,
              ),
              DropdownButtonFormField<String>(
                value: _jobType,
                decoration: const InputDecoration(labelText: 'Job Type'),
                onChanged: (value) {
                  setState(() {
                    _jobType = value;
                  });
                },
                onSaved: (value) => _jobType = value,
                items: _jobTypes.map((type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                validator: (value) =>
                    value == null ? 'Please select a job type' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();

                    final newJob = Job(
                      position: _position ?? '',
                      companyName: _companyName ?? '',
                      jobLocation: _jobLocation ?? '',
                      jobStatus: _jobStatus ?? "",
                      jobType: _jobType ?? "",
                      jobDate: DateTime.now(), 
                      
                    );
                    await jobService.addJob(newJob);

                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content:
                              Text('Job added: $_position at $_companyName')),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
