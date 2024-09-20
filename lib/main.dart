import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:admin/src/app.dart';
import 'package:admin/src/config/dependency_injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjector().initialize();
  runApp(const ProviderScope(child: MyApp())); // Running the app in debug mode.
}
