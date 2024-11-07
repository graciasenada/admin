import 'package:fluent_ui/fluent_ui.dart';

import 'package:admin/src/access_control/presentation/screens/authentication_tab_view.dart';

class UserManagementPage extends StatefulWidget {
  const UserManagementPage({super.key});

  @override
  State<UserManagementPage> createState() => UserManagementState();
}

class UserManagementState extends State<UserManagementPage> {
  int currentIndex = 0;
  List<Tab> tabs = [
    Tab(
        icon: const Icon(FluentIcons.edit_list_pencil),
        text: const Text("Account Lifecycle"),
        body: const Text("data")),
    Tab(
        icon: const Icon(FluentIcons.contact_card),
        text: const Text("Authentication"),
        body: const AuthenticationTab()),
  ];

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      padding: const EdgeInsets.all(0),
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
