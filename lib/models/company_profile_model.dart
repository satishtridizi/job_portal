class CompanyProfileModel {
  final String companyName;
  final String industry;
  final String companySize;
  final String location;
  final String website;
  final String description;

  const CompanyProfileModel({
    required this.companyName,
    required this.industry,
    required this.companySize,
    required this.location,
    required this.website,
    required this.description,
  });

  CompanyProfileModel copyWith({
    String? companyName,
    String? industry,
    String? companySize,
    String? location,
    String? website,
    String? description,
  }) {
    return CompanyProfileModel(
      companyName: companyName ?? this.companyName,
      industry: industry ?? this.industry,
      companySize: companySize ?? this.companySize,
      location: location ?? this.location,
      website: website ?? this.website,
      description: description ?? this.description,
    );
  }
}
