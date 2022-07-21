import 'package:app_router_sample/app_router.dart';
import 'package:app_router_sample/sample1_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Tab1View extends HookWidget {
  const Tab1View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      context.read(appRouterProvider(presentKey)).push(const Sample1View());
    }, const []);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tab1View'),
      ),
      body: Container(
        color: Colors.green,
        child: Center(
          child: TextButton(
            onPressed: () {
              context
                  .read(appRouterProvider(tab1Key))
                  .push(const Sample1View());
            },
            child: const Text('Tab1View'),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context, rootNavigator: true).push(
            MaterialPageRoute<Widget>(
              builder: (_context) {
                // return Router(
                //   routerDelegate: AppRouterDelegate(
                //     presentKey,
                //     context.read,
                //     useProvider(appRouterProvider(presentKey)),
                //   ),
                // );
                return const Sample1View();
              },
              fullscreenDialog: true,
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
