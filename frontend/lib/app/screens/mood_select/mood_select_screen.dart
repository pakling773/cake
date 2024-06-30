import 'package:flutter/material.dart';
import 'package:frontend/app/common/cake_sizes.dart';
import 'package:frontend/app/common/string_extenstion.dart';
import 'package:frontend/app/providers/mood_select/mood_select_provider.dart';
import 'package:frontend/app/routes/app_routes_enum.dart';
import 'package:frontend/app/screens/@shared_widgets/product_card.dart';
import 'package:frontend/app/screens/mood_select/widgets/mood_selector.dart';
import 'package:frontend/app/theme/constrants/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MoodSelectScreen extends StatefulHookConsumerWidget {
  const MoodSelectScreen({super.key});

  @override
  ConsumerState<MoodSelectScreen> createState() => _MoodSelectScreenState();
}

class _MoodSelectScreenState extends ConsumerState<MoodSelectScreen> {
  MapEntry<String, List<String>>? selectedMood;

  onSelected(MapEntry<String, List<String>>? value) async {
    setState(() {
      selectedMood = value;
    });
    await ref
        .read(moodSelectProvider.notifier)
        .getCakesByMood(selectedMood?.value ?? []);

    print('Selected mood: $value');
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final cakesState = ref.watch(moodSelectProvider);
    print(cakeSizes);
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        shadowColor: Colors.black.withOpacity(0.2),
        surfaceTintColor: AppColors.white,
        backgroundColor: AppColors.white,
        titleSpacing: 0,
        centerTitle: false,
        title: Text(
          'How are you feeling?',
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    'Select Your Mood: ${selectedMood?.key.toCapitalize() ?? 'None'}'),
                const SizedBox(
                  width: 15,
                ),
                MoodSelector(
                  onSelect: (value) => onSelected(value),
                ),
              ],
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              backgroundColor: AppColors.white,
              onRefresh: () async {
                if (selectedMood != null) {
                  await ref
                      .read(moodSelectProvider.notifier)
                      .getCakesByMood(selectedMood?.value ?? []);
                }
              },
              child: cakesState.when(
                data: (cakes) {
                  return cakes != null && cakes.isNotEmpty
                      ? GridView.builder(
                          padding:
                              const EdgeInsets.all(20).copyWith(bottom: 30),
                          itemCount: cakes.length,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            childAspectRatio: 0.7,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            print(cakes[index]);
                            return ProductCard(
                              item: cakes[index],
                              onTap: () {
                                context.pushNamed(
                                  AppRouterEnum.detail.name,
                                );
                              },
                            );
                          },
                        )
                      : const Center(
                          child:
                              Text('No Cakes Found Please Select Your Mood!'),
                        );
                },
                error: (error, stackTrace) => const Center(
                  child: Text('Failed to get cakes!'),
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
