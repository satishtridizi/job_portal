import '../models/job_detail_model.dart';

final jobDetail = JobDetailModel(
  title: "UI/UX Designer",
  category: "Design",
  location: "Remote",
  salary: "\$8k - \$12k project",
  applications: 18,
  closingDate: "2026-01-25",
  description:
      "We need a talented UI/UX designer for a 3-month project to redesign our mobile application.",
  requirements: [
    "3+ years of UI/UX design experience",
    "Strong portfolio showcasing mobile app designs",
    "Proficiency in Figma and design systems",
    "Understanding of user-centered design principles",
  ],
  applicants: [
    ApplicationModel(
      name: "Olivia Martinez",
      time: "5 days ago",
      status: "shortlisted",
    ),
    ApplicationModel(name: "Noah Anderson", time: "4 days ago", status: "new"),
  ],
);
