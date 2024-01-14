import "package:flutter/widgets.dart";
import "package:mediboard/colors/app_colors.dart";

enum Priority { high, medium, low }

extension PriorityExtension on Priority {
  String get name {
    return switch (this) {
      Priority.high => "High Priority",
      Priority.medium => "Medium Priority",
      Priority.low => "Low Priority",
    };
  }

  Color get color {
    return switch (this) {
      Priority.high => AppColors.red600,
      Priority.medium => AppColors.blue600,
      Priority.low => AppColors.green600,
    };
  }
}
