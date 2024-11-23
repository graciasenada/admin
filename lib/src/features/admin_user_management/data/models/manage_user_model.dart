//TODO: THIS ID FOR MANAGING THE USER LIFECYCLE TO ACTIVATE/DEACTIVATE
//trying to implement the user management model like on what kuya did
class ManageUserModel {
  final String id;
  final String name;
  final String email;
  final String avatarUrl;
  final String status;
  final DateTime joinedDate;
  final DateTime lastActivity;

  ManageUserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.avatarUrl,
    required this.status,
    required this.joinedDate,
    required this.lastActivity,
  });
}
