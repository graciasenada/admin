import 'package:fluent_ui/fluent_ui.dart';

import 'package:admin/src/features/authentication/authentication.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Returning the FluentApp widget with the necessary configurations
    return const FluentApp(
        debugShowCheckedModeBanner: false, home: SignInScreen());
  }
}
