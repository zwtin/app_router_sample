import 'package:app_router_sample/app_router.dart';
import 'package:app_router_sample/bottom_tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final masterAppRouterProvider = Provider.autoDispose<MasterAppRouter>(
  (ref) {
    return MasterAppRouter(ref.read);
  },
);

class MasterAppRouter {
  MasterAppRouter(this._reader);

  final Reader _reader;

  void push(Widget widget) {
    final bottomTabSelected = _reader(bottomTabViewModelProvider).selected;
    if (bottomTabSelected == 0) {
      _reader(appRouterProvider(tab1Key)).push(widget);
    } else if (bottomTabSelected == 1) {
      _reader(appRouterProvider(tab2Key)).push(widget);
    }
  }

  void pop() {
    final bottomTabSelected = _reader(bottomTabViewModelProvider).selected;
    if (bottomTabSelected == 0) {
      _reader(appRouterProvider(tab1Key)).pop();
    } else if (bottomTabSelected == 1) {
      _reader(appRouterProvider(tab2Key)).pop();
    }
  }

  void popToRoot() {
    final bottomTabSelected = _reader(bottomTabViewModelProvider).selected;
    if (bottomTabSelected == 0) {
      _reader(appRouterProvider(tab1Key)).popToRoot();
    } else if (bottomTabSelected == 1) {
      _reader(appRouterProvider(tab2Key)).popToRoot();
    }
  }

  void present(Widget widget) {
    _reader(appRouterProvider(appKey)).present(widget);
  }
}
