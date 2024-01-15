enum ActivityStatus { initial, loading, success, failure }

extension ActivityStatusX on ActivityStatus {
  bool get isLoading => this == ActivityStatus.loading;
  bool get isInitial => this == ActivityStatus.initial;
  bool get isSuccess => this == ActivityStatus.success;
  bool get isFailure => this == ActivityStatus.failure;
}
