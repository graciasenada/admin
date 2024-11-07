import 'package:appwrite/appwrite.dart';

late final Client client;
late final Databases database;
late final Account account;
late final Functions function;

class DependencyInjector {
  static final DependencyInjector _instance = DependencyInjector._internal();

  factory DependencyInjector() {
    return _instance;
  }

  DependencyInjector._internal();

  Future<void> initialize() async {
    client = Client();
    client
        .setEndpoint("https://cloud.otoscopia.tech/v1")
        .setProject("65a2440134e8348967fa");
    database = Databases(client);
    account = Account(client);
    function = Functions(client);
  }
}
