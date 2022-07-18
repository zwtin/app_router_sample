import 'package:app_router_sample/app_router.dart';
import 'package:flutter/material.dart';

class AppRouterDelegate extends RouterDelegate<Empty>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<Empty> {
  AppRouterDelegate(
    this._appRouter,
  );

  @override
  final GlobalKey<NavigatorState>? navigatorKey = GlobalKey();
  final AppRouter _appRouter;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: _appRouter.stack,
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
