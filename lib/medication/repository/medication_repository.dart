import "dart:convert";
import "package:fast_immutable_collections/fast_immutable_collections.dart";
import "package:flutter/services.dart";
import "package:mediboard/gen/assets.gen.dart";
import "package:mediboard/logger/logger.dart";
import "package:mediboard/medication/model/medication.model.dart";
import "package:mediboard/user/repository/user_repository.dart";
import "package:multiple_result/multiple_result.dart";
import "package:stack_trace/stack_trace.dart";

class MedicationRepository {
  const MedicationRepository({required UserRepository userRepository})
      : _userRepository = userRepository;

  final UserRepository _userRepository;

  Future<Result<IList<Medication>, String>> fetchMedications() async {
    return Chain.capture(
      () async {
        try {
          final userId = _userRepository.currentUser.id;

          if (userId.isEmpty) return const Result.success(IListConst([]));

          await Future<void>.delayed(const Duration(seconds: 1));

          final jsonString = await rootBundle.loadString(Assets.json.users);

          final userMap = jsonDecode(jsonString) as Map<String, dynamic>;

          if (userMap
              case {"medications": final List<dynamic> medicationsList}) {
            final medications = medicationsList.map((e) {
              final map = e as Map<String, dynamic>;

              return Medication.fromJson(map);
            }).toIList();

            return Result.success(medications);
          }

          return const Result.error("Error fetching medications");
        } catch (e, stackTrace) {
          final terseStacktrace = Chain.forTrace(stackTrace).terse;

          logger.e(
            "Unknown error fetching medications",
            error: e,
            stackTrace: terseStacktrace,
          );

          return Result.error(e.toString());
        }
      },
    );
  }
}
