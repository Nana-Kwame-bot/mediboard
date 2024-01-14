import "package:freezed_annotation/freezed_annotation.dart";

part "user.model.freezed.dart";

@freezed
class User with _$User {
  const factory User({
    required String id,
  }) = _User;
}
