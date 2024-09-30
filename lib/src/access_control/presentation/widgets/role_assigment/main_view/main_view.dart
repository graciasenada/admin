import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:admin/src/access_control/presentation/providers/create_tabs_provider.dart';

class MainView extends ConsumerStatefulWidget {
  const MainView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainViewState();
}

class _MainViewState extends ConsumerState<MainView> {
  @override
  Widget build(BuildContext context) {
    List<Tab> tabs = ref.watch(createTeamTabsProvider);
    int currentIndex = ref.watch(createTeamProvider);
    return ScaffoldPage(
      padding: const EdgeInsets.all(0),
      content: TabView(
        tabs: tabs,
        currentIndex: currentIndex,
        onChanged: (index) =>
            ref.read(createTeamProvider.notifier).increment(index),
        tabWidthBehavior: TabWidthBehavior.equal,
        closeButtonVisibility: CloseButtonVisibilityMode.onHover,
        showScrollButtons: true,
      ),
    );
  }
}
