import "package:freezed_annotation/freezed_annotation.dart";
import "package:mediboard/activity/enums/priority.dart";

part "lab_test.model.freezed.dart";

part "lab_test.model.g.dart";

@freezed
class LabTest with _$LabTest {
  const factory LabTest({
    required Priority priority,
    required String description,
    required String timeConducted,
    required String conductedAt,
    required String referredBy,
  }) = _LabTest;

  factory LabTest.fromJson(Map<String, dynamic> json) =>
      _$LabTestFromJson(json);
}
