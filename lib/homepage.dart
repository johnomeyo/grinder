import 'package:flutter/material.dart';
import 'package:grinder/applied_jobs_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
    // final size  = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AppliedJobsPage()));
              },
              icon: Icon(Icons.arrow_forward_ios))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 25,
          children: [
            // Image.asset('assets/congrats.png', height: size.height* 0.4,),
            Icon(
              Icons.sentiment_satisfied,
              size: 200,
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
            FilledButton.tonal(
              onPressed: () => _showAddJobDialog(context),
              child: Text(
                "Start Tracking Progress",
                style: theme.textTheme.bodyLarge?.copyWith(
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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16), // Added padding for more space
      constraints: BoxConstraints(
          maxWidth: 400), // Optional: Restrict form width for better layout
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Position'),
                onSaved: (value) => _position = value,
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Please enter a position' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Company Name'),
                onSaved: (value) => _companyName = value,
                validator: (value) => value?.isEmpty ?? true
                    ? 'Please enter the company name'
                    : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Job Location'),
                onSaved: (value) => _jobLocation = value,
                validator: (value) => value?.isEmpty ?? true
                    ? 'Please enter the job location'
                    : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Job Status'),
                onSaved: (value) => _jobStatus = value,
                validator: (value) => value?.isEmpty ?? true
                    ? 'Please enter the job status'
                    : null,
              ),
              DropdownButtonFormField<String>(
                value: _jobType,
                decoration: InputDecoration(labelText: 'Job Type'),
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
              FilledButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    // Handle form submission logic here
                    Navigator.of(context).pop(); // Close the dialog
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content:
                              Text('Job added: $_position at $_companyName')),
                    );
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
