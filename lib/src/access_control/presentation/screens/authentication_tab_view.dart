import 'package:fluent_ui/fluent_ui.dart';

// TODO Transport to Authentication branch and connect with database - table
import 'package:admin/src/access_control/presentation/widgets/authentication/configuration/config_content.dart';
import 'package:admin/src/access_control/presentation/widgets/authentication/user_view/user_view_content.dart';

class AuthenticationTab extends StatefulWidget {
  const AuthenticationTab({super.key});

  @override
  State<AuthenticationTab> createState() => _AuthenticationTabState();
}

class _AuthenticationTabState extends State<AuthenticationTab> {
  int currentIndex = 0;
  List<Tab> tabs = [
    // placeholder yung "data" sa body, to be replaced by sub-tabs later
    Tab(
        icon: const Icon(FluentIcons.group),
        text: const Text("Users"),
        body: const UserViewContent()),
    Tab(
        icon: const Icon(FluentIcons.settings),
        text: const Text("Configuration"),
        body: const ConfigurationContent()),
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
