import 'package:flutter/material.dart';
import 'package:jobportal/models/JobPostingModel.dart';

final List<JobPostingModel> jobPostings = [
  JobPostingModel(
    id: "1",
    title: "Senior Software Engineer",
    category: "Engineering",
    location: "San Francisco, CA / Remote",
    applicants: 24,
    status: "active",
    employmentType: "Full Time",
    postedAgo: "Posted 2 days ago",
    closingDate: "2026-02-15",
    icon: Icons.work,
  ),

  JobPostingModel(
    id: "2",
    title: "UI/UX Designer",
    category: "Design",
    location: "Remote",
    applicants: 18,
    status: "active",
    employmentType: "Freelance",
    postedAgo: "Posted 1 week ago",
    closingDate: "2026-01-25",
    icon: Icons.auto_awesome,
  ),

  JobPostingModel(
    id: "3",
    title: "Data Analyst",
    category: "Analytics",
    location: "Austin, TX",
    applicants: 31,
    status: "active",
    employmentType: "Full Time",
    postedAgo: "Posted 3 days ago",
    closingDate: "2026-02-10",
    icon: Icons.work,
  ),

  JobPostingModel(
    id: "4",
    title: "Full Stack Developer",
    category: "Engineering",
    location: "Remote",
    applicants: 42,
    status: "closed",
    employmentType: "Freelance",
    postedAgo: "Posted 2 weeks ago",
    closingDate: "2026-01-05",
    icon: Icons.auto_awesome,
  ),

  JobPostingModel(
    id: "5",
    title: "Product Manager",
    category: "Product",
    location: "Seattle, WA",
    applicants: 0,
    status: "draft",
    employmentType: "Full Time",
    postedAgo: "Posted 1 day ago",
    closingDate: "2026-02-20",
    icon: Icons.work,
  ),
];
