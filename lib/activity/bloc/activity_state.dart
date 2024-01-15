part of "activity_bloc.dart";

@freezed
class ActivityState with _$ActivityState {
  const factory ActivityState({
    String? errorMessage,
    @Default(ActivityStatus.initial) ActivityStatus status,
    @Default(Activity()) Activity activity,
  }) = _ActivityState;
}
