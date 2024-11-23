import 'package:fluent_ui/fluent_ui.dart';

class UserManageView extends StatelessWidget {
  const UserManageView({super.key});

  //TODO: still to do UI design as it is dependent on the user clicked from the 'Users' table
  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: const Text("Manage User Account"),
      content: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Email: user@example.com"),
            Text("Joined Date: 2024-10-01"),
            Text("Last Activity: 2024-10-28"),
          ],
        ),
      ),
    );
  }
}
