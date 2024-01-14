import "package:bloc/bloc.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "activity_event.dart";
part "activity_state.dart";
part "activity_bloc.freezed.dart";

class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  ActivityBloc() : super(const _ActivityState()) {
    on<ActivityEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
