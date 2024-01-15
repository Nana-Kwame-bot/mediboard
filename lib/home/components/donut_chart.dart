import "package:auto_size_text/auto_size_text.dart";
import "package:fl_chart/fl_chart.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:mediboard/activity/bloc/activity_bloc.dart";
import "package:mediboard/activity/extension/activity_extension.dart";
import "package:mediboard/activity/models/activity/activity.model.dart";
import "package:mediboard/colors/app_colors.dart";

class DonutChart extends StatelessWidget {
  const DonutChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverToBoxAdapter(
        child: SizedBox(
          height: 290,
          width: 366,
          child: BlocSelector<ActivityBloc, ActivityState, Activity>(
            selector: (activityState) => activityState.activity,
            builder: (context, activity) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  PieChart(
                    PieChartData(
                      pieTouchData: PieTouchData(
                        touchCallback:
                            (FlTouchEvent event, pieTouchResponse) {},
                      ),
                      borderData: FlBorderData(show: false),
                      sectionsSpace: 0,
                      centerSpaceRadius: 110,
                      sections: [
                        PieChartSectionData(
                          title: "",
                          color: AppColors.labTest,
                          // value: 20,
                          value: activity.labTestsPercentage,
                          radius: 30,
                          titleStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        PieChartSectionData(
                          title: "",
                          color: AppColors.medication,
                          // value: 20,
                          value: activity.imagingPercentage,
                          radius: 30,
                          titleStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        PieChartSectionData(
                          title: "",
                          color: AppColors.vaccination,
                          // value: 20,
                          value: activity.vaccinationsPercentage,
                          radius: 30,
                          titleStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        PieChartSectionData(
                          title: "",
                          color: AppColors.surgery,
                          // value: 20,
                          value: activity.surgeriesPercentage,
                          radius: 30,
                          titleStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        PieChartSectionData(
                          title: "",
                          color: AppColors.visit,
                          // value: 20,
                          value: activity.visitsPercentage,
                          radius: 30,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        "Upcoming",
                        style: Theme.of(context).textTheme.bodyMedium,
                        maxLines: 1,
                      ),
                      AutoSizeText(
                        "${activity.numberOfActivities} Activities",
                        style: Theme.of(context).textTheme.titleMedium,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
