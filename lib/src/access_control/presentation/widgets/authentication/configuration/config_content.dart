// TODO Connect to database

import 'dart:ui';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:admin/src/access_control/presentation/providers/set_expiration_day.dart';
import 'package:admin/src/access_control/presentation/providers/set_pw_grace_period.dart';
import 'package:admin/src/config/dependency_injector.dart';

class ConfigurationContent extends ConsumerStatefulWidget {
  const ConfigurationContent({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ConfigurationContentState();
}

class _ConfigurationContentState extends ConsumerState<ConfigurationContent> {
  bool checked = false;
  List<ComboBoxItem<String>> days = [
    const ComboBoxItem<String>(value: '60 days', child: Text('60 days')),
    const ComboBoxItem<String>(value: '90 days', child: Text('90 days')),
    const ComboBoxItem<String>(value: '180 days', child: Text('180 days')),
    const ComboBoxItem<String>(value: '270 days', child: Text('270 days')),
    const ComboBoxItem<String>(
        value: '365 days (1 year)', child: Text('365 days (1 year)')),
  ];

  List<ComboBoxItem<String>> gracePeriods = [
    const ComboBoxItem<String>(value: '1 day', child: Text('1 day')),
    const ComboBoxItem<String>(value: '2 days', child: Text('2 days')),
    const ComboBoxItem<String>(value: '3 days', child: Text('3 days')),
    const ComboBoxItem<String>(value: '4 days', child: Text('4 days')),
    const ComboBoxItem<String>(value: '5 days', child: Text('5 days')),
    const ComboBoxItem<String>(value: '6 days', child: Text('6 days')),
    const ComboBoxItem<String>(
        value: '7 days (1 week)', child: Text('7 days (1 week)')),
  ];

  String selectedDay = '60 days';
  String selectedGracePeriod = '1 day';

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      content: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 26),
          child: Column(
            children: [
              const SizedBox(
                width: 605,
                child: Text(
                  "Settings",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 30),

// Password expiration duration

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Password expiration duration"),
                  const SizedBox(width: 100),
                  SizedBox(
                    width: 300,
                    child: ComboBox<String>(
                      isExpanded: true,
                      value: ref.watch(setExpirationDayProvider),
                      items: days.map<ComboBoxItem<String>>((e) {
                        return ComboBoxItem<String>(
                          value: e.value,
                          child: e.child,
                        );
                      }).toList(),
                      onChanged: (day) {
                        ref
                            .read(
                              setExpirationDayProvider.notifier,
                            )
                            .setDay(day!);
                      },
                      placeholder: const Text('Select an option'),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

// Password expiration grace period
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Password expiration grace period"),
                  const SizedBox(width: 100),
                  SizedBox(
                    width: 275,
                    child: ComboBox<String>(
                      isExpanded: true,
                      value: ref.watch(setPwGracePeriodProvider),
                      items: gracePeriods.map<ComboBoxItem<String>>((e) {
                        return ComboBoxItem<String>(
                          value: e.value,
                          child: e.child,
                        );
                      }).toList(),
                      onChanged: (day) {
                        ref
                            .read(
                              setPwGracePeriodProvider.notifier,
                            )
                            .setGracePeriod(day!);
                      },
                      placeholder: const Text('Select an option'),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

// TODO: Timeout session connect to database
// Idle session timeout (in minutes)
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Idle session timeout (in minutes)"),
                  SizedBox(width: 105),
                  SizedBox(
                    width: 300,
                    child: Expander(
                      header: Text("Select an option"),
                      content: Column(
                        children: [
                          ListTile(
                            title: Text("15 minutes"),
                          ),
                          ListTile(
                            title: Text("30 minutes"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

// TODO: Mandatory MFA connect to database
// Mandatory multi-factor authentication
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Mandatory multi-factor authentication"),
                  const SizedBox(width: 70),
                  SizedBox(
                    width: 300,
                    child: Row(
                      children: [
                        const Text("Off"),
                        const SizedBox(width: 10),
                        ToggleSwitch(
                          checked: checked,
                          style: ToggleSwitchThemeData(
                            checkedDecoration: WidgetStateProperty.all(
                              BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xFF4DDB8E),
                              ),
                            ),
                            uncheckedDecoration: WidgetStateProperty.all(
                              BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xFFDB594D),
                              ),
                            ),
                          ),
                          onChanged: (v) {
                            setState(() {
                              checked = v;
                            });
                          },
                        ),
                        const SizedBox(width: 10),
                        const Text("On"),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 60),

// Update button
              SizedBox(
                width: 605,
                child: Row(
                  children: [
                    const SizedBox(width: 475),
                    FilledButton(
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(const Color(0xFF068282)),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 30),
                            child: Text("Update"),
                          ),
                        ],
                      ),
                      onPressed: () {
                        database.updateDocument(
                          collectionId: "672750f0003bc4d3e919",
                          documentId: "67275172001c3d9c58f3",
                          databaseId: "65cc1cdadb3c9b2ded7a",
                          data: {
                            "pwExpiration": int.parse(ref
                                .read(setExpirationDayProvider)
                                .split(' ')[0]),
                            "pwGracePeriod": int.parse(ref
                                .read(setPwGracePeriodProvider)
                                .split(' ')[0]),
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
