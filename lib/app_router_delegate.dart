import 'package:app_router_sample/app_router.dart';
import 'package:flutter/material.dart';

// 今回の実装では AppRouterDelegate がリビルドされる可能性があるためグローバルに宣言
final _navigatorKey = GlobalKey<NavigatorState>();

class AppRouterDelegate extends RouterDelegate<Empty>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<Empty> {
  AppRouterDelegate(
    this._stack,
    this._appRouter,
  );

  @override
  final GlobalKey<NavigatorState>? navigatorKey = _navigatorKey;
  final List<Page> _stack;
  final AppRouter _appRouter;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: _stack,
      onPopPage: (route, result) {
        _appRouter.pop();
        return route.didPop(result);
      },
    );
  }

  @override
  Future<void> setNewRoutePath(Empty configuration) async {}
}

class Empty {}
