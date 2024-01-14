import "package:auto_size_text/auto_size_text.dart";
import "package:flutter/material.dart";
import "package:mediboard/gen/assets.gen.dart";

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverAppBar(
        automaticallyImplyLeading: false,
        title: AutoSizeText(
          "Hello Shmuel",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        actions: [
          IconButton(
            icon: Assets.icons.bell.image(),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
