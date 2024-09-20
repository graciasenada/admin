import 'package:flutter/material.dart' as m3;

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:admin/src/access_control/presentation/providers/create_tabs_provider.dart';

class Header extends ConsumerWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Search bar
        SizedBox(
          width: 400,
          child: m3.Material(
            child: m3.TextField(
              decoration: m3.InputDecoration(
                border: m3.OutlineInputBorder(
                    // borderSide: m3.BorderSide(color: Colors.magenta),
                    borderRadius: m3.BorderRadius.circular(5.0)),
                labelText: 'Search by name or role',
                labelStyle:
                    const TextStyle(fontSize: 14, color: Color(0xFFA0A0A0)),
                suffixIcon: const Icon(FluentIcons.search,
                    // 0xFF ang starting before ang HEX color code
                    color: Color(0xFFADADAD),
                    size: 20.0),
              ),
            ),
          ),
        ),

        const SizedBox(width: 14),

        // Create Team and Remove buttons
        Row(
          children: [
            FilledButton(
              style: ButtonStyle(
                backgroundColor:
                    WidgetStateProperty.all(const Color(0xFF068282)),
              ),
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(FluentIcons.add_friend),
                        SizedBox(width: 10),
                        Text("Create Team"),
                      ],
                    ),
                  ),
                ],
              ),
              onPressed: () {
                ref.read(createTeamProvider.notifier).generateTab(1);
                ref.read(createTeamProvider.notifier).increment(1);
              },
            ),
            const SizedBox(width: 14),
            FilledButton(
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all(const Color(0xFFFFFFFF)),
                  // shadowColor: WidgetStateProperty.all(Colors.transparent),
                ),
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            FluentIcons.user_remove,
                            color: Colors.black,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Remove",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                onPressed: () {}),
          ],
        )
      ],
    );
  }
}
