import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:admin/src/features/admin_user_management/presentation/providers/manage_users_provider.dart';

class UsersView extends ConsumerStatefulWidget {
  const UsersView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UsersViewState();
}

class _UsersViewState extends ConsumerState<UsersView> {
  @override
  Widget build(BuildContext context) {
    final tabs = ref.watch(manageUserAccountTabsProvider);
    final currentIndex = ref.watch(manageUserAccountProvider);

    return ScaffoldPage(
      padding: const EdgeInsets.all(0),
      content: TabView(
        tabs: tabs,
        currentIndex: currentIndex,
        onChanged: (index) =>
            ref.read(manageUserAccountProvider.notifier).increment(index),
        tabWidthBehavior: TabWidthBehavior.equal,
        closeButtonVisibility: CloseButtonVisibilityMode.onHover,
        showScrollButtons: true,
      ),
    );
  }
}
