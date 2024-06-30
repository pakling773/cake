import 'package:flutter/material.dart';

extension ContextExtenstion on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}
