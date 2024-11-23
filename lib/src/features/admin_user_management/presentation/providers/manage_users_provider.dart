import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../screens/user_manage_view.dart';
import '../widgets/users_table.dart';

class ManageUserAccountTabsNotifier extends StateNotifier<List<Tab>> {
  ManageUserAccountTabsNotifier()
      : super([
          Tab(
            icon: const Icon(FluentIcons.user_followed),
            text: const Text("Users"),
            body: const UserTable([]),
            closeIcon: null,
            onClosed: null,
          )
        ]);

  void addTab(Tab tab) {
    state = [...state, tab];
  }

  void removeTab(int index) {
    state = List.from(state)..removeAt(index);
  }
}

final manageUserAccountTabsProvider =
    StateNotifierProvider<ManageUserAccountTabsNotifier, List<Tab>>((ref) {
  return ManageUserAccountTabsNotifier();
});

class ManageUserAccountNotifier extends StateNotifier<int> {
  ManageUserAccountNotifier(this.ref) : super(0);

  final Ref ref;

  void increment(int index) {
    state = index;
  }

  void generateTab() {
    final tab = Tab(
      text: const Text('Manage User Account'),
      icon: const Icon(FluentIcons.user_window),
      body: UserManageView(),
      onClosed: () => onClosed(),
    );

    state = 1;
  }

  void onClosed() {
    state = 0;
  }
}

final manageUserAccountProvider =
    StateNotifierProvider<ManageUserAccountNotifier, int>(
  (ref) => ManageUserAccountNotifier(ref),
);
