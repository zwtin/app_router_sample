import 'package:app_router_sample/master_app_router.dart';
import 'package:app_router_sample/sample2_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Tab2View extends HookWidget {
  const Tab2View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tab2View'),
      ),
      body: Container(
        color: Colors.lightGreen,
        child: Center(
          child: TextButton(
            onPressed: () {
              context.read(masterAppRouterProvider).push(const Sample2View());
            },
            child: const Text('Tab2View'),
          ),
        ),
      ),
    );
  }
}
