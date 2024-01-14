import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
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
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          HomePageAppBar(),
          Header(),
          DonutChart(),
          MediTiles(),
          ActiveMedications(),
          TrackingMeasures(),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const [],
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: const Icon(Icons.add),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
