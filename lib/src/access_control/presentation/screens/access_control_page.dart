import 'package:fluent_ui/fluent_ui.dart';

import 'package:admin/src/access_control/presentation/widgets/role_assigment/main_view.dart';
import 'package:admin/src/access_control/presentation/widgets/roles/roles_subtabs.dart';

class AccessControlPage extends StatefulWidget {
  const AccessControlPage({super.key});

  @override
  State<AccessControlPage> createState() => _AccessControlPageState();
}

class _AccessControlPageState extends State<AccessControlPage> {
  int currentIndex = 0;
  List<Tab> tabs = [
    Tab(
        icon: const Icon(FluentIcons.edit_list_pencil),
        text: const Text("Role Assignment"),
        body: const MainView()),
    Tab(
        icon: const Icon(FluentIcons.contact_card),
        text: const Text("Roles"),
        body: const RolesSubTabs()),
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
