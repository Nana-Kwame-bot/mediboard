import "dart:async";

import "package:bloc/bloc.dart";
import "package:bloc_concurrency/bloc_concurrency.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:mediboard/activity/enums/activity_status.dart";
import "package:mediboard/activity/models/activity/activity.model.dart";
import "package:mediboard/activity/repository/activity_repository.dart";
import "package:mediboard/logger/logger.dart";

part "activity_event.dart";
part "activity_state.dart";
part "activity_bloc.freezed.dart";

class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  ActivityBloc({required ActivityRepository activityRepository})
      : _activityRepository = activityRepository,
        super(const _ActivityState()) {
    on<_ActivitiesReceived>(_onActivitiesReceived, transformer: droppable());
  }

  final ActivityRepository _activityRepository;

  FutureOr<void> _onActivitiesReceived(
    _ActivitiesReceived event,
    Emitter<ActivityState> emit,
  ) async {
    emit(state.copyWith(status: ActivityStatus.loading));

    final fetchActivitiesResult = await _activityRepository.fetchActivities();

    fetchActivitiesResult.when<void>(
      (activities) {
        logger.e("activities: $activities");

        emit(
          state.copyWith(
            status: ActivityStatus.success,
            activities: activities,
          ),
        );
      },
      (error) {
        emit(
          state.copyWith(status: ActivityStatus.failure, errorMessage: error),
        );
      },
    );
  }
}
