import 'package:fluent_ui/fluent_ui.dart';

import 'package:admin/src/features/admin/presentation/screens/dashboard.dart';
import 'package:admin/src/features/authentication/presentation/widgets/logo.dart';

class SidePaneEntity extends StatefulWidget {
  const SidePaneEntity({super.key});

  @override
  State<SidePaneEntity> createState() => _SidePaneEntityState();
}

class _SidePaneEntityState extends State<SidePaneEntity> {
  List<NavigationPaneItem> items = [
    PaneItem(
      icon: const Icon(FluentIcons.view_dashboard),
      title: const Text('Dashboard'),
      body: const Dashboard(),
    ),
    PaneItem(
      icon: const Icon(FluentIcons.user_window),
      title: const Text('User Management'),
      body: const Center(child: Text("User Management Content")),
    ),
    PaneItem(
        icon: const Icon(FluentIcons.contact_list),
        title: const Text('Access Control List'),
        body: const Center(child: Text("Access Control List Content"))),
    PaneItem(
      icon: const Icon(FluentIcons.compliance_audit),
      title: const Text('Audit Logs'),
      body: const Center(child: Text("Audit Logs Content")),
    ),
  ];

  int topIndex = 0;
  PaneDisplayMode displayMode = PaneDisplayMode.compact;

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      pane: NavigationPane(
        size: const NavigationPaneSize(openMaxWidth: 300),
        selected: topIndex,
        onItemPressed: (index) {},
        onChanged: (index) => setState(() => topIndex = index),
        displayMode: displayMode,
        header: displayMode == PaneDisplayMode.compact
            ? const Padding(
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
              )
            : null,
        items: items,
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
            body: const Center(child: Text("Audit Logs Content")),
          ),
        ],
      ),
    );
  }
}
