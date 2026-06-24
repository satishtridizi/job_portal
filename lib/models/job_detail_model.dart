class JobDetailModel {
  final String title;
  final String category;
  final String location;
  final String salary;
  final int applications;
  final String closingDate;
  final String description;
  final List<String> requirements;
  final List<ApplicationModel> applicants;

  JobDetailModel({
    required this.title,
    required this.category,
    required this.location,
    required this.salary,
    required this.applications,
    required this.closingDate,
    required this.description,
    required this.requirements,
    required this.applicants,
  });
}

class ApplicationModel {
  final String name;
  final String time;
  final String status;

  ApplicationModel({
    required this.name,
    required this.time,
    required this.status,
  });
}
