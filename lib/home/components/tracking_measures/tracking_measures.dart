import "package:auto_size_text/auto_size_text.dart";
import "package:dots_indicator/dots_indicator.dart";
import "package:fast_immutable_collections/fast_immutable_collections.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:mediboard/colors/app_colors.dart";
import "package:mediboard/home/components/tracking_measures/b12_widget.dart";
import "package:mediboard/home/components/tracking_measures/bpm_widget.dart";
import "package:mediboard/tracking_measure/bloc/tracking_measure_bloc.dart";
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
                  height: 200,
                  child: PageView.builder(
                    itemCount: trackingMeasures.length,
                    padEnds: false,
                    controller: pageController,
                    onPageChanged: (value) => currentPage.value = value,
                    itemBuilder: (context, index) {
                      final trackingMeasure = trackingMeasures.elementAt(index);
                      return switch (trackingMeasure) {
                        B12() => B12Widget(b12: trackingMeasure),
                        Bpm() => BPMWidget(bpm: trackingMeasure),
                      };
                    },
                  ),
                );
              },
            ),
            BlocSelector<TrackingMeasureBloc, TrackingMeasureState, int>(
              selector: (trackingMeasureState) {
                return trackingMeasureState.trackingMeasures.length;
              },
              builder: (context, length) {
                return DotsIndicator(
                  dotsCount: length == 0 ? 1 : length,
                  position: currentPage.value,
                  decorator: const DotsDecorator(
                    activeColor: AppColors.eclipse,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
