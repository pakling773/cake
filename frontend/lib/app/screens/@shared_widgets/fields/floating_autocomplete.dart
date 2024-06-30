import 'package:control_style/control_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/app/common/type_extenstion.dart';
import 'package:frontend/app/theme/constrants/colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:pinput/pinput.dart';

class FloatingAutocompleteStateArgs {
  final bool isInputFocus;
  final bool isDirty;

  const FloatingAutocompleteStateArgs({
    required this.isInputFocus,
    required this.isDirty,
  });
}

class FloatingAutocomplete<T extends Object> extends ConsumerStatefulWidget {
  const FloatingAutocomplete({
    super.key,
    // required this.items,
    required this.selection,
    required this.optionsBuilder,
    this.optionsScrollviewBuilder,
    this.getOptionLabel,
    this.onItemSelected,
    this.onValueSubmitted,
    this.label,
    this.required = false,
    this.validator,
    this.style,
    this.labelStyle,
    this.onChanged,
  });

  final String? label;
  final bool required;
  final T? selection;
  final void Function(T item)? onItemSelected;
  final void Function(String value)? onValueSubmitted;
  final Iterable<T> Function(
    String value,
    FloatingAutocompleteStateArgs state,
  ) optionsBuilder;
  final Widget Function(BuildContext context, void Function(T item) onSelected,
      Iterable<T> options)? optionsScrollviewBuilder;
  final String Function(T item)? getOptionLabel;
  final String? Function(String?)? validator;
  final TextStyle? style;
  final TextStyle? labelStyle;
  final void Function(String)? onChanged;

  @override
  ConsumerState<FloatingAutocomplete<T>> createState() =>
      _LocationAutocompleteState<T>();
}

class _LocationAutocompleteState<T extends Object>
    extends ConsumerState<FloatingAutocomplete<T>> {
  late FocusNode _focusNode;
  bool isInputFocus = false;
  late TextEditingController _controller;
  bool isDirty = false;

  String get selectionText =>
      widget.selection?.let((item) => widget.getOptionLabel?.call(item)) ?? '';

  @override
  void initState() {
    super.initState();

    _focusNode = FocusNode();

    _controller = TextEditingController(text: selectionText);

    _focusNode.addListener(() {
      setState(() {
        isInputFocus = _focusNode.hasFocus;
      });

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_focusNode.hasFocus) {
          // workaround to show options when refocusing
          _controller
            ..setText('')
            ..setText(selectionText);
        } else {
          _controller.setText(selectionText);
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return RawAutocomplete<Object>(
        focusNode: _focusNode,
        textEditingController: _controller,
        fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
          if (!isDirty) {
            controller.setText(selectionText);
          }
          return TextFormField(
            controller: controller,
            focusNode: focusNode,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
            onChanged: (value) {
              widget.onChanged?.call(value);
              if (!isDirty) {
                setState(() {
                  isDirty = true;
                });
              }
            },
            onFieldSubmitted: (text) {
              if (!isDirty) {
                setState(() {
                  isDirty = true;
                });
              }

              widget.onValueSubmitted?.call(text);

              WidgetsBinding.instance.addPostFrameCallback((_) {
                onFieldSubmitted();
              });
            },
            validator: widget.validator,
            autocorrect: false,
            // ---TODO extract floating input style... all inputs are floating?
            decoration: InputDecoration(
              label: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '${widget.label ?? ''} ',
                    ),
                    if (widget.validator != null && widget.required)
                      TextSpan(
                        text: '*',
                        style: isInputFocus || _controller.text != ''
                            ? const TextStyle(color: AppColors.red)
                            : null,
                      )
                  ],
                ),
              ),

              // hintText: 'Search for a city',

              errorStyle: const TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
                color: AppColors.red,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: AppColors.gray,
                  width: 1,
                ),
              ),

              alignLabelWithHint: true,

              floatingLabelStyle: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12.0 / 0.75,
                fontWeight: FontWeight.w800,
                color: AppColors.black,
                height: 14.0 / 12.0,
              ),
              labelStyle: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
                height: 21.0 / 14.0,
              ),
              focusedBorder: DecoratedInputBorder(
                shadow: const [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 10,
                  ),
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
                    color: AppColors.red.withAlpha(20),
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
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isDirty = false;
                  });
                  if (!_focusNode.hasFocus) {
                    _focusNode.requestFocus();
                  } else {
                    final text = controller.text;
                    // workaround to show options when refocusing
                    controller
                      ..setText('')
                      ..setText(text);
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 16.0),
                  child: (!_focusNode.hasFocus)
                      ? SvgPicture.asset(
                          (!_focusNode.hasFocus)
                              ? 'assets/icons/drop-down-arrow-icon.svg'
                              : 'assets/icons/drop-up-arrow-icon.svg',
                          width: 15,
                          height: 15,
                          fit: BoxFit.contain,
                        )
                      : GestureDetector(
                          onTap: () {
                            controller.clear();
                          },
                          child: const Icon(
                            BoxIcons.bx_x,
                            size: 15,
                          ),
                        ),
                ),
              ),
              suffixIconConstraints: const BoxConstraints(
                maxHeight: 15,
              ),
            ),
          );
        },
        // initialValue: TextEditingValue(text: widget.initialName ?? ''),
        displayStringForOption: (option) {
          if (option is T) return widget.getOptionLabel?.call(option) ?? '';
          return '';
        },
        onSelected: (option) {
          if (option is T) {
            widget.onItemSelected?.call(option);
            _focusNode.unfocus();
          }
        },

        optionsBuilder: (value) => widget.optionsBuilder(
            value.text,
            FloatingAutocompleteStateArgs(
              isInputFocus: isInputFocus,
              isDirty: isDirty,
            )),
        optionsViewBuilder: (context, onSelected, options) {
          return Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: constraints.maxWidth,
              height: 200,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 10,
                    spreadRadius: 0,
                    color: Color.fromRGBO(0, 0, 0, 0.07),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                child: widget.optionsScrollviewBuilder
                    ?.call(context, onSelected, options.cast<T>()),
              ),
            ),
          );
        },
      );
    });
  }
}
