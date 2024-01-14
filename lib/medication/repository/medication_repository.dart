import "dart:convert";
import "package:fast_immutable_collections/fast_immutable_collections.dart";
import "package:flutter/services.dart";
import "package:mediboard/medication/model/medication.model.dart";
import "package:mediboard/user/repository/user_repository.dart";

class MedicationRepository {
  const MedicationRepository({required UserRepository userRepository})
      : _userRepository = userRepository;

  final UserRepository _userRepository;

  Future<IList<Medication>> fetchMedications() async {
    final userId = _userRepository.currentUser.id;

    if (userId.isEmpty) return const IListConst([]);

    await Future<void>.delayed(const Duration(seconds: 1));

    final jsonString = await rootBundle.loadString("assets/json/users.json");

    final userMap = jsonDecode(jsonString) as Map<String, dynamic>;

    if (userMap case {"medications": final List<dynamic> medications}) {
      return medications.map((e) {
        final map = e as Map<String, dynamic>;

        return Medication.fromJson(map);
      }).toIList();
    }

    return const IListConst([]);
  }
}
