import "dart:convert";
import "package:flutter/services.dart";
import "package:mediboard/activity/models/activity/activity.model.dart";
import "package:mediboard/gen/assets.gen.dart";
import "package:mediboard/logger/logger.dart";
import "package:mediboard/user/repository/user_repository.dart";
import "package:multiple_result/multiple_result.dart";
import "package:stack_trace/stack_trace.dart";

class ActivityRepository {
  const ActivityRepository({required UserRepository userRepository})
      : _userRepository = userRepository;

  final UserRepository _userRepository;

  Future<Result<Activity, String>> fetchActivities() async {
    return Chain.capture(
      () async {
        try {
          final userId = _userRepository.currentUser.id;

          if (userId.isEmpty) return const Result.error("No user id");

          await Future<void>.delayed(const Duration(seconds: 3));

          final jsonString = await rootBundle.loadString(Assets.json.users);

          final userMap = jsonDecode(jsonString) as Map<String, dynamic>;

          if (userMap case {"activities": final Map<String, dynamic> map}) {
            final activities = Activity.fromJson(map);

            return Result.success(activities);
          }

          return const Result.error("Error fetching activities");
        } catch (e, stackTrace) {
          final terseStacktrace = Chain.forTrace(stackTrace).terse;

          logger.e(
            "Unknown error fetching activities",
            error: e,
            stackTrace: terseStacktrace,
          );

          return Result.error(e.toString());
        }
      },
    );
  }
}
