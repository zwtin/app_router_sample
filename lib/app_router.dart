import 'package:app_router_sample/sample1_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appRouterProvider =
    StateNotifierProvider.autoDispose<AppRouter, List<Page>>(
  (_) {
    return AppRouter();
  },
);

class AppRouter extends StateNotifier<List<Page>> {
  AppRouter() : super([const MaterialPage(child: Sample1View())]);

  void push(Widget widget) {
    state = List.of(state)..add(MaterialPage(child: widget));
  }

  void pop() {
    state = List.of(state)..removeLast();
  }
}
