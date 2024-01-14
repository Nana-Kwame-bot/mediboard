import "dart:async";
import "package:bloc/bloc.dart";
import "package:bloc_concurrency/bloc_concurrency.dart";
import "package:fast_immutable_collections/fast_immutable_collections.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:mediboard/medication/enums/medication_status.dart";
import "package:mediboard/medication/model/medication.model.dart";
import "package:mediboard/medication/repository/medication_repository.dart";

part "medication_bloc.freezed.dart";
part "medication_event.dart";
part "medication_state.dart";

class MedicationBloc extends Bloc<MedicationEvent, MedicationState> {
  MedicationBloc({
    required MedicationRepository medicationRepository,
  })  : _medicationRepository = medicationRepository,
        super(const _MedicationState()) {
    on<_MedicationsReceived>(_onMedicationsReceived, transformer: droppable());
  }

  final MedicationRepository _medicationRepository;

  FutureOr<void> _onMedicationsReceived(
    _MedicationsReceived event,
    Emitter<MedicationState> emit,
  ) async {
    emit(state.copyWith(status: MedicationStatus.loading));

    final fetchMedicationsResult =
        await _medicationRepository.fetchMedications();

    fetchMedicationsResult.when<void>(
      (medications) {
        emit(
          state.copyWith(
            status: MedicationStatus.success,
            medications: medications,
          ),
        );
      },
      (error) {
        emit(
          state.copyWith(status: MedicationStatus.failure, errorMessage: error),
        );
      },
    );
  }
}
