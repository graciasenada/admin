import 'package:admin/admin/widgets/dashboardbox.dart';
import 'package:fluent_ui/fluent_ui.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return const ScaffoldPage(
      padding: EdgeInsets.zero,
      content: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: [
            Row(
              children: [
                Dashboardbox(
                  title: "Total Users",
                  value: "100",
                  icon: "users",
                ),
                SizedBox(width: 15),
                Dashboardbox(
                  title: "Total Roles",
                  value: "100",
                  icon: "roles",
                ),
                SizedBox(width: 15),
                Dashboardbox(
                  title: "Total Teams",
                  value: "100",
                  icon: "teams",
                ),
                SizedBox(width: 15),
                Dashboardbox(
                  title: "Total Patient Files",
                  value: "100",
                  icon: "files",
                ),
                SizedBox(width: 15),
                Dashboardbox(
                  title: "Total Access Rights",
                  value: "100",
                  icon: "rights",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
