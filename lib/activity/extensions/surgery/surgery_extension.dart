import "package:flutter/widgets.dart";
import "package:mediboard/activity/models/surgery/surgery.model.dart";
import "package:mediboard/colors/app_colors.dart";
import "package:mediboard/gen/assets.gen.dart";

extension SurgeryExtension on Surgery {
  Color get color => AppColors.surgery;

  Image get icon => Assets.icons.small.surgery.image();
}
