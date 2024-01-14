import "package:auto_size_text/auto_size_text.dart";
import "package:dots_indicator/dots_indicator.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:mediboard/colors/app_colors.dart";

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
                AutoSizeText(
                  "See All 15",
                  style: Theme.of(context).textTheme.bodyLarge,
                  maxLines: 1,
                ),
                const Icon(
                  Icons.chevron_right,
                  color: AppColors.blueGrey,
                ),
              ],
            ),
            SizedBox(
              height: 192,
              child: PageView.builder(
                padEnds: false,
                controller: pageController,
                onPageChanged: (value) => currentPage.value = value,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: AutoSizeText(
                              "Feb 15, 2023",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          const Divider(),
                          const Row(
                            children: [
                              AutoSizeText("B12"),
                              Spacer(),
                              AutoSizeText("173 pg/ml"),
                              SizedBox(width: 8),
                              AutoSizeText("Off Track"),
                            ],
                          ),
                          const Spacer(),
                          Container(
                            height: 2,
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
                                overlayShape: SliderComponentShape.noOverlay,
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
                          AutoSizeText(
                            "Last test result: 154 pg/ml (90 days ago)",
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: AppColors.blueGrey,
                                    ),
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: 5,
              ),
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
