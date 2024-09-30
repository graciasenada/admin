import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:admin/src/access_control/presentation/widgets/role_assigment/create_team/create_team_content.dart';
import 'package:admin/src/access_control/presentation/widgets/role_assigment/main_view/main_view_content.dart';

class CreateTabsNotifier extends StateNotifier<List<Tab>> {
  CreateTabsNotifier()
      : super([
          Tab(
            icon: const Icon(FluentIcons.view_dashboard),
            text: const Text("Main View"),
            body: const MainViewContent(),
            closeIcon: null,
            onClosed: null,
          )
        ]);

  void addTab(Tab tab) {
    state.add(tab);
  }

  void removeTab(int index) {
    state.removeAt(index);
  }
}

final createTeamTabsProvider =
    StateNotifierProvider<CreateTabsNotifier, List<Tab>>((ref) {
  return CreateTabsNotifier();
});

class CreateTeamNotifier extends StateNotifier<int> {
  StateNotifierProviderRef<CreateTeamNotifier, int> ref;
  CreateTeamNotifier(this.ref) : super(0);

  void increment(int index) {
    state = index;
  }

  void generateTab(int index) {
    Tab tab = Tab(
      text: Text('Document $index'),
      semanticLabel: 'Document #$index',
      icon: const FlutterLogo(),
      body: const CreateTeamContent(),
      onClosed: onClosed,
    );

    ref.read(createTeamTabsProvider.notifier).addTab(tab);
  }

  void onClosed() {
    ref.read(createTeamTabsProvider.notifier).removeTab(state);
    state = 0;
  }
}

final createTeamProvider = StateNotifierProvider<CreateTeamNotifier, int>(
  (ref) => CreateTeamNotifier(ref),
);
