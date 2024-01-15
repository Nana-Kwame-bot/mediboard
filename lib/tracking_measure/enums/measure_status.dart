import "package:flutter/widgets.dart";
import "package:mediboard/colors/app_colors.dart";

enum MeasureStatus { good, offTrack }

extension MeasureStatusExtension on MeasureStatus {
  String get name {
    return switch (this) {
      MeasureStatus.good => "Good",
      MeasureStatus.offTrack => "Off Track",
    };
  }

  Color get color {
    return switch (this) {
      MeasureStatus.good => AppColors.green600,
      MeasureStatus.offTrack => AppColors.red600,
    };
  }
}
