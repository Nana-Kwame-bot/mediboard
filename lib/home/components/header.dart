import "package:auto_size_text/auto_size_text.dart";
import "package:flutter/material.dart";
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
    return SliverPadding(
      padding: const EdgeInsets.all(24),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Assets.icons.large.visits.image(),
                    AutoSizeText(
                      "Visits",
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
      ),
    );
  }
}
