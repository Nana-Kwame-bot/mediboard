part of "tracking_measure_bloc.dart";

@freezed
class TrackingMeasureState with _$TrackingMeasureState {
  const factory TrackingMeasureState({
    @Default(IListConst<TrackingMeasure>([]))
    IList<TrackingMeasure> trackingMeasures,
    String? errorMessage,
    @Default(TrackingMeasureStatus.initial) TrackingMeasureStatus status,
  }) = _TrackingMeasureState;
}
