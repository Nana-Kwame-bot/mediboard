import "package:auto_size_text/auto_size_text.dart";
import "package:badges/badges.dart" as badges;
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:mediboard/activity/bloc/activity_bloc.dart";
import "package:mediboard/activity/extension/activity_extension.dart";
import "package:mediboard/colors/app_colors.dart";
import "package:mediboard/gen/assets.gen.dart";

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final _headerGroup = AutoSizeGroup();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: BlocSelector<ActivityBloc, ActivityState, int>(
                selector: (activityState) {
                  return activityState.activity.numberOfVisits;
                },
                builder: (context, numberOfVisits) {
                  if (numberOfVisits == 0) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Assets.icons.large.visits.image(),
                        AutoSizeText(
                          "Visits",
                          style: Theme.of(context).textTheme.bodyLarge,
                          maxLines: 1,
                          group: _headerGroup,
                        ),
                      ],
                    );
                  }

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      badges.Badge(
                        badgeStyle: const badges.BadgeStyle(
                          borderSide:
                              BorderSide(color: AppColors.background, width: 2),
                        ),
                        badgeContent: Padding(
                          padding: const EdgeInsets.all(2),
                          child: AutoSizeText(
                            "$numberOfVisits",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Colors.white,
                                ),
                          ),
                        ),
                        position: badges.BadgePosition.topEnd(top: -7, end: 5),
                        child: Assets.icons.large.visits.image(),
                      ),
                      AutoSizeText(
                        "Visits",
                        style: Theme.of(context).textTheme.bodyLarge,
                        maxLines: 1,
                        group: _headerGroup,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Assets.icons.large.medications.image(),
                  AutoSizeText(
                    "Medications",
                    style: Theme.of(context).textTheme.bodyLarge,
                    maxLines: 1,
                    group: _headerGroup,
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Assets.icons.large.vaccinations.image(),
                  AutoSizeText(
                    "Vaccinations",
                    style: Theme.of(context).textTheme.bodyLarge,
                    maxLines: 1,
                    group: _headerGroup,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
