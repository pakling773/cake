import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum CommonButtonStyle { primary, secondary, outline, text }

class CommonButton extends StatelessWidget {
  final String text;
  final bool enabled;
  final CommonButtonStyle style;
  final TextStyle? textStyle;
  final Widget? prefix;
  final Widget? suffix;
  final void Function()? onPressed;
  final List<BoxShadow>? boxShadow;
  final BorderSide? border;

  const CommonButton({
    super.key,
    required this.text,
    required this.enabled,
    required this.style,
    this.textStyle,
    this.prefix,
    this.suffix,
    this.onPressed,
    this.boxShadow,
    this.border,
  });

  const CommonButton.primary({
    super.key,
    required this.text,
    this.enabled = true,
    this.textStyle,
    this.prefix,
    this.suffix,
    this.onPressed,
    this.boxShadow,
    this.border,
  }) : style = CommonButtonStyle.primary;

  const CommonButton.secondary({
    super.key,
    required this.text,
    this.enabled = true,
    this.textStyle,
    this.prefix,
    this.suffix,
    this.onPressed,
    this.boxShadow,
    this.border,
  }) : style = CommonButtonStyle.secondary;

  const CommonButton.outline({
    super.key,
    required this.text,
    this.enabled = true,
    this.textStyle,
    this.prefix,
    this.suffix,
    this.onPressed,
    this.boxShadow,
    this.border,
  }) : style = CommonButtonStyle.outline;

  const CommonButton.text({
    super.key,
    required this.text,
    this.enabled = true,
    this.textStyle,
    this.prefix,
    this.suffix,
    this.onPressed,
    this.boxShadow,
    this.border,
  }) : style = CommonButtonStyle.text;

  @override
  Widget build(BuildContext context) {
    return buildButton(context);
  }

  Widget buildButton(BuildContext context) {
    switch (style) {
      case CommonButtonStyle.primary:
        return buildElevatedButton(
          context,
        );
      case CommonButtonStyle.secondary:
        return buildElevatedButton(
          context,
          backgroundColor: Colors.white,
          textStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
            fontFamily: 'Avenir',
          ),
        );
      case CommonButtonStyle.outline:
        return buildOutlineButton(context, textStyle: textStyle);
      case CommonButtonStyle.text:
        return buildTextButton(context);
    }
  }

  Widget buildElevatedButton(
    BuildContext context, {
    Color? backgroundColor,
    // Color? textColor,
    TextStyle? textStyle,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      height: 40,
      decoration: BoxDecoration(
        boxShadow: boxShadow,
      ),
      width: double.maxFinite,
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefix != null) ...[
              prefix!,
              const SizedBox(width: 10),
            ],
            Text(
              text,
              style: textStyle ??
                  textTheme.bodyLarge!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    height: 20 / 16,
                  ),
            ),
            if (suffix != null) ...[
              const SizedBox(width: 10),
              suffix!,
            ],
          ],
        ),
      ),
    );
  }

  Widget buildOutlineButton(
    BuildContext context, {
    Color? backgroundColor,
    // Color? textColor,
    TextStyle? textStyle,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      height: 40,
      decoration: BoxDecoration(
        boxShadow: boxShadow,
      ),
      width: double.maxFinite,
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefix != null) ...[
              prefix!,
              const SizedBox(width: 10),
            ],
            Text(
              text,
              style: textStyle ??
                  textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w800,
                    height: 20 / 16,
                  ),
            ),
            if (suffix != null) ...[
              const SizedBox(width: 10),
              suffix!,
            ],
          ],
        ),
      ),
    );
  }

  Widget buildTextButton(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return CupertinoButton(
      minSize: 0,
      onPressed: enabled ? onPressed : null,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (prefix != null) ...[
            prefix!,
            const SizedBox(width: 10),
          ],
          Text(
            text,
            style: textStyle ??
                textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          if (suffix != null) ...[
            const SizedBox(width: 10),
            suffix!,
          ],
        ],
      ),
    );
  }
}
