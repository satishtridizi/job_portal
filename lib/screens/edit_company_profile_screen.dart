import 'package:flutter/material.dart';
import 'package:jobportal/data/company_profile_data.dart';
import 'package:jobportal/utils/app_colors.dart';
import 'package:jobportal/widgets/company_dropdown.dart';
import 'package:jobportal/widgets/company_profile_header.dart';
import 'package:jobportal/widgets/company_text_field.dart';
import 'package:jobportal/widgets/company_top_bar.dart';
import 'package:jobportal/widgets/save_changes_button.dart';

class EditCompanyProfileScreen extends StatefulWidget {
  const EditCompanyProfileScreen({super.key});

  @override
  State<EditCompanyProfileScreen> createState() =>
      _EditCompanyProfileScreenState();
}

class _EditCompanyProfileScreenState extends State<EditCompanyProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController companyNameController;
  late final TextEditingController locationController;
  late final TextEditingController websiteController;
  late final TextEditingController descriptionController;

  String? selectedIndustry;
  String? selectedCompanySize;

  @override
  void initState() {
    super.initState();

    companyNameController = TextEditingController(
      text: companyProfile.companyName,
    );

    locationController = TextEditingController(text: companyProfile.location);

    websiteController = TextEditingController(text: companyProfile.website);

    descriptionController = TextEditingController(
      text: companyProfile.description,
    );

    selectedIndustry = companyProfile.industry.isEmpty
        ? null
        : companyProfile.industry;

    selectedCompanySize = companyProfile.companySize.isEmpty
        ? null
        : companyProfile.companySize;
  }

  @override
  void dispose() {
    companyNameController.dispose();
    locationController.dispose();
    websiteController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    if (companyNameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Company Name is required")));
      return;
    }

    if (selectedIndustry == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please select Industry")));
      return;
    }

    if (selectedCompanySize == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select Company Size")),
      );
      return;
    }

    debugPrint("Company Name : ${companyNameController.text}");
    debugPrint("Industry : $selectedIndustry");
    debugPrint("Company Size : $selectedCompanySize");
    debugPrint("Location : ${locationController.text}");
    debugPrint("Website : ${websiteController.text}");
    debugPrint("Description : ${descriptionController.text}");

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Company Profile Updated Successfully")),
    );

    // TODO:
    // Call Update Company Profile API
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
                child: const CompanyTopBar(),
              ),

              Container(
                width: double.infinity,
                height: 1,
                color: AppColors.cardBorder,
              ),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),

                      const CompanyProfileHeader(),

                      const SizedBox(height: 35),

                      CompanyTextField(
                        label: "Company Name",
                        hint: "My Company",
                        requiredField: true,
                        controller: companyNameController,
                      ),

                      const SizedBox(height: 20),

                      CompanyDropdown(
                        label: "Industry",
                        hint: "Select Industry",
                        requiredField: true,
                        value: selectedIndustry,
                        items: industries,
                        onChanged: (value) {
                          setState(() {
                            selectedIndustry = value;
                          });
                        },
                      ),

                      const SizedBox(height: 20),

                      CompanyDropdown(
                        label: "Company Size",
                        hint: "Select Company Size",
                        requiredField: true,
                        value: selectedCompanySize,
                        items: companySizes,
                        onChanged: (value) {
                          setState(() {
                            selectedCompanySize = value;
                          });
                        },
                      ),

                      const SizedBox(height: 20),

                      CompanyTextField(
                        label: "Location",
                        hint: "Remote",
                        requiredField: true,
                        controller: locationController,
                      ),

                      const SizedBox(height: 20),

                      CompanyTextField(
                        label: "Website",
                        hint: "https://www.example.com",
                        keyboardType: TextInputType.url,
                        controller: websiteController,
                      ),

                      const SizedBox(height: 20),

                      CompanyTextField(
                        label: "Company Description",
                        hint: "Tell us about your company...",
                        controller: descriptionController,
                        maxLines: 6,
                      ),

                      const SizedBox(height: 35),

                      SaveChangesButton(onPressed: _saveProfile),

                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
