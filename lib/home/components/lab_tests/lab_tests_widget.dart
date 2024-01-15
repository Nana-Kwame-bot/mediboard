import "package:auto_size_text/auto_size_text.dart";
import "package:fast_immutable_collections/fast_immutable_collections.dart";
import "package:flutter/material.dart";
import "package:mediboard/activity/enums/priority.dart";
import "package:mediboard/activity/models/lab_test/lab_test.model.dart";
import "package:mediboard/colors/app_colors.dart";
import "package:mediboard/gen/assets.gen.dart";

class LabTestsWidget extends StatelessWidget {
  const LabTestsWidget({required this.labTests, super.key});

  final IList<LabTest> labTests;

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
        leading: Assets.icons.small.labTest.image(),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText(
              "Future Lab Tests",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Container(
              alignment: Alignment.center,
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.labTest,
              ),
              child: AutoSizeText("${labTests.length}"),
            ),
          ],
        ),
        children: [
          for (final LabTest(
                :conductedAt,
                :description,
                :priority,
                :referredBy,
                :timeConducted,
              ) in labTests) ...[
            const Divider(),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: priority.color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: AutoSizeText(
                    priority.name,
                    style: DefaultTextStyle.of(context).style.copyWith(
                          fontWeight: FontWeight.w600,
                          color: priority.color,
                        ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: AutoSizeText(
                  description,
                  style: Theme.of(context).textTheme.titleMedium,
                  maxLines: 2,
                ),
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
                        text: "Conducted at ",
                        style: DefaultTextStyle.of(context).style,
                      ),
                      TextSpan(
                        text: "$timeConducted, ",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      TextSpan(
                        text: conductedAt,
                        style: DefaultTextStyle.of(context).style,
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
                    "Referred By",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.blueGrey,
                        ),
                  ),
                  const Spacer(),
                  AutoSizeText(referredBy),
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
