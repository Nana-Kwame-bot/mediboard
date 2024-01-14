import "package:freezed_annotation/freezed_annotation.dart";
import "package:mediboard/activity/enums/visit_type.dart";

part "surgery.model.freezed.dart";

part "surgery.model.g.dart";

@freezed
class Surgery with _$Surgery {
  const factory Surgery({
    required String description,
    required String visitedAt,
    required String doctor,
    required VisitType visitType,
  }) = _Surgery;

  factory Surgery.fromJson(Map<String, dynamic> json) =>
      _$SurgeryFromJson(json);
}
