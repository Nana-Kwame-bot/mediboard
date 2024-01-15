import "dart:convert";
import "package:fast_immutable_collections/fast_immutable_collections.dart";
import "package:flutter/services.dart";
import "package:mediboard/gen/assets.gen.dart";
import "package:mediboard/logger/logger.dart";
import "package:mediboard/tracking_measure/model/tracking_measure.model.dart";
import "package:mediboard/user/repository/user_repository.dart";
import "package:multiple_result/multiple_result.dart";
import "package:stack_trace/stack_trace.dart";

class TrackingMeasureRepository {
  const TrackingMeasureRepository({required UserRepository userRepository})
      : _userRepository = userRepository;

  final UserRepository _userRepository;

  Future<Result<IList<TrackingMeasure>, String>> fetchTrackingMeasures() async {
    return Chain.capture(
      () async {
        try {
          final userId = _userRepository.currentUser.id;

          if (userId.isEmpty) return const Result.error("No user id");

          await Future<void>.delayed(const Duration(seconds: 3));

          final jsonString = await rootBundle.loadString(Assets.json.users);

          final userMap = jsonDecode(jsonString) as Map<String, dynamic>;

          if (userMap
              case {
                "trackingMeasures": final List<dynamic> trackingMeasuresList
              }) {
            final trackingMeasures = trackingMeasuresList.map((e) {
              final map = e as Map<String, dynamic>;

              return TrackingMeasure.fromJson(map);
            }).toIList();

            return Result.success(trackingMeasures);
          }

          return const Result.error("Error fetching trackingMeasures");
        } catch (e, stackTrace) {
          final terseStacktrace = Chain.forTrace(stackTrace).terse;

          logger.e(
            "Unknown error fetching trackingMeasures",
            error: e,
            stackTrace: terseStacktrace,
          );

          return Result.error(e.toString());
        }
      },
    );
  }
}
