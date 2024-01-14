import "package:auto_size_text/auto_size_text.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:mediboard/activity/bloc/activity_bloc.dart";

class MediTiles extends StatelessWidget {
  const MediTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return BlocBuilder<ActivityBloc, ActivityState>(
              builder: (context, activityState) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: ExpansionTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    title: AutoSizeText(
                      "Future Visits $index",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    children: [
                      ListTile(
                        title: AutoSizeText(
                          "Future Visits bodyMedium",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        subtitle: AutoSizeText(
                          "Future Visits bodyLarge",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          childCount: 5,
        ),
      ),
    );
  }
}
