import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:mediboard/colors/app_colors.dart";
import "package:mediboard/gen/assets.gen.dart";
import "package:mediboard/home/components/active_medications.dart";
import "package:mediboard/home/components/donut_chart.dart";
import "package:mediboard/home/components/header.dart";
import "package:mediboard/home/components/home_page_app_bar.dart";
import "package:mediboard/home/components/medi_tiles.dart";
import "package:mediboard/home/components/tracking_measures.dart";

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const CustomScrollView(
        slivers: [
          HomePageAppBar(),
          Header(),
          DonutChart(),
          MediTiles(),
          ActiveMedications(),
          TrackingMeasures(),
        ],
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
