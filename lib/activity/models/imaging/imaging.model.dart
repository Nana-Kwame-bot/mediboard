import "package:freezed_annotation/freezed_annotation.dart";
import "package:mediboard/activity/enums/priority.dart";

part "imaging.model.freezed.dart";

part "imaging.model.g.dart";

@freezed
class Imaging with _$Imaging {
  const factory Imaging({
    required Priority priority,
    required String description,
    required String lastRenewedAt,
    required String referredBy,
    required String diagnosis,
  }) = _Imaging;

  factory Imaging.fromJson(Map<String, dynamic> json) =>
      _$ImagingFromJson(json);
}
