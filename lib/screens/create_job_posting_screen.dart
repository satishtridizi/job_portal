import 'package:flutter/material.dart';
import 'package:jobportal/widgets/ai_creation_card.dart';
import 'package:jobportal/widgets/custom_text_field.dart';
import 'package:jobportal/widgets/job_type_selector.dart';
import 'package:jobportal/widgets/premium_plan_card.dart';
import 'package:jobportal/widgets/publish_action_buttons.dart';
import 'package:jobportal/widgets/quick_recruit_card.dart';
import 'package:jobportal/widgets/requirements_section.dart';
import '../widgets/create_job_header.dart';

class CreateJobPostingScreen extends StatefulWidget {
  const CreateJobPostingScreen({super.key});

  @override
  State<CreateJobPostingScreen> createState() => _CreateJobPostingScreenState();
}

class _CreateJobPostingScreenState extends State<CreateJobPostingScreen> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController departmentController = TextEditingController();

  final TextEditingController locationController = TextEditingController();

  final TextEditingController salaryController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  String selectedJobType = "Full Time";

  bool quickRecruit = false;

  String selectedPlan = "";

  DateTime? closingDate;

  List<String> requirements = [];

  void addRequirement(String value) {
    setState(() {
      requirements.add(value);
    });
  }

  Future<void> pickDate() async {
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2035),
      initialDate: DateTime.now(),
    );

    if (date != null) {
      setState(() {
        closingDate = date;
      });
    }
  }

  void saveDraft() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Draft Saved")));
  }

  void publishJob() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Job Published")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF010B12),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const CreateJobHeader(),

              const SizedBox(height: 20),

              AIJobCreationCard(onGenerate: () {}),

              const SizedBox(height: 24),

              CustomTextField(
                label: "Job Title",
                hint: "e.g. Senior Software Engineer",
                controller: titleController,
              ),

              const SizedBox(height: 20),

              JobTypeSelector(
                selectedType: selectedJobType,
                onChanged: (value) {
                  setState(() {
                    selectedJobType = value;
                  });
                },
              ),

              const SizedBox(height: 20),

              CustomTextField(
                label: "Department",
                hint: "e.g. Engineering, Marketing",
                controller: departmentController,
              ),

              const SizedBox(height: 20),

              CustomTextField(
                label: "Location",
                hint: "e.g. Remote, New York, NY",
                controller: locationController,
              ),

              const SizedBox(height: 20),

              CustomTextField(
                label: "Salary/Compensation",
                hint: "e.g. \$80k - \$120k",
                controller: salaryController,
              ),

              const SizedBox(height: 20),

              CustomTextField(
                label: "Description",
                hint: "Describe the role...",
                maxLines: 6,
                controller: descriptionController,
              ),

              const SizedBox(height: 20),

              RequirementsSection(
                requirements: requirements,
                onAddRequirement: addRequirement,
              ),

              const SizedBox(height: 20),

              Text(
                "Application Closing Date",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),

              const SizedBox(height: 8),

              InkWell(
                onTap: pickDate,
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.amber),
                  ),
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    closingDate == null
                        ? "Select Date"
                        : closingDate!.toString().split(" ").first,
                    style: const TextStyle(color: Colors.white70),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              const Center(
                child: Text(
                  "⭐ Boost Your Posting ⭐",
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              QuickRecruitCard(
                enabled: quickRecruit,
                onChanged: (value) {
                  setState(() {
                    quickRecruit = value;
                  });
                },
              ),

              const SizedBox(height: 20),

              PremiumPlanCard(
                selectedPlan: selectedPlan,
                onPlanSelected: (plan) {
                  setState(() {
                    selectedPlan = plan;
                  });
                },
              ),

              const SizedBox(height: 30),

              PublishActionButtons(
                onSaveDraft: saveDraft,
                onPublish: publishJob,
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
