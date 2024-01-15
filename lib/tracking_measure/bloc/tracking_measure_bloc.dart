import "dart:async";
import "package:bloc/bloc.dart";
import "package:bloc_concurrency/bloc_concurrency.dart";
import "package:fast_immutable_collections/fast_immutable_collections.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:mediboard/tracking_measure/enums/tracking_measure_status.dart";
import "package:mediboard/tracking_measure/model/tracking_measure.model.dart";
import "package:mediboard/tracking_measure/repository/tracking_measure_repository.dart";

part "tracking_measure_event.dart";
part "tracking_measure_state.dart";
part "tracking_measure_bloc.freezed.dart";

class TrackingMeasureBloc
    extends Bloc<TrackingMeasureEvent, TrackingMeasureState> {
  TrackingMeasureBloc({
    required TrackingMeasureRepository trackingMeasureRepository,
  })  : _trackingMeasureRepository = trackingMeasureRepository,
        super(const _TrackingMeasureState()) {
    on<_TrackingMeasuresRecieved>(
      _onTrackingMeasuresRecieved,
      transformer: droppable(),
    );
  }

  final TrackingMeasureRepository _trackingMeasureRepository;

  FutureOr<void> _onTrackingMeasuresRecieved(
    _TrackingMeasuresRecieved event,
    Emitter<TrackingMeasureState> emit,
  ) async {
    emit(state.copyWith(status: TrackingMeasureStatus.loading));

    final fetchTrackingMeasuresResult =
        await _trackingMeasureRepository.fetchTrackingMeasures();

    fetchTrackingMeasuresResult.when<void>(
      (trackingMeasures) {
        emit(
          state.copyWith(
            status: TrackingMeasureStatus.success,
            trackingMeasures: trackingMeasures,
          ),
        );
      },
      (error) {
        emit(
          state.copyWith(
            status: TrackingMeasureStatus.failure,
            errorMessage: error,
          ),
        );
      },
    );
  }
}
