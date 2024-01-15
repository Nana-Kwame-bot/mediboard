import "package:flutter/widgets.dart";
import "package:mediboard/gen/assets.gen.dart";

enum TrackingMeasureTech { oura, carelink }

extension TrackingMeasureTechX on TrackingMeasureTech {
  String get name {
    return switch (this) {
      TrackingMeasureTech.oura => "Oura",
      TrackingMeasureTech.carelink => "Carelink",
    };
  }

  Image get icon {
    return switch (this) {
      TrackingMeasureTech.oura => Assets.icons.oura.image(),
      TrackingMeasureTech.carelink => Assets.icons.carelink.image(),
    };
  }
}
