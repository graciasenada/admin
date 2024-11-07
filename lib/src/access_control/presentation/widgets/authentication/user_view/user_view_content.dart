import 'dart:convert';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:admin/src/access_control/presentation/widgets/authentication/user_view/user_view_table.dart';
// import 'package:data_table_2/data_table_2.dart';
import 'package:admin/src/config/dependency_injector.dart';

class UserViewContent extends ConsumerStatefulWidget {
  const UserViewContent({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UserViewContentState();
}

class _UserViewContentState extends ConsumerState<UserViewContent> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      content: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // TODO Insert "Notify emergency password change" button at the bottom
                FutureBuilder(
                  future: _fetchUser(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const ProgressRing();
                    } else {
                      final data = snapshot.data as List<Map<String, dynamic>>;
                      return UserViewTable(data);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<List<Map<String, dynamic>>> _fetchUser() async {
    final adminConfig = await database.getDocument(
      collectionId: "672750f0003bc4d3e919",
      documentId: "67275172001c3d9c58f3",
      databaseId: "65cc1cdadb3c9b2ded7a",
    );

    final config = adminConfig.data["pwExpiration"];
    final configFinal = adminConfig.data["pwGracePeriod"];

    final functionResponse = await function.createExecution(
      functionId: "672733a50032335e76bc",
      body: "users",
    );

    final fromJson = jsonDecode(functionResponse.responseBody);

    final usersList = (fromJson['data'] as List).map((user) {
      final passwordLastUpdated = DateTime.parse(user['password-last-updated']);
      final passwordExpiration = passwordLastUpdated.add(Duration(
          days: config
              as int)); // dapat machange ito based sa configured password expiration
      final passwordGracePeriod =
          passwordExpiration.add(Duration(days: configFinal as int));

      return {
        'name': user['name'],
        'email': user['email'],
        'verified': user['email-verification']
            ? "email verified"
            : user['phone-verification']
                ? "phone verified"
                : user['phone-verification'] && user['email-verification']
                    ? "verified"
                    : "unverified",
        'status': user['status'],
        'mfa': user['mfa'],
        'passwordLastUpdated': passwordLastUpdated,
        'passwordExpiration': passwordExpiration,
        'passwordGracePeriod': passwordGracePeriod,
      };
    }).toList();

    return usersList;
  }
}
