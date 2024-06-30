import 'package:flutter/material.dart';
import 'package:frontend/app/common/string_extenstion.dart';
import 'package:frontend/app/theme/constrants/colors.dart';
import 'package:icons_plus/icons_plus.dart';

class MoodSelector extends StatefulWidget {
  const MoodSelector({super.key, this.onSelect});

  final Function(MapEntry<String, List<String>>? value)? onSelect;

  @override
  State<MoodSelector> createState() => _MoodSelectorState();
}

class _MoodSelectorState extends State<MoodSelector> {
  final mood = {
    "happy": [
      "comfort",
      "alleviation",
      "satisfied",
      "accomplished",
      "dignified",
      "thankful",
      "appreciative",
      "indebted",
      "joy",
      "contentment",
      "pleasure",
      "enthusiastic",
      "eager",
      "thrilled",
      "excited",
      "astonished",
      "amazed"
    ],
    "sad": [
      "isolation",
      "longing",
      "emptiness",
      "fear",
      "dread",
      "apprehension",
      "sorrow",
      "disappointment",
      "unhappiness",
      "worry",
      "nervousness",
      "unease",
      "anxious",
      "uncertainty",
      "bewilderment",
      "perplexity"
    ],
    "calm": [
      "peaceful",
      "relaxed",
      "serene",
      "uninterested",
      "tired",
      "weary",
      "astonished",
      "amazed",
      "caught off guard"
    ],
    "bored": [
      "uninterested",
      "tired",
      "weary",
      "down",
      "dissatisfied",
      "disheartened"
    ],
  };

  final MenuController menuController = MenuController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MenuAnchor(
      controller: menuController,
      builder: (context, controller, child) {
        return IconButton(
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          icon: const Icon(
            BoxIcons.bx_wink_smile,
            color: AppColors.red,
            size: 20,
          ),
        );
      },
      style: MenuStyle(
        padding: WidgetStatePropertyAll(const EdgeInsets.symmetric(
          horizontal: 7,
          vertical: 5,
        ).copyWith(top: 7)),
        backgroundColor: const WidgetStatePropertyAll(AppColors.white),
        elevation: const WidgetStatePropertyAll(10),
        shadowColor: WidgetStatePropertyAll(AppColors.black.withOpacity(0.2)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
      alignmentOffset: Offset.fromDirection(0, -90),
      menuChildren: [
        ...mood.entries.expand(
          (entry) => [
            InkWell(
              onTap: () {
                widget.onSelect!.call(entry);
                if (menuController.isOpen) {
                  menuController.close();
                }
              },
              borderRadius: BorderRadius.circular(5),
              child: Ink(
                width: 120,
                key: ValueKey(entry.key),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ).copyWith(left: 5),
                decoration: BoxDecoration(
                  color: AppColors.gray.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    switch (entry.key) {
                      'happy' => const Icon(
                          BoxIcons.bx_happy,
                          color: AppColors.red,
                          size: 20,
                        ),
                      'sad' => const Icon(
                          BoxIcons.bx_sad,
                          color: AppColors.orange,
                          size: 20,
                        ),
                      'calm' => const Icon(
                          BoxIcons.bx_wink_smile,
                          color: Colors.green,
                          size: 20,
                        ),
                      'bored' => const Icon(
                          BoxIcons.bx_upside_down,
                          color: AppColors.gray,
                          size: 20,
                        ),
                      _ => const Icon(
                          BoxIcons.bx_wink_smile,
                          color: AppColors.gray,
                          size: 20,
                        ),
                    },
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      entry.key.toCapitalize(),
                      style: textTheme.bodyMedium!.copyWith(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        color: AppColors.dark,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            )
          ],
        ),
      ],
    );
  }
}
