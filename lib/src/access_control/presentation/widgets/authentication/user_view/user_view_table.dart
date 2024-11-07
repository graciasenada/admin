import 'package:flutter/material.dart';

import 'package:data_table_2/data_table_2.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class UserViewTable extends ConsumerStatefulWidget {
  const UserViewTable(this.users, {super.key});

  final List<Map<String, dynamic>> users;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserViewTableState();
}

class _UserViewTableState extends ConsumerState<UserViewTable> {
  final int _rowsPerPage = 20;
  final int _currentPage = 0;
  Set<String> _selectedEmails = {};
  bool _selectAll = false;

  Future<void> _sendEmergencyPasswordChangeNotification() async {
    if (_selectedEmails.isEmpty) {
      await fluent.showDialog(
        context: context,
        builder: (context) => fluent.ContentDialog(
          title: const Text('No Users Selected'),
          content: const Text('Please select at least one user to notify.'),
          actions: [
            fluent.Button(
              child: const Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
      return;
    }

    // Implementation for sending notifications
    // Add your notification logic here
  }

  @override
  Widget build(BuildContext context) {
    final int totalRows = widget.users.length;
    final int startIndex = _currentPage * _rowsPerPage;
    final int endIndex = (startIndex + _rowsPerPage < totalRows)
        ? startIndex + _rowsPerPage
        : totalRows;
    final currentPageUsers = widget.users.sublist(startIndex, endIndex);
    return SizedBox(
      height: MediaQuery.of(context).size.height -
          100, // Adjust this value based on your needs
      child: Stack(
        children: [
          PaginatedDataTable2(
            source: _UserDataSource(
              data: currentPageUsers,
              selectedEmails: _selectedEmails,
              onSelectChanged: (email, selected) {
                setState(() {
                  if (selected != null && selected) {
                    _selectedEmails.add(email);
                  } else {
                    _selectedEmails.remove(email);
                  }
                });
              },
              context: context,
            ),
            showCheckboxColumn: true,
            onSelectAll: (value) {
              setState(() {
                _selectAll = value ?? false;
                _selectedEmails = _selectAll
                    ? currentPageUsers.map((u) => u['email'].toString()).toSet()
                    : {};
              });
            },
            columns: const [
              DataColumn2(label: Text('Name')),
              DataColumn2(label: Text('Email')),
              DataColumn2(label: Text('Verification')),
              DataColumn2(label: Text('Status')),
              DataColumn2(label: Text('MFA')),
              DataColumn2(label: Text('Password Last Updated')),
              DataColumn2(label: Text('Password Expiration')),
            ],
            horizontalMargin: 20,
            rowsPerPage: _rowsPerPage,
          ),
          Positioned(
            bottom: 0,
            right: 250,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: fluent.FilledButton(
                onPressed: _sendEmergencyPasswordChangeNotification,
                child:
                    const Text('Send Emergency Password Change Notification'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _UserDataSource extends DataTableSource {
  final List<Map<String, dynamic>> data;
  final Set<String> selectedEmails;
  final Function(String, bool?) onSelectChanged;
  final BuildContext context;

  _UserDataSource({
    required this.data,
    required this.selectedEmails,
    required this.onSelectChanged,
    required this.context,
  });

// TODO Status -> get online / offline, not true or false
// Same format for Status (online / offline) and MFA (enabled / disabled)
  Widget _statusIndicator(String status, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            status,
            style: TextStyle(
              color: color,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _verificationBadge(String value) {
    final isVerified = value == "email verified" ||
        value == "phone verified" ||
        value == "verified";

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isVerified
            ? Colors.green.withOpacity(0.1)
            : Colors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: isVerified ? Colors.green : Colors.red,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            isVerified ? 'verified' : 'unverified',
            style: TextStyle(
              color: isVerified ? Colors.green : Colors.red,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  @override
  DataRow? getRow(int index) {
    final item = data[index];
    final email = item['email'].toString();
    final pwUpdated = item['passwordLastUpdated'];
    // final pwExpiration = item['passwordExpiration'];
    final pwGracePeriod = item['passwordGracePeriod'];

    return DataRow(
      selected: selectedEmails.contains(email),
      onSelectChanged: (selected) => onSelectChanged(email, selected),
      cells: [
        DataCell(Text(item['name'].toString())),
        DataCell(Text(email)),
        DataCell(_verificationBadge(item['verified'])),
        DataCell(_statusIndicator(
          item['status'].toString(),
          item['status'] == 'online' ? Colors.green : Colors.grey,
        )),
        DataCell(_statusIndicator(
          item['mfa'] ? 'enabled' : 'disabled',
          item['mfa'] ? Colors.green : Colors.red,
        )),
        DataCell(Text(DateFormat.yMMMd().format(pwUpdated))),
        DataCell(Text(DateFormat.yMMMd().format(pwGracePeriod))),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => selectedEmails.length;
}
