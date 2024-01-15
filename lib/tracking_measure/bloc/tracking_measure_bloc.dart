import "package:bloc/bloc.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "tracking_measure_event.dart";
part "tracking_measure_state.dart";
part "tracking_measure_bloc.freezed.dart";

class TrackingMeasureBloc
    extends Bloc<TrackingMeasureEvent, TrackingMeasureState> {
  TrackingMeasureBloc() : super(const _TrackingMeasureState()) {
    on<TrackingMeasureEvent>((event, emit) {
      // TODO(Nana-Kwame-bot): implement event handler
    });
  }
}
