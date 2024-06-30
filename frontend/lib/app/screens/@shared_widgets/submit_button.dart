import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final String button_text;
  final Function? onSubmitClick;

  final bool isLoading;

  const SubmitButton({
    super.key,
    required this.button_text,
    required this.onSubmitClick,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading
          ? null
          : () {
              onSubmitClick?.call();
            },
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.center,
        children: [
          isLoading
              ? const CircularProgressIndicator.adaptive()
              : Text(button_text),
        ],
      ),
    );
  }
}
