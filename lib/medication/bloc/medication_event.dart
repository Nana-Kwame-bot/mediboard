part of "medication_bloc.dart";

@freezed
class MedicationEvent with _$MedicationEvent {
  const factory MedicationEvent.medicationsReceived() = _MedicationsReceived;
}
