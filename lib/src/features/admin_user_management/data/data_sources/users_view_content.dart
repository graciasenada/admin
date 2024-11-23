import 'dart:convert';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:admin/src/dependency_injector.dart';
import 'package:admin/src/features/admin_user_management/presentation/widgets/users_table.dart';

//TODO: CANNOT REFLECT DATA FROM APPWRITE
class UsersViewContent extends ConsumerStatefulWidget {
  const UsersViewContent({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UsersViewContentState();
}

class _UsersViewContentState extends ConsumerState<UsersViewContent> {
  late Future<void> _initializeFuture;

  @override
  void initState() {
    super.initState();
    _initializeFuture = DependencyInjector().initialize();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      content: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26.0),
          child: FutureBuilder(
            future: _initializeFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const ProgressRing();
              } else if (snapshot.hasError) {
                return Center(
                    child: Text('Initialization error: ${snapshot.error}'));
              } else {
                return FutureBuilder(
                  future: _fetchUser(),
                  builder: (context, userSnapshot) {
                    if (userSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const ProgressRing();
                    } else if (userSnapshot.hasError) {
                      return Center(
                          child: Text('Error: ${userSnapshot.error}'));
                    } else if (!userSnapshot.hasData ||
                        (userSnapshot.data as List).isEmpty) {
                      return Center(child: Text('No user data available'));
                    } else {
                      final data =
                          userSnapshot.data as List<Map<String, dynamic>>;
                      return UserTable(data);
                    }
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }

  // Function to fetch users from Appwrite and the server function
  Future<List<Map<String, dynamic>>> _fetchUser() async {
    try {
      final functionResponse = await function.createExecution(
        functionId: "672733a50032335e76bc",
        body: "users",
      );

      final fromJson = jsonDecode(functionResponse.responseBody);

      final usersList = (fromJson['data'] as List).map((user) {
        return {
          'name': user['name'],
          'role': user['labels'],
          'createdAt': DateTime.parse(user['joined']).toString(),
          'status': user['status'],
          'action': 'Activated',
        };
      }).toList();

      return usersList;
    } catch (error) {
      throw Exception("Failed to fetch user data: $error");
    }
  }
}
