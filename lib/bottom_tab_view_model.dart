import 'package:app_router_sample/master_app_router.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final bottomTabViewModelProvider =
    ChangeNotifierProvider.autoDispose<BottomTabViewModel>(
  (ref) {
    return BottomTabViewModel(
      ref.read,
    );
  },
);

class BottomTabViewModel extends ChangeNotifier {
  BottomTabViewModel(
    this._reader,
  );

  final Reader _reader;

  int selected = 0;

  void tapped(int index) {
    if (selected == index) {
      _reader(masterAppRouterProvider).popToRoot();
    } else {
      selected = index;
      notifyListeners();
    }
  }

  void pop() {
    // pop処理
  }
}
