import "package:flutter/widgets.dart";
import "package:mediboard/activity/models/imaging/imaging.model.dart";
import "package:mediboard/colors/app_colors.dart";
import "package:mediboard/gen/assets.gen.dart";

extension ImagingExtension on Imaging {
  Color get color => AppColors.imaging;

  Image get icon => Assets.icons.small.imaging.image();
}
