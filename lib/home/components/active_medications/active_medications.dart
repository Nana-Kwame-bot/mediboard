import "package:auto_size_text/auto_size_text.dart";
import "package:dots_indicator/dots_indicator.dart";
import "package:fast_immutable_collections/fast_immutable_collections.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:mediboard/colors/app_colors.dart";
import "package:mediboard/gen/assets.gen.dart";
import "package:mediboard/medication/bloc/medication_bloc.dart";
import "package:mediboard/medication/enums/dosing_time.dart";
import "package:mediboard/medication/model/medication.model.dart";

class ActiveMedications extends HookWidget {
  const ActiveMedications({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController(viewportFraction: 0.7);

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
                  "Active medications",
                  style: Theme.of(context).textTheme.titleMedium,
                  maxLines: 1,
                ),
              ],
            ),
            SizedBox(
              height: 196,
              child: BlocSelector<MedicationBloc, MedicationState,
                  IList<Medication>>(
                selector: (medicationState) => medicationState.medications,
                builder: (context, medications) {
                  return PageView.builder(
                    padEnds: false,
                    controller: pageController,
                    onPageChanged: (value) => currentPage.value = value,
                    itemBuilder: (context, index) {
                      final Medication(
                        :dosingTimes,
                        :frequency,
                        :name,
                      ) = medications.elementAt(index);

                      final containsMorning =
                          dosingTimes.contains(DosingTime.morning);

                      final containsAfternoon =
                          dosingTimes.contains(DosingTime.afternoon);

                      final containsEvening =
                          dosingTimes.contains(DosingTime.evening);

                      return Card(
                        elevation: 2,
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                name,
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                                maxLines: 1,
                              ),
                              const SizedBox(height: 4),
                              AutoSizeText(
                                frequency,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: AppColors.blueGrey,
                                    ),
                                maxLines: 1,
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: containsMorning
                                          ? AppColors.dosingTimeBackground
                                          : Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Assets.icons.sunrise.image(),
                                  ),
                                  const SizedBox(width: 16),
                                  Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: containsAfternoon
                                          ? AppColors.dosingTimeBackground
                                          : Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Assets.icons.sun.image(),
                                  ),
                                  const SizedBox(width: 16),
                                  Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: containsEvening
                                          ? AppColors.dosingTimeBackground
                                          : Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Assets.icons.moon.image(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: medications.length,
                  );
                },
              ),
            ),
            BlocSelector<MedicationBloc, MedicationState, int>(
              selector: (medicationState) => medicationState.medications.length,
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
