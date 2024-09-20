import 'package:flutter/material.dart' as m3;

import 'package:data_table_2/data_table_2.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserView extends ConsumerStatefulWidget {
  const UserView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserViewState();
}

class _UserViewState extends ConsumerState<UserView> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      content: m3.Material(
        child: DataTable2(
            showCheckboxColumn: true,
            onSelectAll: (value) => print('Select all'),
            columns: const [
              DataColumn2(label: Text('Name')),
              DataColumn2(label: Text('Email')),
              DataColumn2(label: Text('Verification')),
              DataColumn2(label: Text('Status')),
              DataColumn2(label: Text('MFA')),
              DataColumn2(label: Text('Password Last Updated')),
              DataColumn2(label: Text('Password Expiration')),
            ],
            rows: [
              DataRow2(
                  onSelectChanged: (value) => print('Row selected'),
                  cells: const [
                    m3.DataCell(Text('Test 1')),
                    m3.DataCell(Text('Test 1')),
                    m3.DataCell(Text('Test 1')),
                    m3.DataCell(Text('Test 1')),
                    m3.DataCell(Text('Test 1')),
                    m3.DataCell(Text('Test 1')),
                    m3.DataCell(Text('Test 1')),
                  ]),
            ]),
      ),
    );
  }
}
