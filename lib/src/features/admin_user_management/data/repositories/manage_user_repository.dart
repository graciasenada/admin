import 'package:admin/src/features/admin_user_management/data/models/models.dart';

//TODO: change with real data from Appwrite
class ManageUserRepository {
  Future<ManageUserModel> fetchUserById(String userId) async {
    // Simulate fetching user data; replace with Appwrite fetch code.
    return ManageUserModel(
      id: userId,
      name: 'Usha Cobrador',
      email: 'ushanicoole@gmail.com',
      avatarUrl: 'https://example.com/avatar.jpg',
      status: 'Activated',
      joinedDate: DateTime(2024, 6, 29, 15, 36),
      lastActivity: DateTime(2024, 6, 30, 13, 6),
    );
  }
}
