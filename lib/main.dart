import 'package:app_router_sample/app_router.dart';
import 'package:app_router_sample/app_router_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends HookWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return MaterialApp(
      home: Router(
        routerDelegate: AppRouterDelegate(
          useProvider(appRouterProvider),
        ),
      ),
    );
  }
}
