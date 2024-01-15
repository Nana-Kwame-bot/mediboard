import "package:mediboard/activity/models/activity/activity.model.dart";

extension ActivityExtension on Activity {
  int get numberOfVisits => visits.length;

  int get numberOfVaccinations => vaccinations.length;

  int get numberOfLabTests => labTests.length;

  int get numberOfImaging => imaging.length;

  int get numberOfSurgeries => surgeries.length;

  bool get hasVisits => visits.isNotEmpty;

  bool get hasVaccinations => vaccinations.isNotEmpty;

  bool get hasLabTests => labTests.isNotEmpty;

  bool get hasImaging => imaging.isNotEmpty;

  bool get hasSurgeries => surgeries.isNotEmpty;

  int get numberOfActivities {
    return numberOfVisits +
        numberOfVaccinations +
        numberOfLabTests +
        numberOfImaging +
        numberOfSurgeries;
  }

  double get visitsPercentage {
    return numberOfActivities != 0 ? numberOfVisits / numberOfActivities : 0.0;
  }

  double get vaccinationsPercentage {
    return numberOfActivities != 0
        ? numberOfVaccinations / numberOfActivities
        : 0.0;
  }

  double get labTestsPercentage {
    return numberOfActivities != 0
        ? numberOfLabTests / numberOfActivities
        : 0.0;
  }

  double get imagingPercentage {
    return numberOfActivities != 0 ? numberOfImaging / numberOfActivities : 0.0;
  }

  double get surgeriesPercentage {
    return numberOfActivities != 0
        ? numberOfSurgeries / numberOfActivities
        : 0.0;
  }
}
