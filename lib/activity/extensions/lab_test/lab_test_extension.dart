import "package:flutter/widgets.dart";
import "package:mediboard/activity/models/lab_test/lab_test.model.dart";
import "package:mediboard/colors/app_colors.dart";
import "package:mediboard/gen/assets.gen.dart";

extension LabTestExtension on LabTest {
  Color get color => AppColors.labTest;

  Image get icon => Assets.icons.small.labTest.image();
}
