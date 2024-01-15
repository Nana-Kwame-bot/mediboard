import "package:auto_size_text/auto_size_text.dart";
import "package:badges/badges.dart" as badges;
import "package:flutter/material.dart";
import "package:mediboard/colors/app_colors.dart";
import "package:mediboard/gen/assets.gen.dart";

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.background,
      automaticallyImplyLeading: false,
      title: AutoSizeText(
        "Hello Shmuel",
        style: Theme.of(context).textTheme.displayLarge,
      ),
      actions: [
        IconButton(
          icon: badges.Badge(
            badgeStyle: const badges.BadgeStyle(
              padding: EdgeInsets.all(4),
              borderRadius: BorderRadius.all(Radius.circular(4)),
              badgeColor: AppColors.sliderSafe,
            ),
            position: badges.BadgePosition.topEnd(top: -7, end: -3),
            badgeContent: Container(
              decoration: const BoxDecoration(shape: BoxShape.circle),
              width: 1,
              height: 1,
            ),
            child: Assets.icons.bell.image(),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
