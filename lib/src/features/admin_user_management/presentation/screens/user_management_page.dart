import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:admin/src/features/admin_user_management/presentation/widgets/users_view.dart';

class UserManagementPage extends ConsumerStatefulWidget {
  const UserManagementPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UserManagementPageState();
}

class _UserManagementPageState extends ConsumerState<UserManagementPage> {
  int currentIndex = 0;
  final List<Tab> tabs = [
    Tab(
      icon: const Icon(FluentIcons.people),
      text: const Text("Account Lifecycle"),
      body: const UsersView(), // Shows UsersView for Account Lifecycle
    ),
    Tab(
      icon: const Icon(FluentIcons.lock),
      text: const Text("Authentication"),
      body: Placeholder(), // Replace this with actual Authentication content
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      content: TabView(
        tabs: tabs,
        currentIndex: currentIndex,
        onChanged: (index) => setState(() => currentIndex = index),
        tabWidthBehavior: TabWidthBehavior.equal,
        closeButtonVisibility: CloseButtonVisibilityMode.never,
        showScrollButtons: true,
      ),
    );
  }
}
