import 'package:app_router_sample/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Sample2View extends HookWidget {
  const Sample2View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample2View'),
      ),
      body: Container(
        color: Colors.green,
        child: Center(
          child: TextButton(
            onPressed: () {
              context.read(appRouterProvider.notifier).pop();
            },
            child: const Text('Sample2View'),
          ),
        ),
      ),
    );
  }
}
