import "package:auto_size_text/auto_size_text.dart";
import "package:dots_indicator/dots_indicator.dart";
import "package:fast_immutable_collections/fast_immutable_collections.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:mediboard/colors/app_colors.dart";
import "package:mediboard/tracking_measure/bloc/tracking_measure_bloc.dart";
import "package:mediboard/tracking_measure/enums/measure_status.dart";
import "package:mediboard/tracking_measure/enums/tracking_measure_tech.dart";
import "package:mediboard/tracking_measure/model/tracking_measure.model.dart";

class TrackingMeasures extends HookWidget {
  const TrackingMeasures({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController(viewportFraction: 0.9);

    final currentPage = useState<int>(0);

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            Row(
              children: [
                const SizedBox(width: 4),
                AutoSizeText(
                  "Tracking Measures",
                  style: Theme.of(context).textTheme.titleMedium,
                  maxLines: 1,
                ),
                const Spacer(),
                BlocSelector<TrackingMeasureBloc, TrackingMeasureState, int>(
                  selector: (trackingMeasureState) {
                    return trackingMeasureState.trackingMeasures.length;
                  },
                  builder: (context, length) {
                    return AutoSizeText(
                      "See All $length",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: AppColors.blueGrey,
                          ),
                      maxLines: 1,
                    );
                  },
                ),
                const Icon(Icons.chevron_right, color: AppColors.blueGrey),
              ],
            ),
            BlocSelector<TrackingMeasureBloc, TrackingMeasureState,
                IList<TrackingMeasure>>(
              selector: (trackingMeasureState) {
                return trackingMeasureState.trackingMeasures;
              },
              builder: (context, trackingMeasures) {
                return SizedBox(
                  height: 192,
                  child: PageView.builder(
                    itemCount: trackingMeasures.length,
                    padEnds: false,
                    controller: pageController,
                    onPageChanged: (value) => currentPage.value = value,
                    itemBuilder: (context, index) {
                      final trackingMeasure = trackingMeasures.elementAt(index);
                      return switch (trackingMeasure) {
                        B12(
                          :final date,
                          :final value,
                          :final unit,
                          :final status,
                          :final lastTestResult,
                        ) =>
                          Card(
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
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
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
                                          "B12",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                        const Spacer(),
                                        AutoSizeText(
                                          "$value $unit",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                color: status.color,
                                              ),
                                        ),
                                        const SizedBox(width: 8),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color:
                                                status.color.withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(
                                              50,
                                            ),
                                          ),
                                          child: AutoSizeText(
                                            status.name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall
                                                ?.copyWith(
                                                  color: status.color,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    height: 2,
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      // TODO(Nana-Kwame-bot): Work on this later.
                                      gradient: const LinearGradient(
                                        colors: [
                                          AppColors.sliderDanger,
                                          Colors.green,
                                          AppColors.sliderDanger,
                                        ],
                                      ),
                                    ),
                                    width: 200,
                                    child: SliderTheme(
                                      data: SliderThemeData(
                                        overlayShape:
                                            SliderComponentShape.noOverlay,
                                      ),
                                      child: CupertinoSlider(
                                        // you have to transparent colors to show gradient colors
                                        activeColor: Colors.transparent,
                                        // inactiveColor: Colors.transparent,
                                        max: 1300,
                                        value: 150,
                                        onChanged: (value) {},
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: AutoSizeText(
                                      "Last test result: $lastTestResult",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            color: AppColors.blueGrey,
                                          ),
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        Bpm(
                          :final date,
                          :final value,
                          :final name,
                          :final status,
                          :final tech,
                          :final records,
                        ) =>
                          Card(
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
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
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
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                        const Spacer(),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color:
                                                status.color.withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(
                                              50,
                                            ),
                                          ),
                                          child: AutoSizeText(
                                            status.name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall
                                                ?.copyWith(
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
                                          style: DefaultTextStyle.of(context)
                                              .style
                                              .copyWith(
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
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                color: AppColors.blueGrey,
                                              ),
                                        ),
                                        const Spacer(),
                                        AutoSizeText(
                                          records,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
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
                          ),
                      };
                    },
                  ),
                );
              },
            ),
            DotsIndicator(
              dotsCount: 5,
              position: currentPage.value,
              decorator: const DotsDecorator(activeColor: AppColors.eclipse),
            ),
          ],
        ),
      ),
    );
  }
}
