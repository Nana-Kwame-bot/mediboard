import "package:freezed_annotation/freezed_annotation.dart";
import "package:mediboard/tracking_measure/enums/measure_status.dart";
import "package:mediboard/tracking_measure/enums/tracking_measure_tech.dart";

part "tracking_measure.model.freezed.dart";

part "tracking_measure.model.g.dart";

@freezed
sealed class TrackingMeasure with _$TrackingMeasure {
  const factory TrackingMeasure.b12({
    required String date,
    required int value,
    required String unit,
    required MeasureStatus status,
    required String lastTestResult,
  }) = B12;

  const factory TrackingMeasure.bpm({
    required String date,
    required int value,
    required String name,
    required MeasureStatus status,
    required TrackingMeasureTech tech,
    required String records,
  }) = Bpm;

  factory TrackingMeasure.fromJson(Map<String, dynamic> json) =>
      _$TrackingMeasureFromJson(json);
}
