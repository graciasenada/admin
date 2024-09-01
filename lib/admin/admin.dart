import 'package:fluent_ui/fluent_ui.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  List<NavigationPaneItem> items = [
    PaneItem(
      icon: const Icon(FluentIcons.view_dashboard),
      title: const Text('Dashboard'),
      body: Text(
        "Test 1",
        style: TextStyle(color: Colors.black),
      ),
    ),
    PaneItem(
      icon: const Icon(FluentIcons.user_window),
      title: const Text('User Management'),
      body: Text("Test 2"),
    ),
    PaneItem(
      icon: const Icon(FluentIcons.contact_list),
      title: const Text('Access Control List'),
      body: Text("Test 2"),
    ),
    PaneItem(
      icon: const Icon(FluentIcons.compliance_audit),
      title: const Text('Audit Logs'),
      body: Text("Test 3"),
    ),
  ];

  int topIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      padding: EdgeInsets.zero,
      content: NavigationView(
        appBar: const NavigationAppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Otoscopia',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500), 
          ),
          actions: Center(child: Text("Admin")),
        ),
        pane: NavigationPane(
          selected: topIndex,
          onItemPressed: (index) {},
          onChanged: (index) => setState(() => topIndex = index),
          displayMode: PaneDisplayMode.minimal,
          items: items,
          footerItems: [
            PaneItem(
              icon: const Icon(FluentIcons.settings),
              title: const Text('Settings'),
              body: Container(),
            ),
            PaneItemAction(
              icon: const Icon(FluentIcons.add),
              title: const Text('Add New Item'),
              onTap: () {
                // Your Logic to Add New `NavigationPaneItem`
                items.add(
                  PaneItem(
                    icon: const Icon(FluentIcons.new_folder),
                    title: const Text('New Item'),
                    body: const Center(
                      child: Text(
                        'This is a newly added Item',
                      ),
                    ),
                  ),
                );
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
