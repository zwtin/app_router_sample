import 'package:app_router_sample/app_router.dart';
import 'package:app_router_sample/sample2_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Sample1View extends HookWidget {
  const Sample1View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample1View'),
      ),
      body: Container(
        color: Colors.red,
        child: Center(
          child: TextButton(
            onPressed: () {
              context
                  .read(appRouterProvider.notifier)
                  .push(const Sample2View());
            },
            child: const Text('Sample1View'),
          ),
        ),
      ),
    );
  }
}
