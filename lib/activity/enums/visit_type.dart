import "package:flutter/material.dart";

enum VisitType { followUp, newVisit, referral, unknown }

extension VisitTypeExtension on VisitType {
  String get name {
    return switch (this) {
      VisitType.followUp => "Follow up",
      VisitType.newVisit => "New visit",
      VisitType.referral => "Referral",
      VisitType.unknown => "Unknown",
    };
  }

  IconData get icon {
    return switch (this) {
      VisitType.followUp => Icons.fast_forward_outlined,
      VisitType.newVisit => Icons.add,
      VisitType.referral => Icons.person_add,
      VisitType.unknown => Icons.help,
    };
  }
}
