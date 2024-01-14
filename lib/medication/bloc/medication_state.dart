part of "medication_bloc.dart";

@freezed
class MedicationState with _$MedicationState {
  const factory MedicationState({
    @Default(IListConst<Medication>([])) IList<Medication> medications,
    @Default(MedicationStatus.initial) MedicationStatus status,
  }) = _MedicationState;
}
