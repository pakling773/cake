import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/app/common/helpers.dart';

class MutationState<ReturnType> {
  final bool isTriggered;
  final AsyncValue<ReturnType>? result;

  MutationState({required this.isTriggered, required this.result});
}

class Mutation<ReturnType> {
  final FutureOr<void> Function() mutate;
  final MutationState<ReturnType> state;

  Mutation(this.mutate, this.state);
}

Mutation<ReturnType> useMutation<ReturnType>(
  FutureOr<ReturnType> Function() mutation, {
  void Function(ReturnType result)? onSuccess,
  void Function(dynamic error)? onError,
}) {
  return use(_MutationHook<ReturnType>(mutation,
      onSuccess: onSuccess, onError: onError));
}

class _MutationHook<ReturnType> extends Hook<Mutation<ReturnType>> {
  final FutureOr<ReturnType> Function() mutationFn;
  final void Function(ReturnType result)? onSuccess;
  final void Function(dynamic error)? onError;

  const _MutationHook(
    this.mutationFn, {
    this.onSuccess,
    this.onError,
  });

  @override
  _MutationHookState<ReturnType> createState() => _MutationHookState();
}

class _MutationHookState<ReturnType>
    extends HookState<Mutation<ReturnType>, _MutationHook<ReturnType>> {
  late AsyncValue<ReturnType>? result;

  late bool isTriggered;

  @override
  void initHook() {
    super.initHook();

    isTriggered = false;
    result = null;
  }

  FutureOr<void> mutate() async {
    setState(() {
      isTriggered = true;
      result = const AsyncValue.loading();
    });

    final guarded = await AsyncValue.guard(() async => await hook.mutationFn());

    setState(() {
      result = guarded;
    });

    if (guarded is AsyncData) {
      hook.onSuccess?.call(guarded.requireValue);
    } else if (guarded is AsyncError) {
      logger.e(guarded.error);
      hook.onError?.call(guarded.error);
    }
  }

  @override
  Mutation<ReturnType> build(BuildContext context) {
    return Mutation(mutate,
        MutationState<ReturnType>(isTriggered: isTriggered, result: result));
  }
}
