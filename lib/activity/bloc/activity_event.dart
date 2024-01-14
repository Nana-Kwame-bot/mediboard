part of "activity_bloc.dart";

@freezed
class ActivityEvent with _$ActivityEvent {
  const factory ActivityEvent.activitiesReceived() = _ActivitiesReceived;
}
