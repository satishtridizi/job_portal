import '../models/support_model.dart';

const quickContact = QuickContact(
  email: "support@jobportal.com",
  phone: "+1 (555) 123-4567",
  responseTime: "Within 24 hours",
);

const List<CommonIssue> commonIssues = [
  CommonIssue(title: "Can't access my account"),
  CommonIssue(title: "Job posting not appearing"),
  CommonIssue(title: "Issues with payments"),
  CommonIssue(title: "Application notifications not working"),
];

const List<String> categories = [
  "Account",
  "Payments",
  "Jobs",
  "Notifications",
  "Other",
];
