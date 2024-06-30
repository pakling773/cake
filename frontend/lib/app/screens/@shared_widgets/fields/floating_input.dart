import 'package:control_style/control_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/app/theme/constrants/colors.dart';
import 'package:reactive_forms/reactive_forms.dart';

enum InputMode { text, digit, email, password, textarea }

class FloatingInput extends StatefulWidget {
  final String formControlName;
  final String label;
  final Map<String, String Function(Object)>? validationMessages;
  final InputMode? inputType;
  final bool readOnly;
  final int? maxLines;
  final bool enable;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? prefix;
  final Function(FormControl<Object?>)? onTap;
  final EdgeInsetsGeometry? contentPadding;
  final BoxConstraints? prefixIconConstraints;
  final int? maxLength;
  final FocusNode? focusNode;
  final ShowErrorsFunction? showErrors;
  final TextEditingController? controller;
  final void Function(FormControl<Object?>)? onSubmitted;

  const FloatingInput({
    super.key,
    required this.formControlName,
    required this.label,
    this.validationMessages,
    this.inputType = InputMode.text,
    this.readOnly = false,
    this.enable = true,
    this.maxLines = 1,
    this.maxLength,
    this.suffixIcon,
    this.prefixIcon,
    this.prefix,
    this.onTap,
    this.focusNode,
    this.contentPadding,
    this.prefixIconConstraints,
    this.showErrors,
    this.controller,
    this.onSubmitted,
  });

  @override
  State<FloatingInput> createState() => _FloatingInputState();
}

/// see [InputDecorator] constants
const double _kFinalLabelScale = 0.75;

// FocusNode is disabled
// by using floatingLabelStyle
// we don't have to observe focus state for font size
class _FloatingInputState extends State<FloatingInput> {
  late bool _obscureText = false;
  late FocusNode _focusNode;
  bool isInputFocus = false;
  late TextEditingController myController;

  @override
  void initState() {
    _obscureText = widget.inputType == InputMode.password ? true : false;
    if (widget.focusNode != null) {
      _focusNode = widget.focusNode!;
    } else {
      _focusNode = FocusNode();
    }

    if (widget.controller != null) {
      myController = widget.controller!;
    } else {
      myController = TextEditingController();
    }
    _focusNode.addListener(_onFocusChange);

    super.initState();
  }

  void _onFocusChange() {
    if (_focusNode.hasFocus) {
      setState(() {
        isInputFocus = true;
      });
    } else {
      setState(() {
        isInputFocus = false;
      });
    }
  }

  void _togglePassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void dispose() {
    // _focusNode.dispose();
    myController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return ReactiveFormConsumer(
      builder: (context, form, _) {
        // bool isMaxLengthExceed = form
        //         .control(widget.formControlName)
        //         .hasError(ValidationMessage.maxLength) ||
        //     // show message if exacly the same as max length
        //     (widget.maxLength != null &&
        //         myController.text.length >= widget.maxLength!);

        // String? errorMessage = widget
        //     .validationMessage?[ValidationMessage.maxLength]
        //     ?.call(ValidationMessage.maxLength);
        final bool disabled = form.control(widget.formControlName).disabled;

        return Stack(
          alignment: Alignment.bottomRight,
          children: [
            ReactiveTextField(
              controller: myController,
              maxLength: widget.maxLength,
              onSubmitted: widget.onSubmitted,
              keyboardType: widget.inputType == InputMode.email
                  ? TextInputType.emailAddress
                  : widget.inputType == InputMode.digit
                      ? TextInputType.number
                      : TextInputType.text,
              key: widget.key,
              focusNode: _focusNode,
              onTap: widget.onTap,
              maxLines: widget.maxLines,
              canRequestFocus: !widget.readOnly,
              formControlName: widget.formControlName,
              enableInteractiveSelection: true,
              readOnly: widget.readOnly,
              validationMessages: widget.validationMessages,
              style: textTheme.bodyMedium!.copyWith(
                color: disabled ? AppColors.gray : AppColors.black,
                fontWeight: FontWeight.w600,
                height: 21 / 14,
              ),
              inputFormatters: [
                if (widget.inputType == InputMode.digit)
                  FilteringTextInputFormatter.digitsOnly,
              ],
              obscureText: _obscureText,
              decoration: _getInputDecoration(context, textTheme),
              showErrors: widget.showErrors,
              // showErrors:
              //     isMaxLengthExceed ? (control) => false : widget.showErrors,
            ),
            // if (isMaxLengthExceed)
            //   Positioned(
            //     bottom: 2,
            //     right: 60,
            //     child: Text(
            //       errorMessage ?? '',
            //       textAlign: TextAlign.end,
            //       style: const TextStyle(
            //         fontSize: 12.0,
            //         fontWeight: FontWeight.w500,
            //         color: AppColors.kRed,
            //       ),
            //     ),
            //   ),
          ],
        );
      },
    );
  }

  InputDecoration _getInputDecoration(
      BuildContext context, TextTheme textTheme) {
    final form = ReactiveForm.of(context) as FormGroup;
    final bool disabled = form.control(widget.formControlName).disabled;

    final (suffixIcon, _) = switch (widget.inputType) {
      InputMode.password => (
          InkWell(
            onTap: _togglePassword,
            child: Container(
              margin: const EdgeInsets.only(right: 15),
              child: _obscureText
                  ? SvgPicture.asset(
                      'assets/icons/eye_off.svg',
                    )
                  : SvgPicture.asset(
                      'assets/icons/eye.svg',
                    ),
            ),
          ),
          const BoxConstraints(
            maxHeight: 20,
          )
        ),
      _ => (null, null),
    };
    return InputDecoration(
      alignLabelWithHint: true,
      enabled: widget.enable,
      suffixIcon: widget.suffixIcon ?? suffixIcon,
      prefixIcon: widget.prefixIcon,
      prefix: widget.prefix,
      filled: true,
      fillColor: disabled ? const Color(0xFFFBFBFB) : Colors.white,
      counterStyle: textTheme.bodyMedium!.copyWith(
        color: AppColors.black,
        fontWeight: FontWeight.w600,
        fontSize: 12.0,
        height: 22.0 / 12.0,
      ),
      suffixIconConstraints: const BoxConstraints(maxHeight: 20),
      prefixIconConstraints: widget.prefixIconConstraints,
      contentPadding: widget.contentPadding,
      floatingLabelStyle: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 12.0 / _kFinalLabelScale,
        fontWeight: FontWeight.w700,
        color: disabled ? AppColors.gray : AppColors.black,
        height: 14.0 / 12.0,
      ),
      labelStyle: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        color: disabled ? AppColors.gray : AppColors.black,
        height: 21.0 / 14.0,
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
      label: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '${widget.label} ',
            ),
            if (widget.validationMessages != null &&
                widget.validationMessages!
                    .containsKey(ValidationMessage.required))
              TextSpan(
                text: '*',
                style: isInputFocus || myController.text != ''
                    ? const TextStyle(color: AppColors.red)
                    : null,
              )
          ],
        ),
      ),
      errorStyle: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 12.0,
        height: 0,
        fontWeight: FontWeight.w400,
        color: AppColors.red,
      ),
    );
  }
}
