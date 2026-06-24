import 'package:jobportal/models/CreateJobModel.dart';

CreateJobModel dummyJobData = CreateJobModel(
  title: '',
  department: '',
  location: '',
  salary: '',
  description: '',
  jobType: 'Full Time',
  quickRecruit: false,
  selectedPlan: '',
  requirements: [],
  closingDate: null,
);

const List<String> jobTypes = ['Full Time', 'Internship', 'Freelance'];

const List<Map<String, dynamic>> premiumPlans = [
  {
    'id': 'elite',
    'title': 'Job Elite',
    'price': 199,
    'duration': '30-day listing',
    'feature': 'Featured in search',
  },
  {
    'id': 'pro',
    'title': 'Job Pro',
    'price': 299,
    'duration': '45-day listing',
    'feature': 'Top placement • Highlighted',
  },
];

const Map<String, dynamic> quickRecruitData = {
  'title': 'Quick Recruit',
  'badge': '3x Faster',
  'description': 'Hire top talent faster with AI-powered recruitment',
};

const Map<String, String> hints = {
  'jobTitle': 'e.g. Senior Software Engineer',
  'department': 'e.g. Engineering, Marketing',
  'location': 'e.g. Remote, New York, NY',
  'salary': 'e.g. \$80k - \$120k, \$25/hr, \$5k project',
  'description':
      'Describe the role, responsibilities, and what you are looking for...',
  'requirement': 'e.g. 3+ years of experience...',
};
