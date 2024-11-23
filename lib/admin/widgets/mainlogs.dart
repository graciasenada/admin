import 'dart:convert';

import 'package:admin/src/config/dependency_injector.dart';
import 'package:flutter/material.dart' as m3;

import 'package:data_table_2/data_table_2.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Mainlogs extends ConsumerStatefulWidget {
  const Mainlogs({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainlogsState();
}

class _MainlogsState extends ConsumerState<Mainlogs> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fetchUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          final data = snapshot.data as List<Map<String, dynamic>>;
          final users = data.map((e) {
            return {
              'role': e['role'],
              'name': e['name'],
              'email': e['email'],
              'status': e['status'],
              'last_activity': e['last_activity'],
              "user_ID": e['user_ID']
            };
          }).toList();
          return ScaffoldPage(
              content: m3.Material(
            child: DataTable2(
                showCheckboxColumn: false,
                minWidth: 600,
                //onSelectAll: (value) => print('Select all'),
                columns: const [
                  DataColumn2(label: Text('User ID')),
                  DataColumn2(label: Text('Name')),
                  DataColumn2(label: Text('Email')),
                  DataColumn2(label: Text('Role')),
                  DataColumn2(label: Text('Activity')),
                  DataColumn2(label: Text('Date')),
                  DataColumn2(label: Text('Time')),
                  DataColumn2(label: Text('Status')),
                  DataColumn2(label: Text('Resource')),
                  DataColumn2(label: Text('Device')),
                  DataColumn2(label: Text('Location')),
                ],
                rows: users.map((user) {
                  return DataRow(
                    cells: [
                      DataCell(Text(user['user_ID'])),
                      DataCell(Text(user['name'])),
                      DataCell(Text(user['email'])),
                      DataCell(Text(user['role'])),
                      DataCell(Text(user['last_activity'][0]["event"])),
                      DataCell(Text(user['last_activity'][0]["time"])),
                      DataCell(Text(user['last_activity'][0]["time"])),
                      DataCell(Text(user['status'])),
                      DataCell(Text(user['last_activity'][0]["deviceName"])),
                      DataCell(Text(user['last_activity'][0]["deviceName"])),
                      DataCell(Text(user['last_activity'][0]["countryName"])),
                    ],
                  );
                }).toList()),
          ));
        }
      },
    );
  }

  Future<List<Map<String, dynamic>>> _fetchUser() async {
    final functionResponse = await function.createExecution(
      functionId: "672caea76f89b89e78fc",
      body: "users",
    );

    final fromJson = jsonDecode(functionResponse.responseBody);

    final usersList = (fromJson['data'] as List).map((user) {
      return {
        'name': user['name'],
        'email': user['email'],
        'role': user['role'],
        'last_activity': user['last_activity'],
        'user_ID': user['user_ID'],
        'status': "test",
      };
    }).toList();

    return usersList;
  }
}
