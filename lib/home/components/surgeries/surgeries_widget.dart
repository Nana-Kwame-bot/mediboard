import "package:auto_size_text/auto_size_text.dart";
import "package:fast_immutable_collections/fast_immutable_collections.dart";
import "package:flutter/material.dart";
import "package:mediboard/activity/enums/visit_type.dart";
import "package:mediboard/activity/models/surgery/surgery.model.dart";
import "package:mediboard/colors/app_colors.dart";
import "package:mediboard/gen/assets.gen.dart";

class SurgeriesWidget extends StatelessWidget {
  const SurgeriesWidget({required this.surgeries, super.key});

  final IList<Surgery> surgeries;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ExpansionTile(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        leading: Assets.icons.small.surgery.image(),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText(
              "Surgeries",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Container(
              alignment: Alignment.center,
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.surgery,
              ),
              child: AutoSizeText("${surgeries.length}"),
            ),
          ],
        ),
        children: [
          for (final Surgery(
                :description,
                :doctor,
                :visitType,
                :visitedAt,
              ) in surgeries) ...[
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: AutoSizeText(
                description,
                style: Theme.of(context).textTheme.titleMedium,
                maxLines: 2,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: "Visited at ",
                        style: DefaultTextStyle.of(context).style,
                      ),
                      TextSpan(
                        text: visitedAt,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    "Doctor",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.blueGrey,
                        ),
                  ),
                  AutoSizeText(doctor),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    "Visit Type",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.blueGrey,
                        ),
                  ),
                  const Spacer(),
                  Icon(visitType.icon),
                  const SizedBox(width: 8),
                  AutoSizeText(visitType.name),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: AppColors.eclipse,
                  ),
                  child: const AutoSizeText("View Details"),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
