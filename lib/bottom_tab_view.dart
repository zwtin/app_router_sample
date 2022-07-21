import 'package:app_router_sample/app_router.dart';
import 'package:app_router_sample/app_router_delegate.dart';
import 'package:app_router_sample/bottom_tab_view_model.dart';
import 'package:app_router_sample/tab1_view.dart';
import 'package:app_router_sample/tab2_view.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomTabView extends HookWidget {
  const BottomTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = useProvider(bottomTabViewModelProvider);

    final controller = useTabController(initialLength: 2)
      ..index = viewModel.selected;

    useEffect(() {
      context.read(appRouterProvider(tab1Key)).push(const Tab1View());
      context.read(appRouterProvider(tab2Key)).push(const Tab2View());
    }, const []);

    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.black87,
        activeColor: const Color(0xFFFFCC00),
        controller: controller,
        initialActiveIndex: viewModel.selected,
        onTap: context.read(bottomTabViewModelProvider).tapped,
        items: const [
          TabItem<IconData>(
            icon: Icons.home,
            title: 'ホーム',
          ),
          TabItem<IconData>(
            icon: Icons.person,
            title: 'マイページ',
          ),
        ],
      ),
      body: IndexedStack(
        index: viewModel.selected,
        children: <Widget>[
          Router(
            routerDelegate: AppRouterDelegate(
              tab1Key,
              context.read,
              useProvider(appRouterProvider(tab1Key)),
            ),
          ),
          Router(
            routerDelegate: AppRouterDelegate(
              tab2Key,
              context.read,
              useProvider(appRouterProvider(tab2Key)),
            ),
          ),
        ],
      ),
    );
  }
}
