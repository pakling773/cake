import 'package:flutter/material.dart';
import 'package:frontend/app/common/common_button.dart';
import 'package:frontend/app/theme/constrants/colors.dart';

class CustomAlertPopup extends StatelessWidget {
  const CustomAlertPopup({
    Key? key,
    required this.title,
    required this.content,
    this.cancelLabel,
    this.confirmLabel,
    this.onCancel,
    this.onConfirm,
    this.customContent,
    this.cancelTextStyle,
    this.confirmTextStyle,
    this.contentTextAlign,
  }) : super(key: key);

  final String title;
  final String content;
  final String? cancelLabel;
  final String? confirmLabel;
  final VoidCallback? onCancel;
  final VoidCallback? onConfirm;
  final Widget? customContent;

  final TextStyle? cancelTextStyle;
  final TextStyle? confirmTextStyle;
  final TextAlign? contentTextAlign;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(15),
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15)
            .copyWith(top: 20),
        constraints: const BoxConstraints(maxWidth: 360),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            12,
          ),
          border: Border.all(color: AppColors.black),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w700,
                height: 21 / 18,
                letterSpacing: -0.18,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            if (customContent == null)
              Text(
                content,
                textAlign: contentTextAlign ?? TextAlign.center,
                style: textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  height: 21 / 14,
                ),
              ),
            if (customContent != null) customContent!,
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: CommonButton.outline(
                      onPressed: onCancel ??
                          () {
                            Navigator.of(context).pop();
                          },
                      border: const BorderSide(color: Color(0xFFD3D2CE)),
                      text: cancelLabel ?? 'Close',
                      textStyle: cancelTextStyle ??
                          textTheme.bodyLarge!.copyWith(
                            fontSize: 16,
                            height: 22 / 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.32,
                          ),
                    ),
                  ),
                ),
                if ((cancelLabel != null && cancelLabel!.isNotEmpty) &&
                    (confirmLabel != null && confirmLabel!.isNotEmpty))
                  const SizedBox(
                    width: 10,
                  ),
                if (confirmLabel != null && confirmLabel!.isNotEmpty)
                  Expanded(
                    child: Container(
                      height: 40,
                      child: ElevatedButton(
                        onPressed: onConfirm,
                        child: Text(
                          confirmLabel!,
                          style: confirmTextStyle ??
                              textTheme.bodyLarge!.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                height: 20 / 16,
                              ),
                        ),
                      ),
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }

  static Future<T?> show<T>({
    required BuildContext context,
    Key? key,
    required String title,
    required String content,
    String? cancelLabel,
    String? confirmLabel,
    Widget? customContent,
    TextAlign? contentTextAlign,
    VoidCallback? onCancel,
    VoidCallback? onConfirm,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return CustomAlertPopup(
          key: key,
          title: title,
          content: content,
          cancelLabel: cancelLabel,
          confirmLabel: confirmLabel,
          customContent: customContent,
          contentTextAlign: contentTextAlign,
          onCancel: onCancel,
          onConfirm: onConfirm,
        );
      },
    );
  }
}
