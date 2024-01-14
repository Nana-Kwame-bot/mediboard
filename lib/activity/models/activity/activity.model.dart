import "package:fast_immutable_collections/fast_immutable_collections.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:mediboard/activity/models/imaging/imaging.model.dart";
import "package:mediboard/activity/models/lab_test/lab_test.model.dart";
import "package:mediboard/activity/models/surgery/surgery.model.dart";
import "package:mediboard/activity/models/vaccination/vaccination.model.dart";
import "package:mediboard/activity/models/visit/visit.model.dart";

part "activity.model.freezed.dart";

part "activity.model.g.dart";

@freezed
sealed class Activity with _$Activity {
  const factory Activity({
    @Default(IListConst<Visit>([])) IList<Visit> visits,
    @Default(IListConst<Vaccination>([])) IList<Vaccination> vaccinations,
    @Default(IListConst<LabTest>([])) IList<LabTest> labTests,
    @Default(IListConst<Imaging>([])) IList<Imaging> imaging,
    @Default(IListConst<Surgery>([])) IList<Surgery> surgeries,
  }) = _Activity;

  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);
}
