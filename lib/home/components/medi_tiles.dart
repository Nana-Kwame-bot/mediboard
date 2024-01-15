import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:mediboard/activity/bloc/activity_bloc.dart";
import "package:mediboard/activity/models/activity/activity.model.dart";
import "package:mediboard/home/components/imaging/imaging_widget.dart";
import "package:mediboard/home/components/lab_tests/lab_tests_widget.dart";
import "package:mediboard/home/components/surgeries/surgeries_widget.dart";
import "package:mediboard/home/components/vaccinations/vaccinations_widget.dart";

import "package:mediboard/home/components/visits/visits_widget.dart";

class MediTiles extends StatelessWidget {
  const MediTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      sliver: SliverToBoxAdapter(
        child: BlocSelector<ActivityBloc, ActivityState, Activity>(
          selector: (activityState) => activityState.activity,
          builder: (context, activity) {
            final Activity(
              :imaging,
              :labTests,
              :surgeries,
              :vaccinations,
              :visits,
            ) = activity;

            return ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 4),
              children: [
                // TODO(Nana-Kwame-bot): Make them spread horizontally instead of vertically
                VisitsWidget(visits: visits),
                VaccinationsWidget(vaccinations: vaccinations),
                LabTestsWidget(labTests: labTests),
                ImagingWidget(imaging: imaging),
                SurgeriesWidget(surgeries: surgeries),
              ],
            );
          },
        ),
      ),
    );
  }
}
