import 'package:flutter/material.dart' as m3;

import 'package:data_table_2/data_table_2.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:admin/src/features/admin_user_management/presentation/screens/user_manage_view.dart';

import '../providers/manage_users_provider.dart';

class UserTable extends ConsumerStatefulWidget {
  const UserTable(this.users, {super.key});

  final List<Map<String, dynamic>> users;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserTableState();
}

//TODO: CANNOT REFLECT DATA FROM APPWRITE
class _UserTableState extends ConsumerState<UserTable> {
  final int _rowsPerPage = 20;
  final int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final int totalRows = widget.users.length;
    final int startIndex = _currentPage * _rowsPerPage;
    final int endIndex = (startIndex + _rowsPerPage < totalRows)
        ? startIndex + _rowsPerPage
        : totalRows;
    final currentPageUsers = widget.users.sublist(startIndex, endIndex);
    return SizedBox(
      height: MediaQuery.of(context).size.height - 100,
      child: Stack(
        children: [
          PaginatedDataTable2(
            source: _UserDataSource(
              data: currentPageUsers,
              context: context,
              ref: ref,
            ),
            columns: const [
              DataColumn2(label: Text('Name')),
              DataColumn2(label: Text('Role')),
              DataColumn2(label: Text('Created At')),
              DataColumn2(label: Text('Status')),
              DataColumn2(label: Text('Action')),
              DataColumn2(label: Text('Management')),
            ],
            horizontalMargin: 20,
            rowsPerPage: _rowsPerPage,
          ),
        ],
      ),
    );
  }
}

class _UserDataSource extends m3.DataTableSource {
  final List<Map<String, dynamic>> data;
  final BuildContext context;
  final WidgetRef ref;
  bool isHoveringManage = false;

  _UserDataSource(
      {required this.data, required this.context, required this.ref});

// Status indicator for online/offline
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

  @override
  DataRow2? getRow(int index) {
    final item = data[index];
    final createdAt = item['createdAt']; // Assuming createdAt is a DateTime

    return DataRow2(
      cells: [
        // Name column
        m3.DataCell(Text(item['name'].toString())),

        // Role column
        m3.DataCell(
            Text(item['role'].toString())), // Assuming role is a string field

        // Created At column
        m3.DataCell(Text(
            DateFormat('yMMMd HH:mm').format(createdAt))), // Format createdAt

        // Status column (online/offline)
        m3.DataCell(_statusIndicator(
          item['status'].toString(),
          item['status'] == 'online' ? Colors.green : Colors.grey,
        )),

        // Action column (not specified, so assume it's a simple text)
        m3.DataCell(Text(
            'Activated')), // Placeholder for action (replace if you have action status)

        // Management column (action button or another widget, you can replace this)
        m3.DataCell(
          MouseRegion(
            onEnter: (_) => isHoveringManage = true,
            onExit: (_) => isHoveringManage = false,
            child: GestureDetector(
              onTap: () {
                if (context.mounted) {
                  ref.read(manageUserAccountTabsProvider.notifier).addTab(
                        Tab(
                          text: const Text('Manage User Account'),
                          icon: const Icon(FluentIcons.user_window),
                          body: UserManageView(),
                          onClosed: () {
                            if (context.mounted) {
                              ref
                                  .read(manageUserAccountTabsProvider.notifier)
                                  .removeTab(1);
                              ref
                                  .read(manageUserAccountProvider.notifier)
                                  .onClosed();
                            }
                          },
                        ),
                      );
                  ref.read(manageUserAccountProvider.notifier).increment(1);
                }
              },
              child: Text(
                'Manage',
                style: TextStyle(
                  color: isHoveringManage
                      ? const Color(0xFF95b1ae)
                      : const Color(0xFF4a6361),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
