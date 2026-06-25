class SupportItemModel {
  final String title;
  final bool showArrow;
  final bool isEnabled;

  const SupportItemModel({
    required this.title,
    this.showArrow = true,
    this.isEnabled = true,
  });

  /// Create object from API response
  factory SupportItemModel.fromJson(Map<String, dynamic> json) {
    return SupportItemModel(
      title: json['title'] ?? '',
      showArrow: json['showArrow'] ?? true,
      isEnabled: json['isEnabled'] ?? true,
    );
  }

  /// Convert object to JSON
  Map<String, dynamic> toJson() {
    return {'title': title, 'showArrow': showArrow, 'isEnabled': isEnabled};
  }

  /// Copy with updated values
  SupportItemModel copyWith({String? title, bool? showArrow, bool? isEnabled}) {
    return SupportItemModel(
      title: title ?? this.title,
      showArrow: showArrow ?? this.showArrow,
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }
}
