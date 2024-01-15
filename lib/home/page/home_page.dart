import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:mediboard/activity/bloc/activity_bloc.dart";
import "package:mediboard/activity/enums/activity_status.dart";
import "package:mediboard/colors/app_colors.dart";
import "package:mediboard/gen/assets.gen.dart";
import "package:mediboard/home/components/active_medications.dart";
import "package:mediboard/home/components/donut_chart.dart";
import "package:mediboard/home/components/header.dart";
import "package:mediboard/home/components/home_page_app_bar.dart";
import "package:mediboard/home/components/medi_tiles.dart";
import "package:mediboard/home/components/medi_tiles_shimmer.dart";
import "package:mediboard/home/components/tracking_measures.dart";

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocSelector<ActivityBloc, ActivityState, bool>(
        selector: (activityState) => activityState.status.isLoading,
        builder: (context, isLoading) {
          return CustomScrollView(
            slivers: [
              const HomePageAppBar(),
              const Header(),
              if (isLoading)
                const SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.eclipse,
                    ),
                  ),
                )
              else
                const DonutChart(),
              if (isLoading) const MediTilesShimmer() else const MediTiles(),
              const ActiveMedications(),
              const TrackingMeasures(),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: Colors.white,
        elevation: 5,
        color: Colors.white,
        height: AppBar().preferredSize.height,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 36),
        child: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: AppColors.eclipse,
          onPressed: () {},
          child: Assets.icons.grid.image(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: AppColors.background,
    );
  }
}
