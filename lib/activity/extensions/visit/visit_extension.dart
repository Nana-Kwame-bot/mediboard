import "package:flutter/widgets.dart";
import "package:mediboard/activity/models/vaccination/vaccination.model.dart";
import "package:mediboard/colors/app_colors.dart";
import "package:mediboard/gen/assets.gen.dart";

extension VaccinationExtension on Vaccination {
  Color get color => AppColors.vaccination;

  Image get icon => Assets.icons.small.vaccination.image();
}
