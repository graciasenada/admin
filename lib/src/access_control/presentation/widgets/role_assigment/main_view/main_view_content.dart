import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      content: SingleChildScrollView(
        child: Padding(
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
                    child: const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              SizedBox(width: 13),
                              Text("Name",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(width: 500),
                              Text("Type",
                                  style: TextStyle(fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),

                  // Doctor dropdown
                  const Expander(
                    // leading: ,
                    header: Row(
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
                          title: Text("Usha Cobrado",
                              style: TextStyle(fontSize: 14)),
                        ),
                        ListTile(
                          title:
                              Text("Dr. Isla", style: TextStyle(fontSize: 14)),
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
                          title:
                              Text("Dr. Isla", style: TextStyle(fontSize: 14)),
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
                          title:
                              Text("Dr. Isla", style: TextStyle(fontSize: 14)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
