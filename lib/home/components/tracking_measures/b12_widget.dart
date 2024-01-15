import "package:auto_size_text/auto_size_text.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_custom_clippers/flutter_custom_clippers.dart";
import "package:mediboard/colors/app_colors.dart";
import "package:mediboard/tracking_measure/enums/measure_status.dart";
import "package:mediboard/tracking_measure/model/tracking_measure.model.dart";

class B12Widget extends StatelessWidget {
  const B12Widget({required this.b12, super.key});

  final B12 b12;

  @override
  Widget build(BuildContext context) {
    final B12(:date, :lastTestResult, :status, :unit, :value) = b12;

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
              padding: const EdgeInsets.only(left: 12, top: 12),
              child: AutoSizeText(
                date,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  AutoSizeText(
                    "B12",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Spacer(),
                  AutoSizeText(
                    "$value $unit",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: status.color,
                        ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: status.color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(50),
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
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            left: constraints.maxWidth * (value / 1300) - 28,
                            top: -30,
                            child: ClipPath(
                              clipper: MessageClipper(borderRadius: 6),
                              child: Container(
                                alignment: Alignment.topCenter,
                                padding: const EdgeInsets.fromLTRB(
                                  8,
                                  4,
                                  8,
                                  16,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: AppColors.background,
                                ),
                                child: Text(
                                  "$value $unit",
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Row(
                              children: [
                                Container(
                                  width: constraints.maxWidth * 0.26,
                                  height: 2,
                                  color: AppColors.sliderDanger,
                                ),
                                Container(
                                  width: constraints.maxWidth * 0.48,
                                  height: 2,
                                  color: AppColors.sliderSafe,
                                ),
                                Container(
                                  width: constraints.maxWidth * 0.26,
                                  height: 2,
                                  color: AppColors.sliderDanger,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: SliderTheme(
                              data: SliderThemeData(
                                overlayShape: SliderComponentShape.noOverlay,
                              ),
                              child: CupertinoSlider(
                                divisions: 2,
                                activeColor: Colors.transparent,
                                value: value.toDouble(),
                                max: 1300,
                                onChanged: (value) {},
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: constraints.maxWidth * 0.26,
                          ),
                          SizedBox(
                            width: constraints.maxWidth * 0.48,
                            child: const Text(
                              "200",
                              textAlign: TextAlign.left,
                            ),
                          ),
                          SizedBox(
                            width: constraints.maxWidth * 0.26,
                            child: const Text(
                              "1100",
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: AutoSizeText(
                "Last test result: $lastTestResult",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.blueGrey,
                    ),
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
