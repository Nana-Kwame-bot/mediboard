import "package:auto_size_text/auto_size_text.dart";
import "package:flutter/material.dart";
import "package:mediboard/colors/app_colors.dart";
import "package:mediboard/tracking_measure/enums/measure_status.dart";
import "package:mediboard/tracking_measure/enums/tracking_measure_tech.dart";
import "package:mediboard/tracking_measure/model/tracking_measure.model.dart";

class BPMWidget extends StatelessWidget {
  const BPMWidget({required this.bpm, super.key});

  final Bpm bpm;

  @override
  Widget build(BuildContext context) {
    final Bpm(
      :date,
      :name,
      :records,
      :status,
      :tech,
      :value,
    ) = bpm;

    return Card(
      elevation: 2,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 12,
                top: 12,
              ),
              child: AutoSizeText(
                date,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: Row(
                children: [
                  AutoSizeText(
                    name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: status.color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(
                        50,
                      ),
                    ),
                    child: AutoSizeText(
                      status.name,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: status.color,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Row(
                children: [
                  Text(
                    "$value ",
                    style: DefaultTextStyle.of(context).style.copyWith(
                          fontSize: 22,
                        ),
                  ),
                  const Text(
                    "BPM",
                    style: TextStyle(
                      color: AppColors.blueGrey,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 12,
                top: 4,
                bottom: 12,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 19,
                    height: 19,
                    child: tech.icon,
                  ),
                  const SizedBox(width: 4),
                  AutoSizeText(
                    tech.name,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.blueGrey,
                        ),
                  ),
                  const Spacer(),
                  AutoSizeText(
                    records,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppColors.eclipse,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
