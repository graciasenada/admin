import 'package:flutter/material.dart';

import 'package:appwrite/models.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateTeamRoleFilterNotifier
    extends StateNotifier<List<Map<String, dynamic>>> {
  CreateTeamRoleFilterNotifier() : super([]);

  void addFilter(DocumentList filter) {
    final data = filter.documents.map((e) {
      final user = e.data;
      return {
        'role': user['role'],
        'name': user['name'],
        'email': user['email'],
      };
    }).toList();

    state = data;
  }

  void filterByRole(String role) {
    state = [
      ...state.where((element) => element['role'] == role),
      ...state.where((element) => element['role'] != role),
    ];
  }

  List<DataRow2> filter(List<Map<String, dynamic>> value) => value.map((value) {
        return DataRow2(
          onSelectChanged: (value) => print('Row selected'),
          cells: [
            DataCell(Text(value['name'])),
            DataCell(Text(value['email'])),
            DataCell(Text(value['role'])),
          ],
        );
      }).toList();
}

final createTeamRoleFilterProvider = StateNotifierProvider<
    CreateTeamRoleFilterNotifier, List<Map<String, dynamic>>>((ref) {
  return CreateTeamRoleFilterNotifier();
});

class CreateTeamRoleEntity {
  final String role;
  final String name;
  final String email;

  CreateTeamRoleEntity({
    required this.role,
    required this.name,
    required this.email,
  });

  factory CreateTeamRoleEntity.fromJson(Map<String, dynamic> json) {
    return CreateTeamRoleEntity(
      role: json['role'],
      name: json['name'],
      email: json['email'],
    );
  }
}
