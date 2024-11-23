import 'package:fluent_ui/fluent_ui.dart';

import 'package:admin/src/features/admin_authentication/presentation/widgets/logo.dart';
import 'package:admin/src/features/admin_dashboard/presentation/screens/dashboard.dart';
import 'package:admin/src/features/admin_user_management/presentation/screens/user_management_page.dart';

class SidePane extends StatefulWidget {
  const SidePane({super.key});

  @override
  State<SidePane> createState() => _SidePaneState();
}

class _SidePaneState extends State<SidePane> {
  int topIndex = 0;

  PaneDisplayMode displayMode = PaneDisplayMode.compact;

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      pane: NavigationPane(
        size: const NavigationPaneSize(openMaxWidth: 300),
        selected: topIndex,
        onChanged: (index) {
          setState(() {
            topIndex = index;
          });
        },
        displayMode: displayMode,
        header: const Padding(
          padding: EdgeInsets.all(2.0),
          child: SizedBox(
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: LogoWidget(height: 25),
                ),
              ],
            ),
          ),
        ),
        items: [
          PaneItem(
            icon: const Icon(FluentIcons.view_dashboard),
            title: const Text('Dashboard'),
            body: const Dashboard(),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.user_window),
            title: const Text('User Management'),
            body: const UserManagementPage(),
          ),
          PaneItem(
              icon: const Icon(FluentIcons.contact_list),
              title: const Text('Access Control List'),
              body: const Center(child: Text("Access Control List Content"))),
          PaneItem(
              icon: const Icon(FluentIcons.compliance_audit),
              title: const Text('Audit Logs'),
              body: const Center(child: Text("Audit Logs Content"))),
        ],
        footerItems: [
          PaneItem(
            icon: const Icon(FluentIcons.megaphone),
            title: const Text("Whats New"),
            body: Container(),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.settings),
            title: const Text('Settings'),
            body: Container(),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.sign_out),
            title: const Text("Sign out"),
            body: const Center(child: Text("Sign Out")),
          ),
        ],
      ),
    );
  }
}
