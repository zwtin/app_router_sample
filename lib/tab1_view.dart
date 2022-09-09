import 'package:app_router_sample/master_app_router.dart';
import 'package:app_router_sample/sample1_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Tab1View extends HookWidget {
  const Tab1View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tab1View'),
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.green,
        child: Center(
          child: TextButton(
            onPressed: () {
              context.read(masterAppRouterProvider).push(const Sample1View());
            },
            child: const Text('Tab1View'),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read(masterAppRouterProvider).present(const Sample1View());
        },
        child: const Icon(Icons.add),
        elevation: 0.0,
      ),
    );
  }
}
