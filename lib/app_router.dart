import 'package:app_router_sample/sample1_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appRouterProvider = ChangeNotifierProvider.autoDispose(
  (_) {
    return AppRouter();
  },
);

class AppRouter extends ChangeNotifier {
  final List<Page> _stack = [
    const MaterialPage(child: Sample1View()),
  ];

  List<Page> get stack => _stack;

  void push(Widget widget) {
    _stack.add(MaterialPage(child: widget));
    notifyListeners();
  }

  void pop() {
    _stack.removeLast();
    notifyListeners();
  }
}
