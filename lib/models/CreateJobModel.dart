class CreateJobModel {
  String title;
  String department;
  String location;
  String salary;
  String description;

  String jobType;

  DateTime? closingDate;

  bool quickRecruit;

  String selectedPlan;

  List<String> requirements;

  CreateJobModel({
    required this.title,
    required this.department,
    required this.location,
    required this.salary,
    required this.description,
    required this.jobType,
    required this.quickRecruit,
    required this.selectedPlan,
    required this.requirements,
    this.closingDate,
  });
}
