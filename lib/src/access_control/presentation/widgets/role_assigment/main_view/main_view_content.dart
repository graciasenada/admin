import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:admin/src/access_control/presentation/providers/checkbox_provider.dart';
import 'package:admin/src/access_control/presentation/providers/checkbox_provider2.dart';
import 'package:admin/src/access_control/presentation/widgets/role_assigment/main_view/main_view_header.dart';

class MainViewContent extends ConsumerStatefulWidget {
  const MainViewContent({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MainViewContentState();
}

class _MainViewContentState extends ConsumerState<MainViewContent> {
  bool? checked = false;

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26.0),
        child: Column(
          children: [
            const Header(),
            const SizedBox(height: 16),
            Column(
              children: [
                // Subheader
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // border: Border.all(color: con  st Color(0xFFA0A0A0)),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            // Checkbox w/ 3 modes: Partial selection, select all, and unselected
                            Checkbox(
                              // ref.watch if nagcheck ka lng ng value
                              // ref.read if magrun ka ng function

                              checked: ref.watch(checkboxProvider),
                              onChanged: (v) {
                                ref
                                    .read(checkboxProvider.notifier)
                                    .toggle(v == true
                                        ? true
                                        : v == false
                                            ? null
                                            : v == null
                                                ? false
                                                : true);
                              },
                            ),

                            const SizedBox(width: 13),
                            const Text("Name",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(width: 500),
                            const Text("Type",
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 18),

                // Doctor dropdown
                Expander(
                  // leading: ,
                  header: const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(FluentIcons.medical),
                      ),
                      Text(
                        "Doctor",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  content: Column(
                    children: [
                      ListTile(
                        title: Row(
                          children: [
                            Checkbox(
                              // ref.watch if nagcheck ka lng ng value
                              // ref.read if magrun ka ng function

                              // iba nanaman na provider
                              checked: ref.watch(checkboxProvider2),
                              onChanged: (v) {
                                ref.read(checkboxProvider2.notifier).toggle(v);
                              },
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.0),
                            ),
                            const Text("Usha Cobrado",
                                style: TextStyle(fontSize: 14)),
                          ],
                        ),
                      ),
                      const ListTile(
                        title: Text("Dr. Isla", style: TextStyle(fontSize: 14)),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 4),

                // Nurse dropdown
                const Expander(
                  header: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(FluentIcons.medical),
                      ),
                      Text("Nurse",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  content: Column(
                    children: [
                      ListTile(
                        title: Text("Usha Cobrado",
                            style: TextStyle(fontSize: 14)),
                      ),
                      ListTile(
                        title: Text("Dr. Isla", style: TextStyle(fontSize: 14)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),

                // IAM Administrator dropdown
                const Expander(
                  header: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(FluentIcons.medical),
                      ),
                      Text("IAM Administrator",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  content: Column(
                    children: [
                      ListTile(
                        title: Text("Usha Cobrado",
                            style: TextStyle(fontSize: 14)),
                      ),
                      ListTile(
                        title: Text("Dr. Isla", style: TextStyle(fontSize: 14)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
