import "package:freezed_annotation/freezed_annotation.dart";
import "package:mediboard/activity/enums/visit_type.dart";

part "vaccination.model.freezed.dart";

part "vaccination.model.g.dart";

@freezed
class Vaccination with _$Vaccination {
  const factory Vaccination({
    required String description,
    required String visitedAt,
    required String doctor,
    required VisitType visitType,
  }) = _Vaccination;

  factory Vaccination.fromJson(Map<String, dynamic> json) =>
      _$VaccinationFromJson(json);
}
