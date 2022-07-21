import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appRouterProvider =
    ChangeNotifierProvider.autoDispose.family<AppRouter, Key>(
  (ref, key) {
    return AppRouter(
      key,
    );
  },
);

class AppRouter extends ChangeNotifier {
  AppRouter(
    this._key,
  );

  final Key _key;
  List<Page> stack = [];

  void push(Widget widget) {
    stack = List.of(stack)..add(MaterialPage(child: widget));
    notifyListeners();
  }

  void pop() {
    stack = List.of(stack)..removeLast();
    notifyListeners();
  }
}
