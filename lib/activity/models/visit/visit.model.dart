import "package:freezed_annotation/freezed_annotation.dart";
import "package:mediboard/activity/enums/visit_type.dart";

part "visit.model.freezed.dart";

part "visit.model.g.dart";

@freezed
class Visit with _$Visit {
  const factory Visit({
    required String description,
    required String visitedAt,
    required String doctor,
    required VisitType visitType,
  }) = _Visit;

  factory Visit.fromJson(Map<String, dynamic> json) => _$VisitFromJson(json);
}
