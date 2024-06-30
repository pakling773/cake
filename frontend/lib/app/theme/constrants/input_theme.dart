import 'package:control_style/control_style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:frontend/app/theme/constrants/colors.dart';

const baseBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide(
    color: AppColors.gray,
    width: 1,
  ),
);

InputDecorationTheme inputTheme = InputDecorationTheme(
  filled: true,
  fillColor: Colors.white,
  isDense: true,
  // isCollapsed: true,
  contentPadding:
      const EdgeInsets.symmetric(horizontal: 15, vertical: kIsWeb ? 12 : 8),
  hintStyle: ThemeData().textTheme.bodyMedium!.copyWith(
        color: AppColors.gray,
        fontWeight: FontWeight.w500,
        height: 21 / 14,
      ),
  border: baseBorder,
  hoverColor: Colors.white,
  errorMaxLines: 3,
  errorStyle: ThemeData().textTheme.bodyMedium!.copyWith(
        fontSize: 12,
        color: AppColors.red,
        fontWeight: FontWeight.w600,
        height: 21 / 12,
      ),
  focusedBorder: DecoratedInputBorder(
    shadow: const [
      BoxShadow(
        color: Color(0x19000000),
        blurRadius: 10,
      )
    ],
    child: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(
        color: AppColors.orange,
        width: 1.0,
      ),
    ),
  ),
  focusedErrorBorder: DecoratedInputBorder(
    shadow: [
      BoxShadow(
        color: AppColors.orange.withAlpha(20),
        blurRadius: 10,
      )
    ],
    child: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(
        color: AppColors.orange,
        width: 1.0,
      ),
    ),
  ),
  enabledBorder: baseBorder,
  errorBorder: baseBorder.copyWith(
    borderSide: const BorderSide(
      color: AppColors.gray,
      width: 1,
    ),
  ),
  disabledBorder: baseBorder.copyWith(
    borderSide: const BorderSide(
      color: AppColors.gray,
      width: 1,
    ),
  ),
);
