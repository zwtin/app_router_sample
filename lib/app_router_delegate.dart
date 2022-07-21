import 'package:app_router_sample/app_router.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final baseKey = GlobalKey<NavigatorState>();
final tab1Key = GlobalKey<NavigatorState>();
final tab2Key = GlobalKey<NavigatorState>();

class AppRouterDelegate extends RouterDelegate<Empty>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<Empty> {
  AppRouterDelegate(
    this.navigatorKey,
    this._reader,
    this._appRouter,
  );

  @override
  final GlobalKey<NavigatorState> navigatorKey;
  final Reader _reader;
  final AppRouter _appRouter;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: _appRouter.stack,
      onPopPage: (route, result) {
        _reader(appRouterProvider(navigatorKey)).pop();
        return route.didPop(result);
      },
    );
  }

  @override
  Future<void> setNewRoutePath(Empty configuration) async {}
}

class Empty {}
