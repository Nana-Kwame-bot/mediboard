import "package:fast_immutable_collections/fast_immutable_collections.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:mediboard/medication/enums/dosing_time.dart";

part "medication.model.freezed.dart";

part "medication.model.g.dart";

@freezed
class Medication with _$Medication {
  const factory Medication({
    required String name,
    required String frequency,
    required IList<DosingTime> dosingTimes,
  }) = _Medication;

  factory Medication.fromJson(Map<String, dynamic> json) =>
      _$MedicationFromJson(json);
}
