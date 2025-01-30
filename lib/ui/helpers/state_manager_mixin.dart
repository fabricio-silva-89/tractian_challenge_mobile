import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum StateEnum {
  initial,
  loading,
  success,
  error,
}

extension FetchStateExtension on StateEnum {
  Widget builder({
    Widget Function()? initial,
    Widget Function()? loading,
    Widget Function()? success,
    Widget Function()? error,
    Widget Function()? initialOrLoading,
    Widget Function()? initialOrSuccess,
    Widget Function()? initialOrError,
  }) {
    assert(
      error != null || initialOrError != null,
      'Add at least one of [initialOrError] and [error]',
    );

    return ({
          StateEnum.initial: initial ?? initialOrLoading,
          StateEnum.loading: loading ?? initialOrLoading,
          StateEnum.success: success ?? initialOrSuccess,
          StateEnum.error: error ?? initialOrError,
        }[this] ??
        (error ?? initialOrError)!)();
  }
}

extension RxFetchStateExtension on Rx<StateEnum> {
  Widget builder({
    Widget Function()? initial,
    Widget Function()? loading,
    Widget Function()? success,
    Widget Function()? error,
    Widget Function()? initialOrLoading,
    Widget Function()? initialOrSuccess,
    Widget Function()? initialOrError,
  }) {
    return Obx(() {
      return value.builder(
        error: error,
        initial: initial,
        loading: loading,
        success: success,
        initialOrLoading: initialOrLoading,
        initialOrSuccess: initialOrSuccess,
        initialOrError: initialOrError,
      );
    });
  }
}

mixin StateManagerControllerMixin on GetxController {
  final _state = Rx<StateEnum>(StateEnum.initial);
  Rx<StateEnum> get state => _state;

  void setInitial() => _state.value = StateEnum.initial;
  void setLoading() => _state.value = StateEnum.loading;
  void setSuccess() => _state.value = StateEnum.success;
  void setError() => _state.value = StateEnum.error;
}

mixin StateManagerViewMixin<T extends StatefulWidget> on State<T> {
  Widget builder(
    StateManagerControllerMixin controller, {
    Widget? initial,
    Widget? loading,
    Widget? success,
    Widget? error,
    Widget? initialOrLoading,
    Widget? initialOrSuccess,
    Widget? initialOrError,
  }) {
    return controller.state.builder(
      initial: initial != null ? () => initial : null,
      loading: loading != null ? () => loading : null,
      success: success != null ? () => success : null,
      error: error != null ? () => error : null,
      initialOrLoading:
          initialOrLoading != null ? () => initialOrLoading : null,
      initialOrSuccess:
          initialOrSuccess != null ? () => initialOrSuccess : null,
      initialOrError: initialOrError != null ? () => initialOrError : null,
    );
  }
}
