import 'package:fluent_ui/fluent_ui.dart';

import 'package:admin/src/app.dart';
import 'package:admin/src/dependency_injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjector().initialize();
  runApp(const MyApp()); // Running the app in debug mode.
}
